FILESEXTRAPATHS_prepend_raspberrypi := "${THISDIR}/:"

SRCREV = "ab77f24119e80257de4ab017b877f92f96980562"
SRC_URI = "git://git.denx.de/u-boot.git;branch=master"

SRC_URI += "file://extlinux.conf"

LICENSE = "GPLv2+"
LIC_FILES_CHKSUM = "file://Licenses/gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"

UBOOT_MACHINE = "rpi_defconfig"

do_deploy_append(){
    install -d ${DEPLOYDIR}/extlinux
    install ${S}/../extlinux.conf ${DEPLOYDIR}/extlinux/extlinux.conf
}

do_install_append(){
    install -d ${D}/boot/extlinux
    install ${S}/../extlinux.conf ${D}/boot/extlinux/extlinux.conf
}

PR := "${PR}.5"