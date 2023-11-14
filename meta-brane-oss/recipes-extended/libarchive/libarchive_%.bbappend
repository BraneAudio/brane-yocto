# Setup the package config the way we want.  We do not use zstd or lzo anywhere
# and thus do not need it in libarchive.
PACKAGECONFIG:brane1 = "zlib bz2 xz"
