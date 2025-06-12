#!/bin/bash

# Skrypt do konfiguracji statycznego IP dla p³ytki PetaLinux

echo "Konfiguracja statycznego IP dla p³ytki PetaLinux"
echo "Adres IP: 192.168.64.80/24"
echo "Brama domyœlna: 192.168.64.1"
echo "Serwer NFS: 192.168.64.32"

# Aktualizacja plików konfiguracyjnych
echo "Przebudowanie systemu..."
petalinux-build

echo "Konfiguracja zakoñczona. Nale¿y uruchomiæ p³ytkê ponownie."
echo "SprawdŸ, czy adres IP 192.168.64.80 jest dostêpny w sieci."

# Sprawdzenie po³¹czenia po uruchomieniu
echo "Po uruchomieniu p³ytki mo¿esz sprawdziæ po³¹czenie:"
echo "ping 192.168.64.80"
echo "ssh root@192.168.64.80"
