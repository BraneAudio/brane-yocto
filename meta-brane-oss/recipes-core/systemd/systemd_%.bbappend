FILESEXTRAPATHS:prepend := "${THISDIR}/brane-systemd:"

SRC_URI:append:brane1 = " \
   file://0001-Made-LLMNR-be-off-by-default-since-it-opens-a-port-w.patch \
            "

RRECOMMENDS:${PN}:remove:brane1 = "systemd-conf"

RDEPENDS:${PN}:remove:brane1 = "kmod"

PACKAGECONFIG:brane1 = " \
   ldconfig \
   polkit \
   rfkill \
   binfmt \
   firstboot \
   hostnamed \
   ima \
   localed \
   logind \
   myhostname \
   nss \
   quotacheck \
   randomseed \
   resolved \
   smack \
   sysusers \
   timedated \
   timesyncd \
   utmp \
   xz \
   coredump \
   set-time-epoch \
"
