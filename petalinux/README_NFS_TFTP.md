# Konfiguracja PetaLinux z TFTP/NFS

## Przegl¹d

Ta konfiguracja umo¿liwia uruchomienie systemu PetaLinux z obrazem rootfs zamontowanym przez NFS oraz ³adowanie j¹dra i drzewa urz¹dzeñ przez TFTP. Jest to bardzo przydatne podczas rozwoju, poniewa¿ pozwala na szybkie aktualizacje systemu bez koniecznoœci ci¹g³ego przeprogramowywania pamiêci flash.

## Wymagania

- Serwer (komputer) z systemem Linux (np. Ubuntu)
- P³ytka z uk³adem Zynq pod³¹czona do tej samej sieci
- Podstawowa znajomoœæ protoko³ów NFS i TFTP

## Konfiguracja serwera

1. Uruchom skrypt pomocniczy jako root, aby skonfigurowaæ serwer NFS i TFTP:

   ```bash
   sudo ./nfs_setup.sh
   ```

   Skrypt zainstaluje i skonfiguruje serwer NFS oraz TFTP na komputerze.

2. Zbuduj projekt PetaLinux:

   ```bash
   petalinux-build
   ```

3. Uruchom drugi skrypt, aby skopiowaæ obrazy do odpowiednich katalogów:

   ```bash
   sudo ./nfs_setup_rootfs.sh
   ```

   Ten skrypt automatycznie:
   - Rozpakuje obraz rootfs do katalogu NFS (/home/NFSshare)
   - Skopiuje kernel (Image) i DTB (system.dtb) do katalogu TFTP (/tftpboot/)

## Konfiguracja sieci

Domyœlna konfiguracja zak³ada:

- Adres IP serwera: 192.168.64.32
- P³ytka Zynq jest skonfigurowana do pobierania adresu IP przez DHCP

Jeœli chcesz zmieniæ adres IP serwera, musisz zaktualizowaæ nastêpuj¹ce pliki:

1. `project-spec/meta-user/conf/petalinuxbsp.conf` - zmieñ wartoœæ `NFS_SERVER_IP`
2. `project-spec/meta-user/recipes-bsp/u-boot/files/platform-top.h` - zaktualizuj œcie¿kê `nfsroot` w `CONFIG_EXTRA_ENV_SETTINGS`
3. `nfs_setup.sh` - zmieñ zmienn¹ `HOST_IP`

## Uruchomienie systemu

Po wykonaniu wszystkich powy¿szych kroków, po uruchomieniu p³ytki Zynq, system powinien:

1. Uruchomiæ U-Boot
2. Pobraæ adres IP przez DHCP
3. Pobraæ kernel (Image) i DTB (system.dtb) przez TFTP
4. Zamontowaæ system plików rootfs przez NFS
5. Uruchomiæ j¹dro Linux

Jeœli któryœ z tych kroków zawiedzie, sprawdŸ komunikaty b³êdów w konsoli szeregowej.

## Rozwi¹zywanie problemów

### Nie mo¿na pobraæ plików przez TFTP

- SprawdŸ, czy us³uga TFTP dzia³a: `systemctl status tftpd-hpa`
- SprawdŸ uprawnienia do plików w katalogu TFTP: `ls -la /tftpboot`
- Upewnij siê, ¿e zapora ogniowa nie blokuje portu TFTP (69/UDP)

### Nie mo¿na zamontowaæ NFS

- SprawdŸ, czy us³uga NFS dzia³a: `systemctl status nfs-kernel-server`
- SprawdŸ, czy eksport NFS jest poprawnie skonfigurowany: `exportfs -v`
- Upewnij siê, ¿e zapora ogniowa nie blokuje portów NFS

### Problemy z DHCP

- Upewnij siê, ¿e serwer DHCP jest dostêpny w sieci
- SprawdŸ, czy MAC adres p³ytki Zynq jest poprawnie skonfigurowany

## Wiêcej informacji

Dla bardziej zaawansowanej konfiguracji i rozwi¹zywania problemów, zapoznaj siê z dokumentacj¹ PetaLinux i odpowiednimi protoko³ami:

- [Dokumentacja PetaLinux](https://docs.xilinx.com/r/en-US/ug1144-petalinux-tools-reference-guide)
- [Dokumentacja NFS](https://linux.die.net/man/5/nfs)
- [Dokumentacja TFTP](https://linux.die.net/man/8/tftpd)
