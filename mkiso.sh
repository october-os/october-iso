#!/bin/sh

postinstallpath=archiso/installer-profile/airootfs/root/postinstall

mkdir -p $postinstallpath
cp docs/packages/base.md $postinstallpath/packages
cp docs/packages/aur.md $postinstallpath/aur

mkdir -p build
sudo mkarchiso -v -r -w /tmp/archiso-temp -o build/ archiso/installer-profile/
