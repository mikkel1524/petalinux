#!/bin/bash

# Skrypt do konfiguracji rootfs dla PetaLinux z NFS
# Uruchom jako root po zbudowaniu projektu

if [ "$(id -u)" -ne 0 ]; then
    echo "Ten skrypt musi byæ uruchomiony jako root"
    exit 1
fi

# Konfiguracja zmiennych
NFS_ROOT="/home/NFSshare"
TFTP_ROOT="/tftpboot"

# SprawdŸ czy katalogi obrazów istniej¹
if [ ! -d "images/linux" ]; then
    echo "Katalog images/linux nie istnieje. Upewnij siê, ¿e projekt zosta³ zbudowany."
    exit 1
fi

# SprawdŸ czy serwer NFS i TFTP jest skonfigurowany
if [ ! -d "$NFS_ROOT" ] || [ ! -d "$TFTP_ROOT" ]; then
    echo "Katalogi NFS lub TFTP nie istniej¹. Uruchom najpierw nfs_setup.sh."
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
        echo "Nie znaleziono równie¿ pliku petalinux-rootfs.tar.gz"
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
    # Szukaj innych plików DTB
    dtb_files=$(find images/linux -name "*.dtb" | head -1)
    if [ -n "$dtb_files" ]; then
        cp $dtb_files $TFTP_ROOT/system.dtb
        echo "Skopiowano $dtb_files jako system.dtb do $TFTP_ROOT"
    else
        echo "Nie znaleziono ¿adnych plików DTB"
        exit 1
    fi
fi

echo "Konfiguracja zakoñczona!"
echo ""
echo "Twoja konfiguracja NFS/TFTP:"
echo "- Katalog NFS: $NFS_ROOT"
echo "- Katalog TFTP: $TFTP_ROOT"
echo ""
echo "Upewnij siê, ¿e urz¹dzenie Zynq jest w tej samej sieci co ten serwer!"
