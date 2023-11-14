require conf/distro/poky.conf

DISTRO_NAME ?= "Brane Base Distro"
# Now using the community kernel.
DISTRO_VERSION = "6.1-fslc-brane"

SDK_VERSION := "${DISTRO_VERSION}-${DATE}"

MAINTAINER = "Brane Audio <OSS@braneaudio.com>"

# POKY_DEFAULT_DISTRO_FEATURES is set in poky/meta-poky/conf/distro/poky.conf.
# We do not want any of the POKY_DEFAULT_DISTRO_FEATURES.  So, we replace it
# with the features we want instead of removing what we do not want and
# appending what we do to the end.
BRANE_DEFAULT_DISTRO_FEATURES = "bluez5 polkit"
POKY_DEFAULT_DISTRO_FEATURES = "${BRANE_DEFAULT_DISTRO_FEATURES}"

DISTRO_FEATURES_BACKFILL_CONSIDERED = "pulseaudio"

DISTRO_FEATURES:remove = "x11 3g nfc pcmcia zeroconf nfs"

SDK_NAME = "${DISTRO}-${TCLIBC}-${SDK_ARCH}-${IMAGE_BASENAME}-${TUNE_PKGARCH}-${DATE}"

SANITY_TESTED_DISTROS =+ " \
            ubuntu-19.10 \n \
            ubuntu-20.04 \n \
            ubuntu-22.04 \n \
            "

ERROR_QA:remove = "version-going-backwards"

INHERIT:remove = "uninative reproducible_build"

LINUXLIBCVERSION = "6.1%"

INIT_MANAGER = "systemd"

PREFERRED_PROVIDER_udev = "systemd"
PREFERRED_PROVIDER_udev-utils = "systemd"
