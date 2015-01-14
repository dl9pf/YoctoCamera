#!/bin/bash
# (c) 2015  Jan-Simon Möller, dl9pf@gmx.de
# GPLv2
#set -x

echo "Welcome !"
echo ""
echo "We need to setup the BSP layers and "
echo "the pathnames."

echo "Press enter to continue or CTRL-C to abort!"
read aw

# YOCTO URLs
FOLDER_YOCTO=poky

# meta-raspberrypi URLs
FOLDER_RASPBERRYPI=meta-rpi

# OE meta-multimedia URLs
FOLDER_MULTIMEDIA=meta-multimedia

# meta-YoctoCamera
FOLDER_YOCTOCAMERA=meta-YoctoCamera

cd BUILD
source $FOLDER_YOCTO/oe-init-build-env YoctoCamera

cp ../../conf/local.conf conf/
cp ../../conf/bblayers.conf conf/

