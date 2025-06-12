#!/bin/bash

# Skrypt do konfiguracji �rodowiska NFS/TFTP dla PetaLinux
# Uruchom jako root

if [ "$(id -u)" -ne 0 ]; then
    echo "Ten skrypt musi by� uruchomiony jako root"
    exit 1
fi

# Konfiguracja zmiennych
NFS_ROOT="/home/NFSshare"
TFTP_ROOT="/tftpboot"
HOST_IP="192.168.64.32"

# Instalacja wymaganych pakiet�w
echo "Instalacja wymaganych pakiet�w..."
apt-get update
apt-get install -y nfs-kernel-server tftpd-hpa tftp-hpa

# Konfiguracja katalogu NFS
echo "Konfiguracja katalogu NFS..."
mkdir -p $NFS_ROOT
chmod 777 $NFS_ROOT
echo "$NFS_ROOT *(rw,sync,no_root_squash,no_subtree_check)" > /etc/exports

# Konfiguracja katalogu TFTP
echo "Konfiguracja katalogu TFTP..."
mkdir -p $TFTP_ROOT
chmod 777 $TFTP_ROOT
sed -i "s|^TFTP_DIRECTORY=.*|TFTP_DIRECTORY=\"$TFTP_ROOT\"|g" /etc/default/tftpd-hpa

# Restart us�ug
echo "Restart us�ug..."
systemctl restart nfs-kernel-server
systemctl restart tftpd-hpa

echo "Konfiguracja zako�czona!"
echo ""
echo "Wykonaj nast�puj�ce kroki:"
echo "1. Zbuduj projekt PetaLinux: petalinux-build"
echo "2. Skopiuj obrazy do katalog�w TFTP/NFS:"
echo "   a. Rozpakuj obraz rootfs: sudo tar -xzf images/linux/petalinux-rootfs.tar.gz -C $NFS_ROOT"
echo "   b. Skopiuj kernel i DTB: sudo cp images/linux/Image $TFTP_ROOT/"
echo "   c. Skopiuj DTB: sudo cp images/linux/system.dtb $TFTP_ROOT/"
echo ""
echo "Twoja konfiguracja:"
echo "- Adres IP serwera: $HOST_IP"
echo "- Katalog NFS: $NFS_ROOT"
echo "- Katalog TFTP: $TFTP_ROOT"
echo ""
echo "Upewnij si�, �e urz�dzenie Zynq jest w tej samej sieci co ten serwer!"
