
FILESEXTRAPATHS:prepend := "${THISDIR}/ffmpeg:"

SRC_URI:append:brane1 = " \
   file://0000-add-http-redirect-cache.patch \
   file://0001-add-expanded-http-header-support.patch \
   file://0002-aac-fix-media-monkey-android-playback-problem.patch \
   file://0003-mp3-fix-media-monkey-android-playback-problem.patch \
            "

PACKAGECONFIG:brane1 = "avdevice avfilter avcodec avformat swresample swscale \
                   alsa bzlib lzma libopus openssl libvorbis zlib pic shared \
                   pthreads "


# libogg was moved into the libtheora package config, but we still just want libogg.
DEPENDS:append:brane1 = " libogg"

# We are using openssl version > 3.0. So we do not need nonfree set for using openssl.
# That makes it where it will not claim that the license is unredistributable.
USE_NONFREE:brane1 = ""
