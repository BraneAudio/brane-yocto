# This will prepare u-boot for Brane control boards.

LOCALVERSION = "-fslc_v2022.04"

FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot-fslc:"

SRC_URI:append:brane1 = " \
   file://0001-add-board-files.patch \
   file://0002-add-device-tree.patch \
   file://0003-add-defconfig.patch \
   file://0004-add-fixture-defconfig.patch \
   file://0005-add-bringup-defconfig.patch \
   file://0006-add-caldram-defconfig.patch \
   file://0007-bootz-add-hab-support.patch \
   file://0008-hab-fix-overflow.patch \
   file://0009-hab-update-docs.patch \
   file://0010-fs-bypass-region-checking-on-load.patch \
            "

# This is here since it was removed from the Freescale include u-boot-fslc_2022.04.bb as
# it is being removed from Yocto altogether, but for us right now this is still
# needed to get u-boot to build.
DEPENDS += "lzop-native"

# We are using 2022.04 u-boot.  The rev in the master branch of meta-freescale
# at the time we went to that rev that was:
# 
# SRCBRANCH = "2022.04+fslc"
# SRCREV = "f88519827335b548fcd276acda32107f5120276f"
#
# That was the head at the time and is what rev we will be using.
SRCREV = "f88519827335b548fcd276acda32107f5120276f"

do_deploy () {
   # This will grab the version string in the header file.
   BRANE_U_BOOT_VER_STR=`sed -n -e 's/^#define BRANE_UBOOT_VER_STR "\(.*\)".*/\1/p' < ${S}/include/configs/brane-ctrl1.h`

   if [ -n "${UBOOT_CONFIG}" ]
   then
      for config in ${UBOOT_MACHINE}; do
         i=$(expr $i + 1);
         for type in ${UBOOT_CONFIG}; do
               j=$(expr $j + 1);
               if [ $j -eq $i ]
               then
                  install -d ${DEPLOYDIR}

                  install -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${BRANE_U_BOOT_VER_STR}.${UBOOT_SUFFIX}

                  cd ${DEPLOYDIR}
                  ln -sf ${BRANE_U_BOOT_VER_STR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-${type}
                  ln -sf ${BRANE_U_BOOT_VER_STR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
                  ln -sf ${BRANE_U_BOOT_VER_STR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}-${type}
                  ln -sf ${BRANE_U_BOOT_VER_STR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
               fi
         done
         unset  j
      done
      unset  i
   else
      bbfatal "Expected UBOOT_CONFIG deploy. Must update function if not."
   fi

   if [ -n "${UBOOT_ELF}" ]
   then
      bbfatal "Should not have UBOOT_ELF deploy. Must update function if wanted."
   fi

   if [ -n "${SPL_BINARY}" ]
   then
      bbfatal "Should not have SPL_BINARY deploy. Must update function if wanted."
   fi

   if [ -n "${UBOOT_ENV}" ]
   then
      bbfatal "Should not have UBOOT_ENV deploy. Must update function if wanted."
   fi

   if [ "${UBOOT_EXTLINUX}" = "1" ]
   then
      bbfatal "Should not have UBOOT_EXTLINUX deploy. Must update function if wanted."
   fi
}
