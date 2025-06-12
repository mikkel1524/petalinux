# Konfiguracja statycznego adresu IP dla obrazu

# Funkcja ustawiaj¹ca statyczne IP w systemie
create_static_ip_config() {
    # Katalog na konfiguracje
    install -d ${IMAGE_ROOTFS}/etc/network/interfaces.d

    # Konfiguracja interfejsu eth0 ze statycznym adresem IP
    echo "auto eth0" > ${IMAGE_ROOTFS}/etc/network/interfaces.d/eth0
    echo "iface eth0 inet static" >> ${IMAGE_ROOTFS}/etc/network/interfaces.d/eth0
    echo "    address 192.168.64.80" >> ${IMAGE_ROOTFS}/etc/network/interfaces.d/eth0
    echo "    netmask 255.255.255.0" >> ${IMAGE_ROOTFS}/etc/network/interfaces.d/eth0
    echo "    network 192.168.64.0" >> ${IMAGE_ROOTFS}/etc/network/interfaces.d/eth0
    echo "    broadcast 192.168.64.255" >> ${IMAGE_ROOTFS}/etc/network/interfaces.d/eth0
    echo "    gateway 192.168.64.1" >> ${IMAGE_ROOTFS}/etc/network/interfaces.d/eth0

    # Konfiguracja nazw hostów
    echo "127.0.0.1    localhost" > ${IMAGE_ROOTFS}/etc/hosts
    echo "192.168.64.80    peta" >> ${IMAGE_ROOTFS}/etc/hosts
    echo "192.168.64.32    nfs-server" >> ${IMAGE_ROOTFS}/etc/hosts

    # Ustawienie nazwy hosta
    echo "peta" > ${IMAGE_ROOTFS}/etc/hostname

    # Informacja o konfiguracji IP
    echo "Static IP configuration: 192.168.64.80/24" > ${IMAGE_ROOTFS}/etc/network-config-info
}

ROOTFS_POSTPROCESS_COMMAND += "create_static_ip_config; "
