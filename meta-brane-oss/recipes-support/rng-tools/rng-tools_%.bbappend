
# This will keep libjitterentropy from being built in.
PACKAGECONFIG:brane1 = ""

# This was the head on 02/15/2022 (it does not need the patches there were with
# the original recipe which was for 6.14) either.
SRCREV = "6c0a4b0a1f583ddf483aa036e1a609b212c66879"

CFLAGS:remove:brane1 = "-DJENT_CONF_ENABLE_INTERNAL_TIMER"