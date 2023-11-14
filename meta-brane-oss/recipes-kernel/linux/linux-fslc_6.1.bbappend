# Set the rev to what we want from the repo.
# This is the latest rev our patches were applied to.  It is from 07/14/2023
# and had the comment "Merge pull request #636 from MrCry0/6.1.x+fslc
# Update 6.1.x+fslc to 6.1.38"
#
# SRCBRANCH = "6.1.x+fslc"
# SRCREV = "1e2fd7c4b605d13c62a7bee8d50a4eac1abe6858"
#
#### The rev from the meta-freescale linux-fslc_6.1.bb recipe is below.  It is
#### from 05/02/2023 and had the comment "ARM: imx_v6_v7_defconfig: Remove firmware loader helper"
#### where was just after moving to v6.1.27.
#### 
#### SRCREV = "ddc32335b72f78943045b242eb6e0b069ef4cdae"
#
# The head of the 6.1.x+fslc branch when the recipe was edited was the rev at the
# top that we are using.
#
LINUX_VERSION = "6.1.38"
SRCREV = "1e2fd7c4b605d13c62a7bee8d50a4eac1abe6858"

FILESEXTRAPATHS:prepend := "${THISDIR}/brane-linux-fslc:"

SRC_URI:append:brane1 = " \
   file://sdma-imx7d.bin \
   file://ibt-18-16-1.ddc \
   file://ibt-18-16-1.sfi \
   file://iwlwifi-9260-th-b0-jf-b0-46.ucode \
   file://LICENCE.ibt_firmware \
   file://LICENCE.iwlwifi_firmware \
   file://LICENSE.sdma_firmware \
   file://LICENSE.wireless_regdb \
   file://regulatory.db \
   file://regulatory.db.p7s \
   file://0000-add-device-tree.patch \
   file://0002-add-ba01k01-codec.patch \
   file://0003-add-reboot-device.patch \
   file://0004-workaround-iwlwifi-rfkill.patch \
   file://0005-workaround-iwlwifi-firmware.patch \
   file://0006-nl80211-silence-backtrace.patch \
   file://0007-pci-imx6-fixup-device-class.patch \
   file://0008-imx-gpcv2-device-link-error-fixed.patch \
   file://0009-imx-caam-port-keygen-driver-from-imx-kernel.patch \
   file://0010-reboot-ensure-power-down-printed.patch \
   file://0011-Changes-to-support-Bluetooth-PTS-testing.patch \
   file://defconfig \
            "

LIC_FILES_CHKSUM:append:brane1 = "\
               file://${WORKDIR}/LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b \
               file://${WORKDIR}/LICENCE.iwlwifi_firmware;md5=2ce6786e0fc11ac6e36b54bb9b799f1b \
               file://${WORKDIR}/LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9 \
               file://${WORKDIR}/LICENSE.wireless_regdb;md5=07c4f6dea3845b02a18dc00c8c87699c \
               "

LOCALVERSION = "-brane-fslc"

KERNEL_VERSION_SANITY_SKIP="1"

addtask copy_brane_files after do_unpack before do_kernel_metadata

do_copy_brane_files () {
################################################################################
# This copies the firmaware files we need into the kernel source tree to allow
# it to build them into the kernel.

   install -d ${S}/firmware/imx/sdma/
   install -m 0644 ${WORKDIR}/sdma-imx7d.bin ${S}/firmware/imx/sdma/

   install -d ${S}/firmware/intel/
   install -m 0644 ${WORKDIR}/ibt-18-16-1.ddc ${S}/firmware/intel/
   install -m 0644 ${WORKDIR}/ibt-18-16-1.sfi ${S}/firmware/intel/

   install -m 0644 ${WORKDIR}/iwlwifi-9260-th-b0-jf-b0-46.ucode ${S}/firmware/

   install -m 0644 ${WORKDIR}/regulatory.db ${S}/firmware/
   install -m 0644 ${WORKDIR}/regulatory.db.p7s ${S}/firmware/
}


COMPATIBLE_MACHINE = "(brane1)"
