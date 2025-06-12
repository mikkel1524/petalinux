#!/bin/bash

# Skrypt do konfiguracji rootfs dla NFS
# $1 - œcie¿ka do rootfs

ROOTFS="$1"

if [ -z "$ROOTFS" ]; then
    echo "B³¹d: brak œcie¿ki rootfs"
    exit 1
fi

# Pusta konfiguracja fstab dla systemu NFS
echo "# Pusta konfiguracja fstab dla systemu NFS" > "$ROOTFS/etc/fstab"

# Dodatkowa konfiguracja sieci
mkdir -p "$ROOTFS/etc/network/interfaces.d"
echo "auto eth0" > "$ROOTFS/etc/network/interfaces.d/eth0"
echo "iface eth0 inet dhcp" >> "$ROOTFS/etc/network/interfaces.d/eth0"

# Informacja o NFS
echo "System NFS skonfigurowany" > "$ROOTFS/etc/nfs-config-info"

exit 0
