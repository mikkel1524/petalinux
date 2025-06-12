#!/bin/bash

# Skrypt do konfiguracji rootfs dla PetaLinux z NFS
# Uruchom jako root po zbudowaniu projektu

if [ "$(id -u)" -ne 0 ]; then
    echo "Ten skrypt musi by� uruchomiony jako root"
    exit 1
fi

# Konfiguracja zmiennych
NFS_ROOT="/home/NFSshare"
TFTP_ROOT="/tftpboot"

# Sprawd� czy katalogi obraz�w istniej�
if [ ! -d "images/linux" ]; then
    echo "Katalog images/linux nie istnieje. Upewnij si�, �e projekt zosta� zbudowany."
    exit 1
fi

# Sprawd� czy serwer NFS i TFTP jest skonfigurowany
if [ ! -d "$NFS_ROOT" ] || [ ! -d "$TFTP_ROOT" ]; then
    echo "Katalogi NFS lub TFTP nie istniej�. Uruchom najpierw nfs_setup.sh."
    exit 1
fi

# Rozpakuj rootfs do katalogu NFS
echo "Rozpakowywanie rootfs do katalogu NFS..."
if [ -f images/linux/rootfs.tar.gz ]; then
    tar -xzf images/linux/rootfs.tar.gz -C $NFS_ROOT
    echo "Rootfs rozpakowany do $NFS_ROOT"
else
    echo "Nie znaleziono pliku rootfs.tar.gz"
    if [ -f images/linux/petalinux-rootfs.tar.gz ]; then
        tar -xzf images/linux/petalinux-rootfs.tar.gz -C $NFS_ROOT
        echo "Rozpakowano petalinux-rootfs.tar.gz do $NFS_ROOT"
    else
        echo "Nie znaleziono r�wnie� pliku petalinux-rootfs.tar.gz"
        exit 1
    fi
fi

# Kopiuj kernel i DTB do katalogu TFTP
echo "Kopiowanie kernel i DTB do katalogu TFTP..."
if [ -f images/linux/Image ]; then
    cp images/linux/Image $TFTP_ROOT/
    echo "Skopiowano Image do $TFTP_ROOT"
else
    echo "Nie znaleziono pliku Image"
    exit 1
fi

if [ -f images/linux/system.dtb ]; then
    cp images/linux/system.dtb $TFTP_ROOT/
    echo "Skopiowano system.dtb do $TFTP_ROOT"
else
    echo "Nie znaleziono pliku system.dtb"
    # Szukaj innych plik�w DTB
    dtb_files=$(find images/linux -name "*.dtb" | head -1)
    if [ -n "$dtb_files" ]; then
        cp $dtb_files $TFTP_ROOT/system.dtb
        echo "Skopiowano $dtb_files jako system.dtb do $TFTP_ROOT"
    else
        echo "Nie znaleziono �adnych plik�w DTB"
        exit 1
    fi
fi

echo "Konfiguracja zako�czona!"
echo ""
echo "Twoja konfiguracja NFS/TFTP:"
echo "- Katalog NFS: $NFS_ROOT"
echo "- Katalog TFTP: $TFTP_ROOT"
echo ""
echo "Upewnij si�, �e urz�dzenie Zynq jest w tej samej sieci co ten serwer!"
