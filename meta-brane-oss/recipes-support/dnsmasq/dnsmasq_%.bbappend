# This is the old packageconfig that was not doing anything before.  (Main recipe
# used a ?= instead of ??= like other recipes which meant that it empty packageconfig
# was being used instead.)
#
# We do not use dbus with dnsmasq and we cannot use libidn due to license rules.
# So, can try building an image with resolvconf to see what it does, but will
# likely just use default dnsmasq.
# PACKAGECONFIG ?= " \
#    dbus \
#    idn \
#    resolvconf \
# "
# PACKAGECONFIG[idn] = ",,libidn2"

# Uncomment this to get it to include resolvconf with dnsmasq.
# PACKAGECONFIG:brane1 = " \
#    resolvconf \
# "

SYSTEMD_AUTO_ENABLE = "disable"
