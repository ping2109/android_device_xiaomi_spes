#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from spes/spesn device
$(call inherit-product, device/xiaomi/spes/device.mk)

# Inherit some common Project Awaken stuff.
$(call inherit-product, vendor/awaken/config/common_full_phone.mk)

# Additions
$(call inherit-product-if-exists, vendor/gapps/basic/config.mk)

# Camera
$(call inherit-product-if-exists, vendor/miuicamera/config.mk)

# Boot Animation Resolution
TARGET_BOOT_ANIMATION_RES := 1080

# GApps
TARGET_GAPPS_ARCH := arm64
USE_GAPPS := true

# Google Recorder
TARGET_SUPPORTS_GOOGLE_RECORDER := true

# Official
AWAKEN_BUILD_TYPE := UNOFFICIAL

# Quick Tap
TARGET_SUPPORTS_QUICK_TAP := true

# Product Specifics
PRODUCT_NAME := awaken_spes
PRODUCT_DEVICE := spes
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi Note 11
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service-sdm

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="spes-user 11 RKQ1.211001.001 V13.0.9.0.RGCMIXM release-keys"

BUILD_FINGERPRINT := Redmi/spes/spes:11/RKQ1.211001.001/V13.0.9.0.RGCMIXM:user/release-keys
