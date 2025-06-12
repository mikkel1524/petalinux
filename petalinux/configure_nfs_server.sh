#!/bin/bash

# Skrypt do konfiguracji serwera NFS do pracy z NFSv3

if [ "$(id -u)" -ne 0 ]; then
    echo "Ten skrypt musi byæ uruchomiony jako root"
    exit 1
fi

echo "Konfiguracja serwera NFS do pracy z NFSv3..."

# Wykrywamy system operacyjny
DEBIAN_BASED=false
RHEL_BASED=false

if [ -f /etc/debian_version ]; then
    DEBIAN_BASED=true
    echo "Wykryto system Debian/Ubuntu"
elif [ -f /etc/redhat-release ]; then
    RHEL_BASED=true
    echo "Wykryto system Red Hat/CentOS/Fedora"
fi

# Konfiguracja folderu dla NFS
NFS_DIR="/home/NFSshare"
echo "Konfiguracja katalogu NFS: $NFS_DIR"

if [ ! -d "$NFS_DIR" ]; then
    mkdir -p "$NFS_DIR"
    echo "Utworzono katalog $NFS_DIR"
fi

# Ustawienie uprawnieñ
chown nobody:nogroup "$NFS_DIR" 2>/dev/null || chown nfsnobody:nfsnobody "$NFS_DIR" 2>/dev/null
chmod 777 "$NFS_DIR"

# Konfiguracja /etc/exports
echo "Konfiguracja /etc/exports"
if grep -q "$NFS_DIR" /etc/exports; then
    # Aktualizacja istniej¹cego wpisu
    sed -i "s|$NFS_DIR.*|$NFS_DIR *(rw,sync,no_subtree_check,no_root_squash,insecure)|" /etc/exports
else
    # Dodanie nowego wpisu
    echo "$NFS_DIR *(rw,sync,no_subtree_check,no_root_squash,insecure)" >> /etc/exports
fi

# Konfiguracja nfs.conf
echo "Konfiguracja nfs.conf dla NFSv3"

if [ -f /etc/nfs.conf ]; then
    # Konfiguracja dla nowszych systemów z nfs.conf
    if grep -q "\[nfsd\]" /etc/nfs.conf; then
        # Sekcja [nfsd] ju¿ istnieje, aktualizujemy j¹
        sed -i '/\[nfsd\]/,/\[/{s/^vers3=.*/vers3=y/}' /etc/nfs.conf
        sed -i '/\[nfsd\]/,/\[/{s/^vers4=.*/vers4=n/}' /etc/nfs.conf

        # Sprawdzamy czy dodano wpisy dla wersji
        if ! grep -q "vers3=" /etc/nfs.conf; then
            sed -i '/\[nfsd\]/a vers3=y' /etc/nfs.conf
        fi
        if ! grep -q "vers4=" /etc/nfs.conf; then
            sed -i '/\[nfsd\]/a vers4=n' /etc/nfs.conf
        fi
    else
        # Dodajemy now¹ sekcjê [nfsd]
        echo "" >> /etc/nfs.conf
        echo "[nfsd]" >> /etc/nfs.conf
        echo "vers3=y" >> /etc/nfs.conf
        echo "vers4=n" >> /etc/nfs.conf
    fi
else
    # Dla starszych systemów bez nfs.conf
    if $DEBIAN_BASED; then
        # Debian/Ubuntu
        if [ -f /etc/default/nfs-kernel-server ]; then
            sed -i 's/^RPCNFSDOPTS=.*/RPCNFSDOPTS="--no-nfs-version 4"/' /etc/default/nfs-kernel-server
        else
            echo "RPCNFSDOPTS=\"--no-nfs-version 4\"" > /etc/default/nfs-kernel-server
        fi
    elif $RHEL_BASED; then
        # Red Hat/CentOS/Fedora
        if [ -f /etc/sysconfig/nfs ]; then
            sed -i 's/^RPCNFSDARGS=.*/RPCNFSDARGS="--no-nfs-version 4"/' /etc/sysconfig/nfs
        else
            echo "RPCNFSDARGS=\"--no-nfs-version 4\"" > /etc/sysconfig/nfs
        fi
    fi
fi

# Zastosowanie zmian
echo "Zastosowanie zmian i restart us³ug NFS"

# Aktualizacja eksportów NFS
exportfs -ra

# Restart us³ug
if $DEBIAN_BASED; then
    systemctl restart nfs-kernel-server 2>/dev/null || service nfs-kernel-server restart
elif $RHEL_BASED; then
    systemctl restart nfs-server 2>/dev/null || service nfs-server restart
else
    # Uniwersalne podejœcie
    systemctl restart nfs-server 2>/dev/null || \
    systemctl restart nfs-kernel-server 2>/dev/null || \
    service nfs-server restart 2>/dev/null || \
    service nfs-kernel-server restart 2>/dev/null || \
    /etc/init.d/nfs-server restart 2>/dev/null || \
    /etc/init.d/nfs-kernel-server restart 2>/dev/null
fi

# Sprawdzenie statusu
echo "Sprawdzanie statusu us³ug NFS..."
if $DEBIAN_BASED; then
    systemctl status nfs-kernel-server | grep -E "Active:|nfsd"
elif $RHEL_BASED; then
    systemctl status nfs-server | grep -E "Active:|nfsd"
else
    ps aux | grep -E "nfsd|mountd" | grep -v grep
fi

# Pokazanie eksportowanych katalogów
echo "\nEksportowane katalogi NFS:"
exportfs -v

# Sprawdzenie obs³ugiwanych wersji NFS
if [ -f /proc/fs/nfsd/versions ]; then
    echo "\nObs³ugiwane wersje NFS:"
    cat /proc/fs/nfsd/versions
fi

echo "\nKonfiguracja serwera NFS zosta³a zakoñczona."
echo "Serwer powinien teraz obs³ugiwaæ tylko NFSv3."
