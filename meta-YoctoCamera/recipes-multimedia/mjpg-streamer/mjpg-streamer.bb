DESCRIPTION = "MJPG-Streamer"
SECTION = "multimedia"
PRIORITY = "optional"
DEPENDS = "jpeg v4l-utils"
PR = "r0"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"

SRCREV="182"
PV = "1.0.0+svnr${SRCPV}"

SRC_URI = "svn://svn.code.sf.net/p/mjpg-streamer/code;module=mjpg-streamer;protocol=svn \
"

do_compile_prepend () {
	sed -e 's/CC = gcc/#CC = gcc/g' -i plugins/*/Makefile
}

S = "${WORKDIR}/mjpg-streamer"

SRC_URI[md5sum] = "589cc059fdc98af2137da0f826dcb46d"
SRC_URI[sha256sum] = "70fcc01388ea1afe9c9f4c55a5db12295a3775873b9275a7c4f2f44627e95fb7"

do_install() {
	install -d ${D}/usr/
	install -d ${D}/usr/bin
	install -d ${D}/usr/lib
	install -d ${D}/usr/www
	oe_runmake install DESTDIR=${D}/usr
}

FILES_${PN} += " \
	${libdir} \
	/usr/www \
"
