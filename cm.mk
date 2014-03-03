## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := Razr i

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

TARGET_BOOTANIMATION_NAME := 540
TARGET_SCREEN_WIDTH := 540
TARGET_SCREEN_HEIGHT := 960

# Inherit device configuration
$(call inherit-product, device/motorola/smi/device_smi.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_no_telephony.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := smi
PRODUCT_NAME := cm_smi
PRODUCT_BRAND := motorola
PRODUCT_MODEL := XT890
PRODUCT_MANUFACTURER := motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
																PRODUCT_BRAND=motorola \
																PRODUCT_NAME=XT890 \
																BUILD_PRODUCT=smi
