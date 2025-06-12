# Dodanie konfiguracji NFS do obrazu minimalnego

# Konfiguracja dla obrazu NFS z wymuszeniem wersji 3

# Ustawienie formatu obrazu
IMAGE_FSTYPES:append = " tar.gz ext4"

# Dodanie pakietow dla NFS
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
    echo "System NFS v3 skonfigurowany" > ${IMAGE_ROOTFS}/etc/nfs-config-info

    # Dodanie opcji montowania NFS v3 do profile
    echo "# Opcje NFS v3" >> ${IMAGE_ROOTFS}/etc/profile
    echo "export NFS_MOUNT_OPTIONS=\"vers=3\"" >> ${IMAGE_ROOTFS}/etc/profile
}

ROOTFS_POSTPROCESS_COMMAND += "create_nfs_config; "
# Dodanie konfiguracji NFS do obrazu minimalnego
require recipes-core/images/image-nfs.inc