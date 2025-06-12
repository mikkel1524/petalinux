# Konfiguracja dla obrazu NFS
# Plik w³¹czany w petalinux-image-minimal.bbappend

# Ustawienie formatu obrazu
IMAGE_FSTYPES:append = " tar.gz ext4"

# Dodanie pakietów dla NFS
IMAGE_INSTALL:append = " \
    nfs-utils \
    nfs-utils-client \
    net-tools \
    ethtool \
"

# Konfiguracja sieci dla NFS
create_nfs_config() {
    # Konfiguracja interfejsu sieciowego
    install -d ${IMAGE_ROOTFS}/etc/network/interfaces.d
    echo "auto eth0" > ${IMAGE_ROOTFS}/etc/network/interfaces.d/eth0
    echo "iface eth0 inet dhcp" >> ${IMAGE_ROOTFS}/etc/network/interfaces.d/eth0

    # Informacja o NFS
    echo "System NFS skonfigurowany" > ${IMAGE_ROOTFS}/etc/nfs-config-info
}

ROOTFS_POSTPROCESS_COMMAND += "create_nfs_config; "
