#
# Copyright (C) 2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from hot10s device makefile
$(call inherit-product, device/infinix/hot10s/device.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/nusantara/config/common_full_phone.mk)
USE_PIXEL_CHARGING := true
IS_PHONE := true

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := hot10s
PRODUCT_NAME := nad_hot10s
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix Hot 10S
PRODUCT_MANUFACTURER := Infinix

PRODUCT_GMS_CLIENTID_BASE := android-infinix
TARGET_VENDOR := infinix
TARGET_VENDOR_PRODUCT_NAME := hot10s
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="sys_tssi_64_infinix-user 11 RP1A.200720.011 237644 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := Infinix/TSSI/FULL-64:11/RP1A.200720.011/220210V366:user/release-keys
