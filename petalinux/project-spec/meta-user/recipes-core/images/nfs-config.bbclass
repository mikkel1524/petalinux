# Klasa BB do konfiguracji NFS

do_rootfs:append() {
    # Pusta konfiguracja fstab dla systemu NFS
    echo "# Pusta konfiguracja fstab dla systemu NFS" > ${IMAGE_ROOTFS}/etc/fstab

    # Dodatkowa konfiguracja sieci
    if [ ! -d ${IMAGE_ROOTFS}/etc/network/interfaces.d ]; then
        mkdir -p ${IMAGE_ROOTFS}/etc/network/interfaces.d
    fi
    echo "auto eth0" > ${IMAGE_ROOTFS}/etc/network/interfaces.d/eth0
    echo "iface eth0 inet dhcp" >> ${IMAGE_ROOTFS}/etc/network/interfaces.d/eth0
}
