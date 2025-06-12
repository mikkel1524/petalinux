FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://platform-top.h"

do_configure:append() {
    if [ -e ${WORKDIR}/platform-top.h ]; then
        install -m 0644 ${WORKDIR}/platform-top.h ${S}/include/configs/
    fi
}
SRC_URI:append = " file://platform-top.h file://bsp.cfg"
