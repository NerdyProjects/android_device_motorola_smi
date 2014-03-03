include $(GENERIC_X86_CONFIG_MK)

# inherit from the proprietary version
-include vendor/motorola/smi/BoardConfigVendor.mk

LOCAL_PATH := device/motorola/smi
TARGET_ARCH := x86
TARGET_BOARD_PLATFORM := sc1
TARGET_CPU_ABI := x86
# we should also try x86 without atom here.
TARGET_ARCH_VARIANT := x86-atom
TARGET_ARCH_VARIANT_FPU := sse
TARGET_BOOTLOADER_BOARD_NAME := smi
TARGET_CPU_SMP := true

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

BOARD_MALLOC_ALIGNMENT := 16

BOARD_KERNEL_CMDLINE := init=/init pci=noearly console=logk0 vmalloc=256M earlyprintk=nologger hsu_dma=7 kmemleak=off androidboot.bootmedia=sdcard androidboot.hardware=sc1 emmc_ipanic.ipanic_part_number=6 loglevel=4

# Storage information
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_MAX_PARTITIONS := 20
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 11534336 # 0x00b00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912 # 0x20000000
BOARD_FLASH_BLOCK_SIZE := 2048

# Ramdisk
#DEVICE_RAMDISK_CONTENT := $(LOCAL_PATH)/prebuilt/ramdisk
TARGET_PROVIDES_INIT_RC := true

# Blutetooth
BOARD_HAVE_BLUETOOTH := true
# BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/Bluetooth

# NFC
BOARD_HAVE_NFC := true

# Audio
#COMMON_GLOBAL_CFLAGS += -DICS_AUDIO_BLOB
BUILD_WITH_ALSA_UTILS := true
BUILD_WITH_ALSA_AUDIO := true

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/prebuilt/egl.cfg
BOARD_USE_LIBVA_INTEL_DRIVER := true
BOARD_USE_LIBVA := true
BOARD_USE_LIBMIX := true
BOARD_USES_WRS_OMXIL_CORE := true
# USE_INTEL_OMX_COMPONENTS := true

TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# taken from https://github.com/Angel666/android_device_samsung_santos103g/blob/master/BoardConfig.mk
BOARD_USES_HWCOMPOSER := true
USE_OPENGL_RENDERER := true

# Turn on GR_STATIC_RECT_VB flag in skia to boost performance
TARGET_USE_GR_STATIC_RECT_VB := true

# Skip droiddoc build to save build time
BOARD_SKIP_ANDROID_DOC_BUILD := true

# Needed for blobs 4.2+
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Recovery configuration global
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
#BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/motorola/smi/recovery_keys.c
TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/recovery.init.rc
DEVICE_BASE_RECOVERY_IMAGE := $(LOCAL_PATH)/prebuilt/recovery.image
BOARD_HAS_NO_SELECT_BUTTON := true
#BOARD_TOUCH_RECOVERY := true
BOARD_RECOVERY_SWIPE := true
# Recovery options TWRP
DEVICE_RESOLUTION := 540x960
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_CUSTOM_BATTERY_PATH := /sys/class/power_supply/max170xx_battery
RECOVERY_SDCARD_ON_DATA := true
#BOARD_HAS_NO_REAL_SDCARD := true
TW_NO_USB_STORAGE := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true

#TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
#needs cleanup, for now just create an additional toolchain variable...
TARGET_KERNEL_SOURCE := kernel/kernel/linux-3.0
TARGET_KERNEL_CONFIG := x86_mfld_cm11_defconfig
X86_EABI_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/x86/i686-linux-android-4.7

# wifi modules from CM itself seem to work (at least on CM10.1)
WIFI_MODULES_SOURCE := "hardware/ti/wlan/mac80211/compat_wl12xx"

WIFI_MODULES:
	make -C $(WIFI_MODULES_SOURCE) KERNEL_DIR=$(KERNEL_OUT) KLIB=$(KERNEL_OUT) KLIB_BUILD=$(KERNEL_OUT) ARCH=$(TARGET_ARCH) clean
	make -C $(WIFI_MODULES_SOURCE) KERNEL_DIR=$(KERNEL_OUT) KLIB=$(KERNEL_OUT) KLIB_BUILD=$(KERNEL_OUT) ARCH=$(TARGET_ARCH) -j 4
	mv hardware/ti/wlan/mac80211/compat_wl12xx/compat/compat.ko $(KERNEL_MODULES_OUT)
	mv hardware/ti/wlan/mac80211/compat_wl12xx/net/mac80211/mac80211.ko $(KERNEL_MODULES_OUT)
	mv hardware/ti/wlan/mac80211/compat_wl12xx/net/wireless/cfg80211.ko $(KERNEL_MODULES_OUT)
	mv hardware/ti/wlan/mac80211/compat_wl12xx/drivers/net/wireless/wl12xx/wl12xx.ko $(KERNEL_MODULES_OUT)
	mv hardware/ti/wlan/mac80211/compat_wl12xx/drivers/net/wireless/wl12xx/wl12xx_sdio.ko $(KERNEL_MODULES_OUT)

TARGET_KERNEL_MODULES := WIFI_MODULES

ADDITIONAL_BUILD_PROPERTIES += ro.config.personality=compat_layout

BUILD_WITH_FULL_STAGEFRIGHT := true

BOARD_HAS_NO_SELECT_BUTTON := true
USES_TI_MAC80211 := true

# TI12xx serie wifi specific
COMMON_GLOBAL_CFLAGS += -DUSES_TI_MAC80211
WPA_SUPPLICANT_VERSION         := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER    := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wl12xx
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_wl12xx
PRODUCT_WIRELESS_TOOLS := true
BOARD_WLAN_DEVICE := wl12xx_mac80211
BOARD_SOFTAP_DEVICE := wl12xx_mac80211
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wl12xx_sdio.ko"
WIFI_DRIVER_MODULE_NAME := "wl12xx_sdio"

COMMON_GLOBAL_CFLAGS += -DMOTOROLA_UIDS

DEVICE_BASE_BOOT_IMAGE := $(LOCAL_PATH)/prebuilt/boot.image
DEVICE_BASE_RECOVERY_IMAGE := $(LOCAL_PATH)/prebuilt/recovery.image
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/boottools/boot.mk
RAZRI_IMAGE := true
