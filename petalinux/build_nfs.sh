#!/bin/bash

# Skrypt do budowania i konfiguracji NFS/TFTP dla PetaLinux

set -e

echo "Krok 1: Budowanie projektu PetaLinux"
petalinux-build

echo "Krok 2: Tworzenie katalog�w NFS/TFTP (wymagane uprawnienia roota)"
sudo ./nfs_setup.sh

echo "Krok 3: Kopiowanie plik�w do katalog�w NFS/TFTP (wymagane uprawnienia roota)"
sudo ./nfs_setup_rootfs.sh

echo "Proces zako�czony pomy�lnie!"
