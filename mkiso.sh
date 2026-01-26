#!/bin/sh

postinstallpath=archiso/installer-profile/airootfs/root/postinstall
zloginPath=archiso/installer-profile/airootfs/root/.zlogin
binPath=archiso/installer-profile/airootfs/usr/bin

mkdir -p $postinstallpath
cp docs/packages/base.md $postinstallpath/packages
cp docs/packages/aur.md $postinstallpath/aur

if [[ $# -eq 0 ]] ; then
    if [[ $(cat $zloginPath | grep mount) == *"#"* ]]; then
        sed -i '/mount -t virtiofs installer \/root\/installer/s/^#//g' $zloginPath
    fi

    mkdir -p build
    sudo mkarchiso -v -r -w /tmp/archiso-temp -o build/ archiso/installer-profile/

    exit 0
fi

if [[ "$1" -eq "release" ]] ; then
    rm -rf latest-release
    mkdir latest-release
    mkdir -p $binPath
    mkdir -p temp

    mkdir temp
    cd temp
    curl https://api.github.com/repos/october-os/october-installer/releases/latest | grep "browser_download_url\": \"" \
    | sed 's/"browser_download_url": //g' | xargs wget
    cd ..

    mv temp/october-installer $binPath

    if [[ $(cat $zloginPath | grep mount) != *"#"* ]]; then
        sed -i '/mount -t virtiofs installer \/root\/installer/s/^/#/g' $zloginPath
    fi

    sudo mkarchiso -v -r -w /tmp/archiso-temp -o latest-release/ archiso/installer-profile/

    rm -rf temp

    isoName=$(ls latest-release)
    name=october-linux
    currentDate=$(date +'%Y.%m.%d')

    mv latest-release/$isoName latest-release/"${name}.${currentDate}.iso"
fi
