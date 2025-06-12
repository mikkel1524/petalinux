#!/bin/bash

# Skrypt do restartu serwera NFS na maszynie hostuj�cej

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
    # Pr�ba uniwersalnych komend
    echo "Nie wykryto systemu, pr�ba uniwersalnych komend..."
    sudo systemctl restart nfs-server 2>/dev/null || \
    sudo systemctl restart nfs-kernel-server 2>/dev/null || \
    sudo service nfs-server restart 2>/dev/null || \
    sudo service nfs-kernel-server restart 2>/dev/null || \
    sudo /etc/init.d/nfs-server restart 2>/dev/null || \
    sudo /etc/init.d/nfs-kernel-server restart 2>/dev/null

    if [ $? -ne 0 ]; then
        echo "Nie uda�o si� zrestartowa� serwera NFS automatycznie."
        echo "Spr�buj r�cznie jedn� z poni�szych komend:"
        echo "sudo systemctl restart nfs-server"
        echo "sudo systemctl restart nfs-kernel-server"
        echo "sudo service nfs-server restart"
        echo "sudo service nfs-kernel-server restart"
        exit 1
    fi
fi

# Sprawdzanie, czy us�ugi NFS dzia�aj�
echo "Sprawdzanie statusu us�ug NFS..."

# rpcbind/portmap powinien dzia�a�
if pgrep -x "rpcbind" > /dev/null || pgrep -x "portmap" > /dev/null; then
    echo "? rpcbind/portmap dzia�a"
else
    echo "? rpcbind/portmap nie dzia�a - pr�ba uruchomienia"
    sudo systemctl start rpcbind 2>/dev/null || sudo service rpcbind start 2>/dev/null
fi

# Sprawdzanie czy mountd dzia�a
if pgrep -x "rpc.mountd" > /dev/null; then
    echo "? rpc.mountd dzia�a"
else
    echo "? rpc.mountd nie dzia�a - mo�e by� problem z serwerem NFS"
fi

# Sprawdzanie czy nfsd dzia�a
if pgrep -x "nfsd" > /dev/null; then
    echo "? nfsd dzia�a"
else
    echo "? nfsd nie dzia�a - mo�e by� problem z serwerem NFS"
fi

# Pokazanie eksportowanych katalog�w
echo "\nEksportowane katalogi NFS:"
sudo exportfs -v

# Sprawdzenie ustawie� NFSv3
echo "\nSprawdzanie ustawie� NFSv3:"
cat /proc/fs/nfsd/versions 2>/dev/null || echo "Nie mo�na sprawdzi� wersji NFS"

echo "\nServer NFS zosta� zrestartowany i powinien teraz obs�ugiwa� NFSv3."
