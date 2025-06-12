#!/bin/bash

# Skrypt do budowania i konfiguracji NFS/TFTP dla PetaLinux

set -e

echo "Krok 0: Naprawa kodowania plikow"
chmod +x ./fix_encodings.sh
./fix_encodings.sh

echo "Krok 1: Budowanie projektu PetaLinux"
petalinux-build

echo "Krok 2: Tworzenie katalogow NFS/TFTP (wymagane uprawnienia roota)"
sudo ./nfs_setup.sh

echo "Krok 3: Kopiowanie plikow do katalogow NFS/TFTP (wymagane uprawnienia roota)"
sudo ./nfs_setup_rootfs.sh

echo "Proces zakonczony pomyslnie!"
