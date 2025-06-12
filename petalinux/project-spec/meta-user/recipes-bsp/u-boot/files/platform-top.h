#if defined(CONFIG_MICROBLAZE)
#include <configs/microblaze-generic.h>
#define CONFIG_SYS_BOOTM_LEN 0xF000000
#endif
#if defined(CONFIG_ARCH_ZYNQ)
#include <configs/zynq-common.h>
#endif
#if defined(CONFIG_ARCH_ZYNQMP)
#include <configs/xilinx_zynqmp.h>
#endif
#if defined(CONFIG_ARCH_VERSAL)
#include <configs/xilinx_versal.h>
#endif
#if defined(CONFIG_ARCH_VERSAL_NET)
#include <configs/xilinx_versal_net.h>
#endif
#if defined(CONFIG_MICROBLAZE)
#include <configs/microblaze-generic.h>
#define CONFIG_SYS_BOOTM_LEN 0xF000000
#endif
#if defined(CONFIG_ARCH_ZYNQ)
#include <configs/zynq-common.h>

/* Definicje dla TFTP/NFS */
#define CONFIG_BOOTCOMMAND \
    "run bootcmd_tftp; run bootcmd_mmc; run bootcmd_qspi;"

#define CONFIG_EXTRA_ENV_SETTINGS \
    "ipaddr=192.168.64.80\0" \
    "serverip=192.168.64.32\0" \
    "gatewayip=192.168.64.1\0" \
    "netmask=255.255.255.0\0" \
    "bootcmd_tftp=setenv autoload no; run netloadimage; run netloadfdt; run netboot;\0" \
    "netloadimage=tftp ${kernel_load_address} ${kernel_image};\0" \
    "netloadfdt=tftp ${devicetree_load_address} ${devicetree_image};\0" \
    "netboot=setenv bootargs console=ttyPS0,115200 earlycon root=/dev/nfs nfsroot=${nfsroot},tcp,nfsvers=3 rw rootwait ip=${ipaddr}:${serverip}:${gatewayip}:${netmask}:peta:eth0:off; booti ${kernel_load_address} - ${devicetree_load_address};\0" \
    "nfsroot=192.168.64.32:/home/NFSshare;\0"

#endif
#if defined(CONFIG_ARCH_ZYNQMP)
#include <configs/xilinx_zynqmp.h>
#endif
#if defined(CONFIG_ARCH_VERSAL)
#include <configs/xilinx_versal.h>
#endif
#if defined(CONFIG_ARCH_VERSAL_NET)
#include <configs/xilinx_versal_net.h>
#endif