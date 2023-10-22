# Copyright (C) 2020 The Android Open Source Project 
 # Copyright (C) 2020 The TWRP Open Source Project 
 # Copyright (C) 2020 SebaUbuntu's TWRP device tree generator 
 # 
 # Licensed under the Apache License, Version 2.0 (the "License"); 
 # you may not use this file except in compliance with the License. 
 # You may obtain a copy of the License at 
 # 
 #     http://www.apache.org/licenses/LICENSE-2.0 
 # 
 # Unless required by applicable law or agreed to in writing, software 
 # distributed under the License is distributed on an "AS IS" BASIS, 
 # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
 # See the License for the specific language governing permissions and 
 # limitations under the License. 
 # 
  
 LOCAL_PATH := device/xiaomi/selene 
  
 # Dynamic Partitions 
 PRODUCT_USE_DYNAMIC_PARTITIONS := true 
  
 # VNDK 
 PRODUCT_TARGET_VNDK_VERSION := 30 
  
 # API 
 PRODUCT_SHIPPING_API_LEVEL := 30 
  
 # V A/B 
 ENABLE_VIRTUAL_AB := true 
 $(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk) 
  
 AB_OTA_POSTINSTALL_CONFIG += \ 
     RUN_POSTINSTALL_system=true \ 
     POSTINSTALL_PATH_system=system/bin/otapreopt_script \ 
     FILESYSTEM_TYPE_system=ext4 \ 
     POSTINSTALL_OPTIONAL_system=true 
  
 # Boot control HAL 
 PRODUCT_PACKAGES += \ 
     android.hardware.boot@1.1-impl-recovery \ 
     android.hardware.boot@1.1-impl \ 
     android.hardware.boot@1.1-service \ 
     bootctrl.$(PRODUCT_PLATFORM).recovery 
  
 PRODUCT_PACKAGES_DEBUG += \ 
     update_engine_client 
  
 PRODUCT_PACKAGES += \ 
     otapreopt_script \ 
     cppreopts.sh \ 
     update_engine \ 
     update_verifier \ 
     update_engine_sideload 
  
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

# enable USB Storage
 TW_NO_USB_STORAGE := false

# set refreshrate
 TW_FRAMERATE := 60

# Display Size & Density 
 TARGET_SCREEN_HEIGHT  := 2400 
 TARGET_SCREEN_DENSITY := 405 
 TARGET_SCREEN_WIDTH   := 1080

 TW_BATTERY_SYSFS_WAIT_SECONDS := 6 
 TW_EXCLUDE_DEFAULT_USB_INIT   := true 
  
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
