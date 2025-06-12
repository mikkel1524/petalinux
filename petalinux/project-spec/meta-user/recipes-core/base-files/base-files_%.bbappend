# Pust¹ konfiguracjê fstab tworzymy podczas instalacji

do_install:append() {
    # Tworzymy pusty fstab dla NFS
    echo "# Pusta konfiguracja fstab dla systemu NFS" > ${D}${sysconfdir}/fstab
}
