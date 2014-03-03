LOCAL_PATH := device/motorola/smi
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/motorola/smi/smi-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/motorola/smi/overlay

PRODUCT_LOCALES := en_US de_DE hdpi
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

#recovery related files
PRODUCT_COPY_FILES += \
											$(LOCAL_PATH)/vendor/watchdogd:recovery/root/sbin/watchdogd \
											$(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
											$(LOCAL_PATH)/vendor/system/etc/firmware/atmxt-r1.tdat:recovery/root/vendor/firmware/atmxt-r1.tdat \
											$(LOCAL_PATH)/vendor/system/etc/firmware/atmxt-r2.tdat:recovery/root/vendor/firmware/atmxt-r2.tdat

#PRODUCT_COPY_FILES += \
#											$(LOCAL_PATH)/prebuilt/boot.image:boot.img \
#											$(LOCAL_PATH)/prebuilt/recovery.image:recovery.img \

PRODUCT_COPY_FILES += \
											$(LOCAL_PATH)/vendor/watchdogd:root/watchdogd \

# copy all ramdisk related files
PRODUCT_COPY_FILES += \
											$(foreach i, $(wildcard $(LOCAL_PATH)/ramdisk/*), $(i):root/$(notdir $(i)))


# copy all input device configurations
PRODUCT_COPY_FILES += \
											$(foreach i, $(wildcard $(LOCAL_PATH)/prebuilt/idc/*), $(i):system/usr/idc/$(notdir $(i)))

#copy all vendor blobs
PRODUCT_COPY_FILES += \
											$(foreach i, $(shell find $(LOCAL_PATH)/vendor/system -type f | cut -d/ -f 6-), $(LOCAL_PATH)/vendor/system/$(i):system/$(i))
# fake ramdisk
PRODUCT_PACKAGES += \
								    fstab.sc1
#sound stuff
PRODUCT_PACKAGES += \
										audio.a2dp.default \
										libasound \
										libaudioutils \
										libtinyalsa \
										audio.usb.default \
										alsa_aplay \
										alsa_ctl \
										alsa_amixer

#Wifi
PRODUCT_PACKAGES += \
										lib_driver_cmd_wl12xx \
										dhcpcd.conf \
										hostapd.conf \
										wpa_supplicant.conf \
										crda \
										regulatory.bin \
										calibrator \
										wlan_prov

#Graphics stuff
PRODUCT_PACKAGES += \
										libdrm
#Debug/systemtools
PRODUCT_PACKAGES += \
										busybox \
										make_ext4fs \
										e2fsck \
										setup_fs \
										libext4_utils \
										parted

# Build tools
PRODUCT_PACKAGES += \
										pack_intel \
										unpack_intel

ADDITIONAL_DEFAULT_PROPERTIES += \
																 panel.physicalWidthmm=52 \
																 panel.physicalHeightmm=89 \
																 ro.sf.lcd_density=240 \
																 ro.adb.secure=0 \
																 ro.secure = 0

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
											ro.adb.secure=0 \
											ro.secure=0


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_smi
PRODUCT_DEVICE := smi


# Get Arm translator
$(call inherit-product-if-exists, vendor/intel/houdini.mk)

# FM Radio Support TI
$(call inherit-product-if-exists, vendor/ti/fmradio/fmradio.mk)
