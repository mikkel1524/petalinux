# Konfiguracja PetaLinux z TFTP/NFS

## Przegl�d

Ta konfiguracja umo�liwia uruchomienie systemu PetaLinux z obrazem rootfs zamontowanym przez NFS oraz �adowanie j�dra i drzewa urz�dze� przez TFTP. Jest to bardzo przydatne podczas rozwoju, poniewa� pozwala na szybkie aktualizacje systemu bez konieczno�ci ci�g�ego przeprogramowywania pami�ci flash.

## Wymagania

- Serwer (komputer) z systemem Linux (np. Ubuntu)
- P�ytka z uk�adem Zynq pod��czona do tej samej sieci
- Podstawowa znajomo�� protoko��w NFS i TFTP

## Konfiguracja serwera

1. Uruchom skrypt pomocniczy jako root, aby skonfigurowa� serwer NFS i TFTP:

   ```bash
   sudo ./nfs_setup.sh
   ```

   Skrypt zainstaluje i skonfiguruje serwer NFS oraz TFTP na komputerze.

2. Zbuduj projekt PetaLinux:

   ```bash
   petalinux-build
   ```

3. Uruchom drugi skrypt, aby skopiowa� obrazy do odpowiednich katalog�w:

   ```bash
   sudo ./nfs_setup_rootfs.sh
   ```

   Ten skrypt automatycznie:
   - Rozpakuje obraz rootfs do katalogu NFS (/home/NFSshare)
   - Skopiuje kernel (Image) i DTB (system.dtb) do katalogu TFTP (/tftpboot/)

## Konfiguracja sieci

Domy�lna konfiguracja zak�ada:

- Adres IP serwera: 192.168.64.32
- P�ytka Zynq jest skonfigurowana do pobierania adresu IP przez DHCP

Je�li chcesz zmieni� adres IP serwera, musisz zaktualizowa� nast�puj�ce pliki:

1. `project-spec/meta-user/conf/petalinuxbsp.conf` - zmie� warto�� `NFS_SERVER_IP`
2. `project-spec/meta-user/recipes-bsp/u-boot/files/platform-top.h` - zaktualizuj �cie�k� `nfsroot` w `CONFIG_EXTRA_ENV_SETTINGS`
3. `nfs_setup.sh` - zmie� zmienn� `HOST_IP`

## Uruchomienie systemu

Po wykonaniu wszystkich powy�szych krok�w, po uruchomieniu p�ytki Zynq, system powinien:

1. Uruchomi� U-Boot
2. Pobra� adres IP przez DHCP
3. Pobra� kernel (Image) i DTB (system.dtb) przez TFTP
4. Zamontowa� system plik�w rootfs przez NFS
5. Uruchomi� j�dro Linux

Je�li kt�ry� z tych krok�w zawiedzie, sprawd� komunikaty b��d�w w konsoli szeregowej.

## Rozwi�zywanie problem�w

### Nie mo�na pobra� plik�w przez TFTP

- Sprawd�, czy us�uga TFTP dzia�a: `systemctl status tftpd-hpa`
- Sprawd� uprawnienia do plik�w w katalogu TFTP: `ls -la /tftpboot`
- Upewnij si�, �e zapora ogniowa nie blokuje portu TFTP (69/UDP)

### Nie mo�na zamontowa� NFS

- Sprawd�, czy us�uga NFS dzia�a: `systemctl status nfs-kernel-server`
- Sprawd�, czy eksport NFS jest poprawnie skonfigurowany: `exportfs -v`
- Upewnij si�, �e zapora ogniowa nie blokuje port�w NFS

### Problemy z DHCP

- Upewnij si�, �e serwer DHCP jest dost�pny w sieci
- Sprawd�, czy MAC adres p�ytki Zynq jest poprawnie skonfigurowany

## Wi�cej informacji

Dla bardziej zaawansowanej konfiguracji i rozwi�zywania problem�w, zapoznaj si� z dokumentacj� PetaLinux i odpowiednimi protoko�ami:

- [Dokumentacja PetaLinux](https://docs.xilinx.com/r/en-US/ug1144-petalinux-tools-reference-guide)
- [Dokumentacja NFS](https://linux.die.net/man/5/nfs)
- [Dokumentacja TFTP](https://linux.die.net/man/8/tftpd)
