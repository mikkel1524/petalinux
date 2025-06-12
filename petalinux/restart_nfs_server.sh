#!/bin/bash

# Skrypt do restartu serwera NFS na maszynie hostuj¹cej

echo "Restartowanie serwera NFS..."

# Wykrywamy system operacyjny
if [ -f /etc/debian_version ]; then
    # Debian/Ubuntu
    echo "Wykryto system Debian/Ubuntu"
    sudo systemctl restart nfs-kernel-server

elif [ -f /etc/redhat-release ]; then
    # Red Hat/CentOS/Fedora
    echo "Wykryto system Red Hat/CentOS/Fedora"
    sudo systemctl restart nfs-server

elif [ -f /etc/SuSE-release ] || [ -f /etc/SUSE-brand ]; then
    # SUSE
    echo "Wykryto system SUSE"
    sudo systemctl restart nfsserver

elif [ -f /etc/arch-release ]; then
    # Arch Linux
    echo "Wykryto system Arch Linux"
    sudo systemctl restart nfs-server

else
    # Próba uniwersalnych komend
    echo "Nie wykryto systemu, próba uniwersalnych komend..."
    sudo systemctl restart nfs-server 2>/dev/null || \
    sudo systemctl restart nfs-kernel-server 2>/dev/null || \
    sudo service nfs-server restart 2>/dev/null || \
    sudo service nfs-kernel-server restart 2>/dev/null || \
    sudo /etc/init.d/nfs-server restart 2>/dev/null || \
    sudo /etc/init.d/nfs-kernel-server restart 2>/dev/null

    if [ $? -ne 0 ]; then
        echo "Nie uda³o siê zrestartowaæ serwera NFS automatycznie."
        echo "Spróbuj rêcznie jedn¹ z poni¿szych komend:"
        echo "sudo systemctl restart nfs-server"
        echo "sudo systemctl restart nfs-kernel-server"
        echo "sudo service nfs-server restart"
        echo "sudo service nfs-kernel-server restart"
        exit 1
    fi
fi

# Sprawdzanie, czy us³ugi NFS dzia³aj¹
echo "Sprawdzanie statusu us³ug NFS..."

# rpcbind/portmap powinien dzia³aæ
if pgrep -x "rpcbind" > /dev/null || pgrep -x "portmap" > /dev/null; then
    echo "? rpcbind/portmap dzia³a"
else
    echo "? rpcbind/portmap nie dzia³a - próba uruchomienia"
    sudo systemctl start rpcbind 2>/dev/null || sudo service rpcbind start 2>/dev/null
fi

# Sprawdzanie czy mountd dzia³a
if pgrep -x "rpc.mountd" > /dev/null; then
    echo "? rpc.mountd dzia³a"
else
    echo "? rpc.mountd nie dzia³a - mo¿e byæ problem z serwerem NFS"
fi

# Sprawdzanie czy nfsd dzia³a
if pgrep -x "nfsd" > /dev/null; then
    echo "? nfsd dzia³a"
else
    echo "? nfsd nie dzia³a - mo¿e byæ problem z serwerem NFS"
fi

# Pokazanie eksportowanych katalogów
echo "\nEksportowane katalogi NFS:"
sudo exportfs -v

# Sprawdzenie ustawieñ NFSv3
echo "\nSprawdzanie ustawieñ NFSv3:"
cat /proc/fs/nfsd/versions 2>/dev/null || echo "Nie mo¿na sprawdziæ wersji NFS"

echo "\nServer NFS zosta³ zrestartowany i powinien teraz obs³ugiwaæ NFSv3."
