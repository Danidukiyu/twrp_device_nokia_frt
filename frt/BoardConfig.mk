# BoardConfig.mk for Nokia 1 (frt) - TWRP Omni 9.0 Base
# Created: Saturday, April 19, 2025, 11:38 AM +0530, Colombo, Sri Lanka

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53 # Based on MT6737M

# Platform
TARGET_BOARD_PLATFORM := mt6737m
TARGET_BOOTLOADER_BOARD_NAME := mt6735 # Default, ro.product.board was missing

# Kernel
TARGET_KERNEL_SOURCE := kernel/nokia/frt # Relative path within TWRP source
TARGET_KERNEL_ARCH := arm
# !!! ACTION REQUIRED: Find correct defconfig in kernel/nokia/frt/arch/arm/configs/ !!!
TARGET_KERNEL_CONFIG := FRT_defconfig # <-- REPLACE with actual filename! 
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,32N2 buildvariant=user veritykeyid=id:7e4333f9bba00adfe0ede979e28ed1920492b40f # From magiskboot output
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x04000000 # From magiskboot output (use offset)
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_TAGS_OFFSET := 0x0e000000
BOARD_KERNEL_IMAGE_NAME := zImage-dtb # Assumes kernel makefile appends DTB

# Partitions - !!! ACTION REQUIRED: GET SIZES FROM SCATTER FILE (Bytes) !!!
# Convert hex from scatter (e.g., 0x1000000) to decimal bytes (e.g., 16777216)
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216      # EXAMPLE: 16MB (REPLACE!)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216  # EXAMPLE: 16MB (REPLACE!)
BOARD_SYSTEMIMAGE_PARTITION_SIZE :=  1459617792 # EXAMPLE: 1.5GB (REPLACE!)
BOARD_VENDORIMAGE_PARTITION_SIZE := 335544320   # EXAMPLE: 512MB (REPLACE!)
BOARD_CACHEIMAGE_PARTITION_SIZE := 159383552    # EXAMPLE: 256MB (REPLACE!)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5662310400 # EXAMPLE: ~4.6GB (REPLACE!) Get size for 'userdata' partition!
BOARD_FLASH_BLOCK_SIZE := 131072 # Common eMMC block size (128KiB); Should be okay unless scatter indicates otherwise

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true 
TARGET_USERIMAGES_USE_F2FS := true # Since /data is f2fs in your fstab
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
# TARGET_COPY_OUT_PRODUCT := product # Add if product partition exists and is needed
# TARGET_COPY_OUT_ODM := odm       # Add if odm partition exists and is needed

# TWRP specific configuration flags
TW_THEME := portrait_hdpi # For 480x854 resolution
RECOVERY_SDCARD_ON_DATA := true # Standard for internal storage simulation
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565" # Common default, change if needed
# !!! ACTION REQUIRED: VERIFY BRIGHTNESS PATH from decompiled.dts or similar MTK device !!!
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness" 
TW_MAX_BRIGHTNESS := 255 
TW_DEFAULT_BRIGHTNESS := 162 
# Crypto Flags (Based on fstab having encryptable=/.../metadata for /data)
TW_INCLUDE_CRYPTO := true 
TW_INCLUDE_CRYPTO_FBE := true # File Based Encryption
TW_INCLUDE_CRYPTO_METADATA := true # Uses metadata partition
# Common Flags
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_EXTRA_LANGUAGES := true
TW_EXCLUDE_SUPERSU := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
# BOARD_HAS_NO_REAL_SDCARD := true # Uncomment if device truly lacks an external MicroSD slot

# Bootloader - Needed for Reboot options in TWRP
TARGET_BOOTLOADER_IS_MTK := true # Important!

# Inherit Omni TWRP specifics AFTER your definitions
$(call inherit-product, vendor/omni/config/twrp.mk)
