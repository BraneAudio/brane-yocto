
FILESEXTRAPATHS:prepend := "${THISDIR}/flac:"

SRC_URI:append:brane1 = " \
   file://0000_init_vars.patch \
   file://0001-add-brane-api.patch \
            "

