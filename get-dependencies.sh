#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
#pacman -Syu --noconfirm conky

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
export PRE_BUILD_CMDS="
	sed -i -e 's|-D BUILD_DOCS=ON|-D BUILD_DOCS=ON -DBUILD_AUDACIOUS=ON|' ./PKGBUILD
"
make-aur-package --archlinux-pkg conky

# If the application needs to be manually built that has to be done down here

# if you also have to make nightly releases check for DEVEL_RELEASE = 1
#
# if [ "${DEVEL_RELEASE-}" = 1 ]; then
# 	nightly build steps
# else
# 	regular build steps
# fi
