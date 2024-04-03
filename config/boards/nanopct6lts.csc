# Rockchip RK3588S octa core 8GB RAM SoC eMMC USB3 USB2 1x GbE 2x 2.5GbE
BOARD_NAME="NanoPC T6"
BOARDFAMILY="rockchip-rk3588"
BOARD_MAINTAINER="Tonymac32"
BOOTCONFIG="nanopc_t6_defconfig" # vendor name, not standard, see hook below, set BOOT_SOC below to compensate
BOOT_SOC="rk3588"
KERNEL_TARGET="legacy,vendor,edge,collabora"
FULL_DESKTOP="yes"
BOOT_LOGO="desktop"
BOOT_FDT_FILE="rockchip/rk3588-nanopc-t6-lts.dtb"
BOOT_SCENARIO="spl-blobs"
BOOT_SUPPORT_SPI="yes"
BOOT_SPI_RKSPI_LOADER="yes"
IMAGE_PARTITION_TABLE="gpt"
BOOTFS_TYPE="fat"
declare -g UEFI_EDK2_BOARD_ID="nanopc-t6" # This _only_ used for uefi-edk2-rk3588 extension

function post_family_tweaks__nanopct6_naming_audios() {
	display_alert "$BOARD" "Renaming nanopct6 audio" "info"

	mkdir -p $SDCARD/etc/udev/rules.d/
	echo 'SUBSYSTEM=="sound", ENV{ID_PATH}=="platform-hdmi0-sound", ENV{SOUND_DESCRIPTION}="HDMI0 Audio"' > $SDCARD/etc/udev/rules.d/90-naming-audios.rules

	return 0
}
