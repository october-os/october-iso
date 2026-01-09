#!/bin/sh

postinstallpath=archiso/installer-profile/airootfs/root/postinstall

mkdir $postinstallpath
cp docs/packages/base.md $postinstallpath/packages
cp docs/packages/aur.md $postinstallpath/aur

mkdir build
sudo mkarchiso -v -r -w /tmp/archiso-temp -o build/ archiso/installer-profile/
