#!/bin/bash
#!/bin/bash

# Skrypt do kopiowania obrazów systemu do katalogów NFS/TFTP
# Uruchom jako root po zbudowaniu projektu

if [ "$(id -u)" -ne 0 ]; then
    echo "Ten skrypt musi byæ uruchomiony jako root"
    exit 1
fi

# Konfiguracja zmiennych
NFS_ROOT="/home/NFSshare"
TFTP_ROOT="/tftpboot"
BUILD_DIR="images/linux"

# SprawdŸ czy katalogi istniej¹
if [ ! -d "$BUILD_DIR" ]; then
    echo "Katalog $BUILD_DIR nie istnieje. Uruchom najpierw petalinux-build."
    exit 1
fi

if [ ! -d "$NFS_ROOT" ]; then
    echo "Katalog NFS $NFS_ROOT nie istnieje. Uruchom najpierw nfs_setup.sh."
    exit 1
fi

if [ ! -d "$TFTP_ROOT" ]; then
    echo "Katalog TFTP $TFTP_ROOT nie istnieje. Uruchom najpierw nfs_setup.sh."
    exit 1
fi

# Kopiuj obrazy do katalogów NFS/TFTP
echo "Kopiowanie obrazów do katalogów NFS/TFTP..."

# ZnajdŸ obraz rootfs
ROOTFS_IMG=""
for img in "$BUILD_DIR"/rootfs.tar.gz "$BUILD_DIR"/petalinux-rootfs.tar.gz "$BUILD_DIR"/petalinux-image-minimal-*.tar.gz; do
    if [ -f "$img" ]; then
        ROOTFS_IMG="$img"
        break
    fi
done

if [ -z "$ROOTFS_IMG" ]; then
    echo "Nie znaleziono obrazu rootfs!"
    exit 1
fi

echo "Rozpakowanie $ROOTFS_IMG do $NFS_ROOT..."
rm -rf "$NFS_ROOT"/*  # Czyszczenie katalogu przed rozpakowaniem
tar -xzf "$ROOTFS_IMG" -C "$NFS_ROOT"

# ZnajdŸ obraz j¹dra
KERNEL_IMG=""
for img in "$BUILD_DIR"/Image "$BUILD_DIR"/uImage; do
    if [ -f "$img" ]; then
        KERNEL_IMG="$img"
        break
    fi
done

if [ -z "$KERNEL_IMG" ]; then
    echo "Nie znaleziono obrazu j¹dra!"
    exit 1
fi

echo "Kopiowanie $KERNEL_IMG do $TFTP_ROOT/Image..."
cp "$KERNEL_IMG" "$TFTP_ROOT/Image"

# ZnajdŸ DTB
DTB_IMG=""
for img in "$BUILD_DIR"/system.dtb "$BUILD_DIR"/*.dtb; do
    if [ -f "$img" ] && [ "$img" != "$BUILD_DIR/*.dtb" ]; then
        DTB_IMG="$img"
        break
    fi
done

if [ -z "$DTB_IMG" ]; then
    echo "Nie znaleziono pliku DTB!"
    exit 1
fi

echo "Kopiowanie $DTB_IMG do $TFTP_ROOT/system.dtb..."
cp "$DTB_IMG" "$TFTP_ROOT/system.dtb"

# Dodatkowa konfiguracja dla NFS (prawa dostêpu)
chown -R nobody:nogroup "$NFS_ROOT"
chmod -R 777 "$NFS_ROOT"

echo "Wszystkie obrazy zosta³y skopiowane."
echo "Gotowe!"
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
