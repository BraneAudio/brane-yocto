PACKAGECONFIG:brane1 ?= " \
   ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
   proxy \
   threaded-resolver \
   zlib \
   nghttp2 \
   dict \
   gopher \
   imap \
   pop3 \
   rtsp \
   smb \
   smtp \
   telnet \
   tftp \
   openssl \
"
EXTRA_OECONF:brane1 = " \
   --disable-libcurl-option \
   --disable-ntlm-wb \
   --enable-crypto-auth \
   --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
   --enable-pthreads \
   --without-libpsl \
   --enable-optimize \
     ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbedtls nss openssl', d) == '') else ''} \
"
