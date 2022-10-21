#!/usr/bin/env bash

#########################
# The command line help #
#########################
function  display_help {
    echo "Usage: $0 [AUR PKGBUILD] " >&2
    echo
    echo "   AUR PKGBUILD               must be existing PKGBUID in the AUR, (no version nrs)"
    echo "   -h, --help          		display this text"
    echo
    # echo some stuff here for the -a or --add-options 
    exit 1
}

################################
# Check if parameters options  #
# are given on the commandline #
################################
function main {
	mkdir -p "/opt/local/scripts/pkgbuilds/${PKG}"
	cd "/opt/local/scripts/pkgbuilds/${PKG}"
	wget -c $PKGBUILD_URL -O ${PKGBUILD}
	cp $PKGBUILD $PKG.install
	chmod +x $PKG.install
	bat $PKG.install
}

PKG=$1
PKGBUILD="${PKG}.PKGBUILD"
PKGBUILD_URL="https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=${PKG}" 
[[ -n $1 ]] 					&& main
[[ -z $1 ]] 					&& display_help
[[ $1 == "-h" || "--help" ]] 	&& display_help
