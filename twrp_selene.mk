# 
 # Copyright (C) 2023 The Android Open Source Project 
 # Copyright (C) 2023 SebaUbuntu's TWRP device tree generator 
 # 
 # SPDX-License-Identifier: Apache-2.0 
 # 
  
 # Inherit from those products. Most specific first. 
 $(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk) 
 $(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk) 
  
 # Inherit from our custom product configuration 
 $(call inherit-product, vendor/twrp/config/common.mk) 
  
 # Inherit from selene device 
 $(call inherit-product, device/xiaomi/selene/device.mk) 
  
 # Device identifier. This must come after all inclusions 
 PRODUCT_DEVICE := selene 
 PRODUCT_NAME := twrp_selene 
 PRODUCT_BRAND := xiaomi 
 PRODUCT_MODEL := Redmi 10 
 PRODUCT_MANUFACTURER := xiaomi