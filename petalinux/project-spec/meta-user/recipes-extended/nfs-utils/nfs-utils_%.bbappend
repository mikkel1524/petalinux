# Konfiguracja nfs-utils dla klienta NFS
# Konfiguracja nfs-utils dla klienta NFS

do_install:append() {
    # Upewniamy sie, ze klient NFS bedzie dzialal
    install -d ${D}${sysconfdir}/default
    echo "NEED_STATD=yes" > ${D}${sysconfdir}/default/nfs-common
    echo "NEED_IDMAPD=yes" >> ${D}${sysconfdir}/default/nfs-common
}
FILES:${PN} = "nfs-utils.conf"

do_install:append() {
    # Upewniamy si�, �e klient NFS b�dzie dzia�a�
    install -d ${D}${sysconfdir}/default
    echo "NEED_STATD=yes" > ${D}${sysconfdir}/default/nfs-common
    echo "NEED_IDMAPD=yes" >> ${D}${sysconfdir}/default/nfs-common
}
