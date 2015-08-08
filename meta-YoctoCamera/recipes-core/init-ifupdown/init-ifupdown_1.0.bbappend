FILESEXTRAPATHS_prepend_raspberrypi := "${THISDIR}/:"

PR := "${PR}.5"

SRC_URI += "file://wireless-tools.if-pre-up"

do_install_append () {
	# Disable network manager on machines that commonly do NFS booting
	install -m 0755 ${WORKDIR}/wireless-tools.if-pre-up ${D}${sysconfdir}/network/if-pre-up.d/wireless-tools
}
