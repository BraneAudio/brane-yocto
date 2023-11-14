# This is to get it to build with POSIX thread support.

EXTRA_OECONF:brane1 = " \
   --enable-threads=posix \
   --disable-doc \
"
