#!/bin/bash
# (c) 2015  Jan-Simon Möller, dl9pf@gmx.de
# GPLv2
#set -x

GIT=false
TAR=true

if test x"$1" == x"--tar";then
TAR=true
GIT=false
fi

if test x"$1" == x"--git";then
TAR=false
GIT=true
fi


if test x"$1" == x"-h" -o x"$1" == x"--help"; then

    echo "Help:"
#    echo "  --git     - Use git/upstream/master"
    echo "  --tar     - Use tarballs [default]"

fi

echo "Welcome !"
echo ""
echo "We need to download a few files and"
echo "setup the pathnames."

echo "Press enter to continue or CTRL-C to abort!"
read aw

# YOCTO URLs
TAR_YOCTO=http://git.yoctoproject.org/cgit.cgi/poky/snapshot/poky-yocto-1.7.tar.bz2
FILE_YOCTO=poky-yocto-1.7.tar.bz2
GIT_YOCTO=git://git.yoctoproject.org/poky
BRANCH_YOCTO=dizzy
FOLDER_YOCTO=poky

# meta-raspberrypi URLs
TAR_RASPBERRYPI=http://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/snapshot/meta-raspberrypi-6c6f44136f7e1c97bc45be118a48bd9b1fef1072.tar.bz2
GIT_RASPBERRYPI=git://git.yoctoproject.org/meta-raspberrypi
FILE_RASPBERRYPI=meta-raspberrypi.tar.bz2
REVISION_RASPBERRYPI=6c6f44136f7e1c97bc45be118a48bd9b1fef1072
FOLDER_RASPBERRYPI=meta-rpi

# OE meta-multimedia URLs
TAR_MULTIMEDIA=https://github.com/openembedded/meta-openembedded/archive/dizzy.zip
GIT_MULTIMEDIA=https://github.com/openembedded/meta-openembedded.git
FILE_MULTIMEDIA=meta-openembedded.zip
BRANCH_MULTIMEDIA=dizzy
FOLDER_MULTIMEDIA=meta-multimedia


if $TAR ; then
echo ""
echo "Downloading needed files ..."
echo ""
mkdir -p DL
if test ! -f DL/$FILE_YOCTO; then wget -c -O DL/$FILE_YOCTO $TAR_YOCTO ; fi
if test ! -f DL/$FILE_RASPBERRYPI; then wget -c -O DL/$FILE_RASPBERRYPI $TAR_RASPBERRYPI ; fi
if test ! -f DL/$FILE_MULTIMEDIA; then wget -c -O DL/$FILE_MULTIMEDIA $TAR_MULTIMEDIA ; fi

echo ""
echo "Extracting files ..."
echo ""

mkdir -p BUILD
mkdir -p BUILD/$FOLDER_YOCTO BUILD/$FOLDER_RASPBERRYPI BUILD/$FOLDER_MULTIMEDIA

tar -C BUILD/$FOLDER_YOCTO --strip-components=1 -xf DL/$FILE_YOCTO
tar -C BUILD/$FOLDER_RASPBERRYPI --strip-components=1 -xf DL/$FILE_RASPBERRYPI

cd DL
rm -rf meta-openembedded-dizzy
unzip $FILE_MULTIMEDIA
cp -ar meta-openembedded-dizzy/$FOLDER_MULTIMEDIA ../BUILD/
cd ..

ln -sf ../meta-YoctoCamera BUILD/meta-YoctoCamera

fi

if $GIT ; then

echo "TODO"
fi