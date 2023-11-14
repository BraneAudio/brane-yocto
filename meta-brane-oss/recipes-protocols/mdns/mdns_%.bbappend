FILESEXTRAPATHS:prepend:brane1 := "${THISDIR}/files:"

SRC_URI:append:brane1 = " \
   file://0001-BCT-fix-mdns-subsequent-conflicts.patch \
   file://0001-Make-Collision-Altering-Work-For-Us.patch \
            "

# Setup the package config the way we want.  We do not currently need tls.
PACKAGECONFIG:brane1 = "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"

