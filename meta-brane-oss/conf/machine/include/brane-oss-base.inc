# Provides settings for the Brane OSS images.

BRANE_DEFAULT_BOOTLOADER = "u-boot-fslc"

PREFERRED_PROVIDER_u-boot ??= "${BRANE_DEFAULT_BOOTLOADER}"
PREFERRED_PROVIDER_virtual/bootloader ??= "${BRANE_DEFAULT_BOOTLOADER}"

EXTRA_IMAGEDEPENDS += "${BRANE_DEFAULT_BOOTLOADER}"

UBOOT_BINARY ?= "u-boot.imx"
UBOOT_MAKE_TARGET = "u-boot.imx"
UBOOT_SUFFIX ?= "imx"

UBOOT_ENTRYPOINT = "0x80008000"

# Some nxp devices utilize u-boot container support.  At present we do not.
UBOOT_PROVIDES_BOOT_CONTAINER = "0"

# Probably should move to the 7thf version at some point.  Old sabre7d board
# used the 7hf version orignally.  So, that is how we got here.
#DEFAULTTUNE = "cortexa7thf-neon"
DEFAULTTUNE = "cortexa7hf-neon"

# This should put the devicetree binary file in the /boot folder of the image
# with the zImage file.
MACHINE_ESSENTIAL_EXTRA_RDEPENDS:append = " \
   kernel-image \
   kernel-devicetree \
"

# Handle default kernel
PREFERRED_PROVIDER_virtual/kernel ??= "linux-fslc"

# We need to investigate migrating to wic since that is what everything is
# apparently doing.
BRANE_IMAGE_FSTYPES = "tar.bz2 ext4"
IMAGE_FSTYPES ?= "${BRANE_IMAGE_FSTYPES}"

SERIAL_CONSOLES = "115200;ttymxc0"

KERNEL_IMAGETYPE = "zImage"

MACHINE_FEATURES = "usbgadget usbhost vfat alsa pci wifi bluetooth"

# There were many items that we used to define based on stuff in
# meta-freescale/conf/machine/include/imx-base.inc, but we do not use any
# of these any more.
#
# In case you want to see what those overrides were doing they are:
#  MACHINEOVERRIDES =. "mx7:mx7d:imx:use-mainline-bsp:imx-mainline-bsp:"
#  MACHINEOVERRIDES =. "mx7-generic-bsp:mx7-mainline-bsp:"
#  MACHINEOVERRIDES =. "mx7d-generic-bsp:mx7d-mainline-bsp:"
#
# The only interesting things were imx7d-generic-bsp and imx-mainline-bsp grabbed
# some firmware items, but we get our linux firmware differently, and there were
# some firmware items we did not need.

# imx-generic-bsp causes alsa-state to have a freescale specific asound.conf and
# asound.state.  It also is the comaptible machine for linux-fslc and u-boot-fslc.
MACHINEOVERRIDES =. "imx-generic-bsp:"
