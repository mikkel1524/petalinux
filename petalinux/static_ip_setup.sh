#!/bin/bash

# Skrypt do konfiguracji statycznego IP dla p�ytki PetaLinux

echo "Konfiguracja statycznego IP dla p�ytki PetaLinux"
echo "Adres IP: 192.168.64.80/24"
echo "Brama domy�lna: 192.168.64.1"
echo "Serwer NFS: 192.168.64.32"

# Aktualizacja plik�w konfiguracyjnych
echo "Przebudowanie systemu..."
petalinux-build

echo "Konfiguracja zako�czona. Nale�y uruchomi� p�ytk� ponownie."
echo "Sprawd�, czy adres IP 192.168.64.80 jest dost�pny w sieci."

# Sprawdzenie po��czenia po uruchomieniu
echo "Po uruchomieniu p�ytki mo�esz sprawdzi� po��czenie:"
echo "ping 192.168.64.80"
echo "ssh root@192.168.64.80"
