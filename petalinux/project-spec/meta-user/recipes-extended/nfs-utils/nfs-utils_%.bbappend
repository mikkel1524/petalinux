# Konfiguracja nfs-utils dla klienta NFS

FILES:${PN} = "nfs-utils.conf"

do_install:append() {
    # Upewniamy siê, ¿e klient NFS bêdzie dzia³a³
    install -d ${D}${sysconfdir}/default
    echo "NEED_STATD=yes" > ${D}${sysconfdir}/default/nfs-common
    echo "NEED_IDMAPD=yes" >> ${D}${sysconfdir}/default/nfs-common
}
