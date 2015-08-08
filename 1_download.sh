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
TAR_YOCTO=http://git.yoctoproject.org/cgit.cgi/poky/snapshot/poky-yocto-1.8.tar.bz2
FILE_YOCTO=poky-yocto-1.8.tar.bz2
GIT_YOCTO=git://git.yoctoproject.org/poky
BRANCH_YOCTO=fido
FOLDER_YOCTO=poky

# meta-raspberrypi URLs
#TAR_RASPBERRYPI=http://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/snapshot/meta-raspberrypi-6c6f44136f7e1c97bc45be118a48bd9b1fef1072.tar.bz2
TAR_RASPBERRYPI=http://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/snapshot/meta-raspberrypi-7457bf182c8fd550ec877ecd786a3edd16e65495.tar.bz2
GIT_RASPBERRYPI=git://git.yoctoproject.org/meta-raspberrypi
FILE_RASPBERRYPI=meta-raspberrypi.tar.bz2
#REVISION_RASPBERRYPI=6c6f44136f7e1c97bc45be118a48bd9b1fef1072
REVISION_RASPBERRYPI=7457bf182c8fd550ec877ecd786a3edd16e65495
FOLDER_RASPBERRYPI=meta-rpi

# OE meta-multimedia URLs
#TAR_MULTIMEDIA=https://github.com/openembedded/meta-openembedded/archive/dizzy.zip
#TAR_MULTIMEDIA=https://github.com/openembedded/meta-openembedded/archive/fido.zip
TAR_MULTIMEDIA=https://github.com/openembedded/meta-openembedded/archive/7ca0d80cb6bba7b4a43e18df0d48bc1d66841a1c.zip
GIT_MULTIMEDIA=https://github.com/openembedded/meta-openembedded.git
FILE_MULTIMEDIA=meta-openembedded.zip
#BRANCH_MULTIMEDIA=fido
BRANCH_MULTIMEDIA=7ca0d80cb6bba7b4a43e18df0d48bc1d66841a1c
FOLDER_MULTIMEDIA=meta-multimedia

FOLDER_METAOE=meta-oe
FOLDER_NETWORKING=meta-networking
FOLDER_PYTHON=meta-python

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
rm -rf meta-openembedded-$BRANCH_MULTIMEDIA
unzip $FILE_MULTIMEDIA
cp -ar meta-openembedded-$BRANCH_MULTIMEDIA/$FOLDER_MULTIMEDIA ../BUILD/
cp -ar meta-openembedded-$BRANCH_MULTIMEDIA/$FOLDER_METAOE ../BUILD/
cp -ar meta-openembedded-$BRANCH_MULTIMEDIA/$FOLDER_NETWORKING ../BUILD/
cp -ar meta-openembedded-$BRANCH_MULTIMEDIA/$FOLDER_PYTHON ../BUILD/
cd ..

ln -sf ../meta-YoctoCamera BUILD/meta-YoctoCamera

fi

if $GIT ; then

echo "TODO"
fi