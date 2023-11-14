FILESEXTRAPATHS:prepend := "${THISDIR}/brane-iwd:"

SRC_URI:append:brane1 = " \
   file://main.conf \
   file://create-softap0.patch \
            "

# Need to install the main.conf file in /etc/iwd
do_install:append:brane1() {

	install -d ${D}${sysconfdir}/iwd/
   install -m 0644 ${WORKDIR}/main.conf ${D}/${sysconfdir}/iwd/
}

# Cannot use readline in product as it is GPL3.
PACKAGECONFIG:remove:brane-release = " \
   client \
"

FILES:${PN} += " \
    ${sysconfdir}/iwd \
"
