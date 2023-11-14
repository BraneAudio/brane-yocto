PACKAGECONFIG = "cryptodev-linux"

# This is to keep it from bringing in cryptodev-module as a RRECOMMENDS which
# fails for some reason.  It overrides the PACKAGECONFIG[cryptodev-linux] in
# the recipe.
PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux"
