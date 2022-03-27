#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6225-common
include device/xiaomi/sm6225-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/spes

BUILD_BROKEN_DUP_RULES := true

# Board
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# Display
TARGET_SCREEN_DENSITY := 440

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):init_xiaomi_spes
TARGET_RECOVERY_DEVICE_MODULES := init_xiaomi_spes

# Kernel
TARGET_KERNEL_CONFIG := vendor/bengal_defconfig
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_SECOND_OFFSET := 0xf00000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE) --board ""

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/kernel/kernel
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/kernel/dtbo.img
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/kernel/dtb.img
TARGET_FORCE_PREBUILT_KERNEL := true

# OTA assert
TARGET_OTA_ASSERT_DEVICE := spes,spesn

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Inherit from the proprietary version
include vendor/xiaomi/spes/BoardConfigVendor.mk
