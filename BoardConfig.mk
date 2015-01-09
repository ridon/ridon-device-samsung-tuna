#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_FOLDER := device/samsung/tuna

WITH_DEXPREOPT := true

PRODUCT_VENDOR_KERNEL_HEADERS := $(DEVICE_FOLDER)/kernel-headers

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_FOLDER)/include

# Setup custom omap4xxx defines
BOARD_USE_CUSTOM_LIBION := true

# Use the non-open-source parts, if they're present
-include vendor/samsung/tuna/BoardConfigVendor.mk

TARGET_BOOTLOADER_BOARD_NAME := tuna

# Processor
# Default values, if not overridden else where.
TARGET_BOARD_INFO_FILE := $(DEVICE_FOLDER)/board-info.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_FOLDER)/bluetooth

TARGET_BOARD_OMAP_CPU := 4460
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a9
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_FPU_VARIANT := neon-fp16

TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_BASE := 0x80000000
# BOARD_KERNEL_CMDLINE :=

# Inline kernel building
TARGET_KERNEL_CONFIG := tuna_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/tuna

# Fall back to prebuilt kernel if the sources aren't present
# or inline kernel building is not supported
TARGET_PREBUILT_KERNEL := $(DEVICE_FOLDER)/kernel

# GCC 4.8 somehow breaks the eMMC patch applied on boot-up for VYL00M eMMCs on maguro.
# While this can be worked around, I don't trust it for anything. All tuna kernel devs
# seem to be in agreement on 4.8 being terrible for the kernel, and it's not just tuna
# that has issues with it. GCC 4.9 is better than 4.8 at least though; so, if we're not
# using GCC 4.9 for the kernel build, force GCC 4.7, which is rock-solid for kernels.
ifneq ($(TARGET_GCC_VERSION_OTHER),4.9)
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.7
endif

TARGET_PREBUILT_KERNEL := $(DEVICE_FOLDER)/kernel

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := omap4
TARGET_BOOTLOADER_BOARD_NAME := tuna

TARGET_TI_HWC_HDMI_DISABLED := true

# Franken-domx
BOARD_USE_TI_CUSTOM_DOMX := true
TARGET_SPECIFIC_HEADER_PATH += $(DEVICE_FOLDER)/domx/omx_core/inc
TI_CUSTOM_DOMX_PATH := $(DEVICE_FOLDER)/domx
DOMX_PATH := $(DEVICE_FOLDER)/domx
COMMON_GLOBAL_CFLAGS += -DOMAP_TUNA

BOARD_USE_TI_DUCATI_H264_PROFILE := true

# For enabling some things that are OMAP_ENHANCEMENT's and are applicable to tuna...
OMAP_TUNA := true

BOARD_CREATE_TUNA_HDCP_KEYS_SYMLINK := true

USE_OPENGL_RENDERER := true

BOARD_USE_TI_DUCATI_H264_PROFILE := true

# Include HDCP keys
BOARD_CREATE_TUNA_HDCP_KEYS_SYMLINK := true

# set if the target supports FBIO_WAITFORVSYNC
TARGET_HAS_WAITFORVSYNC := true

# Force the screenshot path to CPU consumer
COMMON_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH

# libwvm needs this, among other things
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Possible fix for Chromecast streaming...
BOARD_USE_TI_DUCATI_H264_PROFILE := true

# use FBIOPUT_DISPLAY instead of FBIOPUT_VSCREENINFO to refresh the display.
TARGET_USE_PAN_DISPLAY := true

TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

TARGET_NEEDS_BIONIC_MD5 := true

TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_UI_LIB := librecovery_ui_tuna

# device-specific extensions to the updater binary
# inexplicable build errors with Lollipop...
TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_tuna
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_FOLDER)

TARGET_RECOVERY_FSTAB = $(DEVICE_FOLDER)/rootdir/fstab.tuna
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_SETS_FSTAB := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 685768704
BOARD_USERDATAIMAGE_PARTITION_SIZE := 14539537408
BOARD_FLASH_BLOCK_SIZE := 4096

# No sync framework for this device...
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

#TARGET_PROVIDES_INIT_RC := true
#TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# Wifi
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WLAN_DEVICE_REV            := bcm4330_b2
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
#WIFI_DRIVER_MODULE_PATH         := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_BAND                        := 802_11_ABG

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_FOLDER)/bluetooth

# Boot animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true

BOARD_HAL_STATIC_LIBRARIES := libdumpstate.tuna

# Security
BOARD_USES_SECURE_SERVICES := true

# Recovery
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_FSTAB = $(DEVICE_FOLDER)/rootdir/fstab.tuna
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_UI_LIB := librecovery_ui_tuna
BOARD_RECOVERY_SWIPE := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
BOARD_SEPOLICY_DIRS += \
	$(DEVICE_FOLDER)/sepolicy

BOARD_SEPOLICY_UNION += \
	genfs_contexts \
	file_contexts \
	bluetooth.te \
	fRom.te \
	init.te \
	mediaserver.te \
	pvrsrvinit.te \
	rild.te \
	sdcardd.te \
	servicemanager.te \
	system_server.te \
	zygote.te

# TWRP
DEVICE_RESOLUTION := 720x1280
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_INCLUDE_JB_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/omap/omap_hsmmc.0/by-name/userdata"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nomblk_io_submit,errors=panic"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "/dev/block/platform/omap/omap_hsmmc.0/by-name/metadata"
SP1_NAME := "efs"
SP1_BACKUP_METHOD := files
SP1_MOUNTABLE := 1
TW_FLASH_FROM_STORAGE := true
TW_NO_USB_STORAGE := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/usb-otg"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "usb-otg"
TW_MAX_BRIGHTNESS := 255
TW_BRIGHTNESS_PATH := /sys/devices/omapdss/display0/backlight/s6e8aa0/brightness
