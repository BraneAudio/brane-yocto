FILESEXTRAPATHS:prepend:brane1 := "${THISDIR}/base-files:"

dirs755:append:brane1 = " /mnt/common_part /mnt/other_fs_part /mnt/voices"

do_install:append:brane1() {
   # Insure hosts file is original after all other install stuff.
   install -m 0644 ${WORKDIR}/hosts ${D}${sysconfdir}/hosts
}