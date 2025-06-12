# Konfiguracja nfs-utils dla wersji 3

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://nfs.conf file://nfs-common"

do_install:append() {
    # Tworzymy katalog na konfiguracje NFS
    install -d ${D}${sysconfdir}/nfs.conf.d
    install -d ${D}${sysconfdir}/default

    # Instalujemy konfiguracje wymuszajaca NFSv3
    install -m 0644 ${WORKDIR}/nfs.conf ${D}${sysconfdir}/nfs.conf
    install -m 0644 ${WORKDIR}/nfs-common ${D}${sysconfdir}/default/nfs-common

    # Dodatkowe pliki konfiguracyjne dla NFSv3
    echo "[nfsd]" > ${D}${sysconfdir}/nfs.conf.d/server.conf
    echo "vers3=y" >> ${D}${sysconfdir}/nfs.conf.d/server.conf
    echo "vers4=n" >> ${D}${sysconfdir}/nfs.conf.d/server.conf

    echo "[nfsclient]" > ${D}${sysconfdir}/nfs.conf.d/client.conf
    echo "vers3=y" >> ${D}${sysconfdir}/nfs.conf.d/client.conf
    echo "vers4=n" >> ${D}${sysconfdir}/nfs.conf.d/client.conf
}
