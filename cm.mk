## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := XT890

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/motorola/XT890/device_XT890.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := XT890
PRODUCT_NAME := cm_XT890
PRODUCT_BRAND := motorola
PRODUCT_MODEL := XT890
PRODUCT_MANUFACTURER := motorola
