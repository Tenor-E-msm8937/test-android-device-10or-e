#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
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

# inherit from msm8937-common
-include device/xiaomi/msm8937-common/BoardConfigCommon.mk

DEVICE_PATH := device/10or/e

# kernel
#TARGET_KERNEL_CONFIG 		:= e_defconfig
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/rootdir/kernel
BOARD_KERNEL_BASE		:= 0x80000000
BOARD_KERNEL_CMDLINE 		:= androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.bootdevice=7824900.sdhci earlycon=msm_hsl_uart,0x78B0000
BOARD_KERNEL_CMDLINE 		+= firmware_class.path=/vendor/firmware_mnt/image
#BOARD_KERNEL_IMAGE_NAME 	:= Image.gz-dtb
BOARD_KERNEL_PAGESIZE 		:=  2048
BOARD_MKBOOTIMG_ARGS 		:= --ramdisk_offset 0x01000000 --second_offset 0x00f00000 --tags_offset 0x00000100
#TARGET_KERNEL_SOURCE 		:= kernel/xiaomi/msm8937
TARGET_EXFAT_DRIVER		:= sdfat

# Camera
USE_DEVICE_SPECIFIC_CAMERA   := true
BOARD_QTI_CAMERA_32BIT_ONLY  := true
TARGET_USES_MEDIA_EXTENSIONS := true
TARGET_USES_QTI_CAMERA_DEVICE := true
TARGET_TS_MAKEUP             := true

# Clang
INTERNAL_LOCAL_CLANG_EXCEPTION_PROJECTS += $(DEVICE_PATH)

# Init
TARGET_INIT_VENDOR_LIB         := libinit_e
TARGET_PLATFORM_DEVICE_BASE    := /devices/soc/
TARGET_RECOVERY_DEVICE_MODULES := libinit_e

# Inherit the proprietary files
-include vendor/xiaomi/land/BoardConfigVendor.mk
