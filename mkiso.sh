#!/bin/sh

mkdir build
cd ../arch-couple-calamares/calamares/build

cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DWITH_QT6=ON -DWITH_KF6=ON -DWITH_KPMCORE=ON -DWITH_PYTHON=ON ..
make -j $(nproc)
make DESTDIR=$PWD/install_root install

cp -r install_root/usr/ ../../../arch-couple-iso/archiso/installer-profile/airootfs/

cd ../../../arch-couple-iso
sudo mkarchiso -v -r -w /tmp/archiso-temp -o build/ archiso/installer-profile/