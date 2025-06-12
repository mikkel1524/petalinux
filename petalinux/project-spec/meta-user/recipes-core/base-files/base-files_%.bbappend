# Dodanie konfiguracji fstab dla NFSv3

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://fstab"

do_install:append() {
    # Upewniamy sie, ze katalog /mnt/nfs istnieje
    install -d ${D}/mnt/nfs
}
