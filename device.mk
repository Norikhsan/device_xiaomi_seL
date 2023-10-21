#
# Inherit from the common Open Source product configuration

# Enable developer GSI keys 
 $(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk) 
  
 # Configure emulated_storage.mk 
 $(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

LOCAL_PATH := device/xiaomi/selene

#SHIPPING API
 PRODUCT_SHIPPING_API_LEVEL  := 30
 
#VNDK API
 PRODUCT_TARGET_VNDK_VERSION := 33

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script 

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-recovery \
    android.hardware.boot@1.1-impl \
    android.hardware.boot@1.1-service \
    bootctrl.$(PRODUCT_PLATFORM).recovery

 # Update engine
PRODUCT_PACKAGES += \
    update_engine \
    cppreopts.sh \
    update_engine_sideload \
    update_verifier \
    checkpoint_gc

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    fastbootd
    
# Health Hal
PRODUCT_PACKAGES += \
     android.hardware.health@2.1-impl \
     android.hardware.health@2.1-service \
     libhealthd.$(PRODUCT_PLATFORM)
     
# lptool
PRODUCT_PACKAGES += \
    lptools

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster41 \
    libkeymaster4 \
    libpuresoftkeymasterdevice

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster41.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root,recovery/root) \
            $(LOCAL_PATH)/prebuilt/dtb.img:dtb.img

# enable USB Storage
 TW_NO_USB_STORAGE := false

# set refreshrate
 TW_FRAMERATE := 60

# Display Size & Density 
 TARGET_SCREEN_HEIGHT  := 2400 
 TARGET_SCREEN_DENSITY := 395 
 TARGET_SCREEN_WIDTH   := 1080

 TW_BATTERY_SYSFS_WAIT_SECONDS := 6 
 TW_EXCLUDE_DEFAULT_USB_INIT   := true 
 TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true
  
# Soong namespaces 
 PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH) 
 
# TWRP - Specifics 
 TW_THEME                := portrait_hdpi 
 TW_USE_TOOLBOX          := true 
 TW_INCLUDE_NTFS_3G      := true 
 TW_INCLUDE_FUSE_EXFAT   := true 
 TW_INCLUDE_FUSE_NTFS    := true 
 TW_INCLUDE_REPACKTOOLS  := true 
 TW_INCLUDE_RESETPROP    := true 
 TW_INCLUDE_LIBRESETPROP := true 
 TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
 TW_MAX_BRIGHTNESS       := 2047 
 TW_EXTRA_LANGUAGES      := true 
 TW_DEFAULT_BRIGHTNESS   := 200 
 TW_EXCLUDE_APEX         := true 
 TW_HAS_EDL_MODE         := true 
 TW_INCLUDE_FASTBOOTD    := true 
 TWRP_INCLUDE_LOGCAT     := true
