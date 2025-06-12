#!/bin/bash

# Skrypt do budowania i konfiguracji NFS/TFTP dla PetaLinux

set -e

echo "Krok 1: Budowanie projektu PetaLinux"
petalinux-build

echo "Krok 2: Tworzenie katalogów NFS/TFTP (wymagane uprawnienia roota)"
sudo ./nfs_setup.sh

echo "Krok 3: Kopiowanie plików do katalogów NFS/TFTP (wymagane uprawnienia roota)"
sudo ./nfs_setup_rootfs.sh

echo "Proces zakoñczony pomyœlnie!"
