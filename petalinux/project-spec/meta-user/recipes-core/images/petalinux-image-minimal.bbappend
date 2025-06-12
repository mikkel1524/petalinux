# Dodanie konfiguracji NFS do obrazu minimalnego

# Konfiguracja dla obrazu NFS z wymuszeniem wersji 3 i statycznym IP

# Do³¹czenie pliku konfiguracyjnego dla statycznego IP
require recipes-core/images/static-ip-config.inc

# Ustawienie formatu obrazu
IMAGE_FSTYPES:append = " tar.gz ext4"

# Dodanie pakietow dla NFS
IMAGE_INSTALL:append = " \
    nfs-utils \
    nfs-utils-client \
    net-tools \
    ethtool \
    iptables \
"

# Konfiguracja sieci dla NFS
create_nfs_config() {

    # Informacja o NFS
    echo "System NFS v3 skonfigurowany" > ${IMAGE_ROOTFS}/etc/nfs-config-info

    # Dodanie opcji montowania NFS v3 do profile
    echo "# Opcje NFS v3" >> ${IMAGE_ROOTFS}/etc/profile
    echo "export NFS_MOUNT_OPTIONS=\"vers=3\"" >> ${IMAGE_ROOTFS}/etc/profile
}

ROOTFS_POSTPROCESS_COMMAND += "create_nfs_config; "
# Dodanie konfiguracji NFS do obrazu minimalnego
require recipes-core/images/image-nfs.inc