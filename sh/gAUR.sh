#!/usr/bin/env bash
PKG=$1
PKGBUILD="${PKG}.PKGBUILD"
PKGBUILD_URL="https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=${PKG}" 

mkdir -p "/opt/local/scripts/pkgbuilds/${PKG}"
cd "/opt/local/scripts/pkgbuilds/${PKG}"

wget -c $PKGBUILD_URL -O ${PKGBUILD}
cp $PKGBUILD $PKG.install
chmod +x $PKG.install
vim $PKG.install
 

