# Inherit common OmniROM configurations for TWRP
$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, vendor/omni/config/gsm.mk) # Include GSM stuff if needed

## Device identifier
PRODUCT_DEVICE := frt
PRODUCT_NAME := omni_frt
PRODUCT_BRAND := Nokia              # <-- VERIFY from build.prop (ro.product.brand)
PRODUCT_MODEL := Nokia 1            # <-- VERIFY from build.prop (ro.product.model)
PRODUCT_MANUFACTURER := HMD Global  # <-- VERIFY from build.prop (ro.product.manufacturer)

# Optional: Skip bootanimation for faster boot in recovery
# TARGET_BOOT_ANIMATION_RES := 480

# Add device specific properties if needed
# PRODUCT_PROPERTY_OVERRIDES += \
#     key=value
