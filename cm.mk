## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := n5

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/zte/n5/device_n5.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := n5
PRODUCT_NAME := cm_n5
PRODUCT_BRAND := zte
PRODUCT_MODEL := n5
PRODUCT_MANUFACTURER := zte
