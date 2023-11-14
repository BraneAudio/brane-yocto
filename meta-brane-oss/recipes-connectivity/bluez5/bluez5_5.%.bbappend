FILESEXTRAPATHS:prepend := "${THISDIR}/brane-bluez5:"

SRC_URI:append:brane1 = " \
   file://main.conf \
   file://bluez_v5.66.patch \
   file://0001-Bump-AVCTP-Version-to-1.4-since-it-complies-with-it-.patch \
   file://0001-Changes-to-support-Bluetooth-PTS-testing.patch \
   file://0001-add-a2dp-delay-reporting.patch \
            "

PACKAGECONFIG:brane1 = " \
   threads \
   testing \
   deprecated \
   readline \
   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
   a2dp-profiles \
   avrcp-profiles \
   network-profiles \
   hid-profiles \
   hog-profiles \
   tools \
   udev \
"

# Cannot use readline in product as it is GPL3.
PACKAGECONFIG:remove:brane-release = " \
   readline \
"

EXTRA_OECONF:brane1 = "\
  --enable-test \
  --enable-datafiles \
  --enable-library \
  --without-zsh-completion-dir \
  --enable-debug \
  --enable-pie \
  --disable-bap \
  --disable-mcp \
  --disable-vcp \
"

# Need to install the main.conf file in /etc/bluetooth
do_install:append:brane1() {

	install -d ${D}${sysconfdir}/bluetooth/
   install -m 0644 ${WORKDIR}/main.conf ${D}/${sysconfdir}/bluetooth/
}

