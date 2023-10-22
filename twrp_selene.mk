#
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

 # Inherit from those products 
  $(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk) 
  $(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk) 
  
 # Inherit from hardware-specific part of the product configuration
  $(call inherit-product, device/xiaomi/selene/device.mk)

 # Enable developer GSI keys 
  $(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk) 
  
 # Configure emulated_storage.mk 
  $(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

 # Inherit from our custom product configuration
   $(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := selene
PRODUCT_NAME := twrp_selene
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 21061119AG
PRODUCT_MANUFACTURER := xiaomi
PRODUCT_RELEASE_NAME := Redmi 10
