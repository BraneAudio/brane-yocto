DESCRIPTION = "A console-only image for Brane."

LICENSE = "MIT"

IMAGE_ROOTFS_SIZE:brane1 = "921600"

inherit core-image

PACKAGE_EXCLUDE = "linux-firmware-dev"

IMAGE_INSTALL += "\
   packagegroup-brane-oss \
   dbus \
   curl \
   glib-2.0 \
   util-linux \
   util-linux-libuuid \
   gupnp \
   gssdp \
   libgcrypt \
   mdns \
   ffmpeg \
   mpg123 \
   json-c \
   libsndfile1 \
   openssl \
   libarchive \
   libcap \
   libmnl \
   libgpiod \
   flac \
   systemd \
   libsoup-2.4 \
   libxml2 \
   libgpg-error \
   libogg \
   libvorbis \
   sbc \
   e2fsprogs \
   "
