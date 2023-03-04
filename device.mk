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

DEVICE_PATH := device/infinix/hot10s
X689_PREBUILT := device/infinix/x689-prebuilt

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/infinix/hot10s/hot10s-vendor.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_effects.conf

# Boot animation
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1640
TARGET_BOOT_ANIMATION_RES := 720

# Bluetooth
PRODUCT_PACKAGES += \
    libldacBT_dec

# Camera
PRODUCT_PACKAGES += \
    GoogleCameraGo

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Dynamic Partitions
PRODUCT_SHIPPING_API_LEVEL := 30
PRODUCT_TARGET_VNDK_VERSION := 30
PRODUCT_EXTRA_VNDK_VERSIONS := 30
PRODUCT_BUILD_SUPER_PARTITION := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Ramdisk
PRODUCT_PACKAGES += \
    init.mt6768.rc \
    fstab.mt6768

# Fstab
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/fstab.mt6768:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6768

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-mtkimpl.recovery \
    android.hardware.boot@1.1-mtkimpl

PRODUCT_PACKAGES_DEBUG += \
    bootctrl.mt6768

# Keylayout
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(DEVICE_PATH)/configs/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0_system \
    android.hidl.manager@1.0_system \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor    

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd
    
# Light
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.hot10s

# NFC stack (AOSP)
PRODUCT_PACKAGES += \
    NfcNci

# KPOC
PRODUCT_PACKAGES += \
    libsuspend \
    android.hardware.health@2.0

# RcsService
PRODUCT_PACKAGES += \
    RcsService

# IMS
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common

# WiFi
PRODUCT_PACKAGES += \
    WifiOverlay \
    TetheringConfigOverlay

# [DNM] Temp permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/xyz.extras.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/xyz.extras.xml \
    $(LOCAL_PATH)/permissions/xyz.extras.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/xyz.extras.xml \
    $(LOCAL_PATH)/permissions/xyz.extras.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/xyz.extras.xml

# Performance level
PRODUCT_PACKAGES += \
    init.performance_level.rc
