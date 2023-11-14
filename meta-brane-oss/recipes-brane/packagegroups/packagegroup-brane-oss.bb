SUMMARY = "Packages for Brane Audio Image"
DESCRIPTION = "Package group bringing in packages needed for OSS images."

inherit packagegroup

VIRTUAL-RUNTIME_syslog ?= "sysklogd"
RDEPENDS:${PN} = "\
   ${VIRTUAL-RUNTIME_syslog} \
   ${VIRTUAL-RUNTIME_initscripts} \
   ${VIRTUAL-RUNTIME_init_manager} \
   ${VIRTUAL-RUNTIME_login_manager} \
"
