# This will make it only build libraries which takes away the need for the other things
# like openssl.  It makes sure examples are also not built.
EXTRA_OECMAKE:brane1 = "-DENABLE_EXAMPLES=OFF -DENABLE_LIB_ONLY=ON"
# Makes sure that it does not try to install any of the executables.
RDEPENDS:${PN}:brane1 = ""
# Insure the libraries are copied over.
FILES:${PN}:brane1 = "${libdir}/*${SOLIBS}"
