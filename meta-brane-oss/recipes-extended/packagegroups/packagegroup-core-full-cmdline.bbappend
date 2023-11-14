# Get rid of items that are included be various packagegroups that we do not need.

RDEPENDS:packagegroup-core-full-cmdline-sys-services:remove:brane1 = " \
   at \
   cronie \
   logrotate \
"

RDEPENDS:packagegroup-core-full-cmdline-utils:remove:brane1 = " \
   bash \
   bc \
   cpio \
   ed \
   file \
   findutils \
   gawk \
   gmp \
   grep \
   less \
   makedevs \
   mc \
   mc-fish \
   mc-helpers \
   mc-helpers-perl \
   net-tools \
   procps \
   psmisc \
   sed \
   tar \
   time \
"

RDEPENDS:packagegroup-core-full-cmdline-multiuser:remove:brane1 = " \
   cracklib \
   gzip \
   shadow \
   sudo \
"

RDEPENDS:packagegroup-core-full-cmdline-dev-utils:remove:brane1 = " \
   diffutils \
   m4 \
   make \
   patch \
"

RDEPENDS:packagegroup-core-full-cmdline-initscripts:remove:brane1  = "\
    ethtool \
"

RDEPENDS:packagegroup-core-full-cmdline-extended:remove:brane1 = "\
   module-init-tools \
"

