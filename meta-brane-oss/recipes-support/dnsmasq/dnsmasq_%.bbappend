PACKAGECONFIG ?= " \
   dbus \
   idn \
   resolvconf \
"

PACKAGECONFIG[idn] = ",,libidn2"

SYSTEMD_AUTO_ENABLE = "disable"
