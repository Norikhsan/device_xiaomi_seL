 # 
 # Copyright (C) 2023 The Android Open Source Project 
 # Copyright (C) 2023 SebaUbuntu's TWRP device tree generator 
 # 
 # SPDX-License-Identifier: Apache-2.0 
 #  
  
DEVICE_PATH := device/xiaomi/selene

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# A/B
BOARD_USES_RECOVERY_AS_BOOT := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Bootloader 
 TARGET_OTA_ASSERT_DEVICE := selene
 TARGET_BOOTLOADER_BOARD_NAME := selene
 TARGET_NO_BOOTLOADER := true 
 TARGET_USES_UEFI := true

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_KERNEL_CONFIG := selene_defconfig
TARGET_KERNEL_SOURCE := kernel/xiaomi/selene
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
endif

BOARD_USES_METADATA_PARTITION := true
BOARD_USES_VENDORIMAGE   := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 5696502916 # TODO: Fix hardcoded value

BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_PRODUCT    := product

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Use LZ4 Ramdisk compression instead of GZIP 
 BOARD_RAMDISK_USE_LZ4 := true

# Security patch level 
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 20.1.0

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# VNDK Treble
BOARD_VNDK_VERSION := current

# Metadata 
BOARD_USES_METADATA_PARTITION := true 
TARGET_USERIMAGES_USE_EXT4 := true 
TARGET_USERIMAGES_USE_F2FS := true

# Recovery 
 TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
  
 # Use mke2fs to create ext4 images
 TARGET_USES_MKE2FS := true

# Power 
 ENABLE_CPUSETS    := true 
 ENABLE_SCHEDBOOST := true

 # Encryption
 TW_INCLUDE_CRYPTO := true
 TW_INCLUDE_CRYPTO_FBE := true
 TW_INCLUDE_FBE_METADATA_DECRYPT := true
 
# Extras
 TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
 
# System Properties 
 TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# TWRP Configuration
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_DEFAULT_USB_INIT := true

# TWRP Configuration 
 TW_NO_SCREEN_BLANK := true 
 TW_NO_SCREEN_TIMEOUT := true

# set refreshrate
 TW_FRAMERATE := 60
  
# TWRP - Specifics 
 TW_THEME                := portrait_hdpi 
 TW_USE_TOOLBOX          := true 
 TW_INCLUDE_NTFS_3G      := true 
 TW_INCLUDE_FUSE_EXFAT   := true 
 TW_INCLUDE_FUSE_NTFS    := true 
 TW_INCLUDE_REPACKTOOLS  := true 
 TW_INCLUDE_RESETPROP    := true 
 TW_INCLUDE_LIBRESETPROP := true 
 TW_BRIGHTNESS_PATH      := "/sys/class/leds/lcd-backlight/brightness"
 TW_MAX_BRIGHTNESS       := 2047 
 TW_DEFAULT_BRIGHTNESS   := 200 
 TW_EXCLUDE_APEX         := true 
 TW_INCLUDE_FASTBOOTD    := true 
  
 # Debug 
 TARGET_USES_LOGD        := true 
 TWRP_INCLUDE_LOGCAT     := true
