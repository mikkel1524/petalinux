# Dodanie konfiguracji NFS do obrazu minimalnego

# Funkcja do przygotowania konfiguracji NFS
NFS_CONFIG_SCRIPT = "${WORKDIR}/nfs-config.sh"

SRC_URI:append = " file://nfs-config.sh"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

do_rootfs[depends] += "bash-native:do_populate_sysroot"

python do_rootfs_append() {
    import subprocess
    import os

    script = d.getVar('NFS_CONFIG_SCRIPT')
    rootfs = d.getVar('IMAGE_ROOTFS')

    if os.path.exists(script):
        cmd = ["bash", script, rootfs]
        subprocess.check_call(cmd)
}
