# This will get it to grab our hostapd.service file instead of the default
# since we are prepending our path in front of where the default service file
# comes from.

FILESEXTRAPATHS:prepend:brane1 := "${THISDIR}/hostapd:"

# This prevents scripts appearing in /etc/init.d for sysvinit.  We use systemd,
# so should be able to get rid of it.
INITSCRIPT_NAME = ""

# We could get rid of the default hostapd.conf file since we do not use it.
# Uncomment below to do so.
# do_install:append:brane1() {
#     rm ${D}${sysconfdir}/hostapd.conf
# }
