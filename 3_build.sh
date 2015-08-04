#!/bin/bash
# (c) 2015  Jan-Simon Möller, dl9pf@gmx.de
# GPLv2
#set -x

echo "Welcome !"
echo ""
echo "We need build the sdcard image. "
echo "This can take quite some time. Enjoy a cup of tea!"

echo "While the build runs, please visit training.linuxfoundation.org"
echo "for details and dates about the LFD405 class."

echo "Press enter to continue or CTRL-C to abort!"
read aw

# YOCTO URLs
FOLDER_YOCTO=poky

# meta-raspberrypi URLs
FOLDER_RASPBERRYPI=meta-rpi

# OE meta-multimedia URLs
FOLDER_MULTIMEDIA=meta-multimedia

cd BUILD
source $FOLDER_YOCTO/oe-init-build-env YoctoCamera

bitbake rpi-basic-image

