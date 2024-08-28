#
# Copyright (C) 2024 The LineageOS Project
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

DEVICE_PATH := device/huawei/hi3635

# Inherit vendor blobs
$(call inherit-product, vendor/huawei/hi3635/vendor.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# ADB
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/adb/busybox:root/sbin/sh

# Audio
PRODUCT_PACKAGES += \
    audio.primary.default \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudioutils \
    libaudioroute \
    libtinyalsa \
    tinyplay \
    tinycap \
    tinymix \
    tinypcminfo

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(DEVICE_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(DEVICE_PATH)/configs/audio/topazhp.cfg:system/etc/topazhp.cfg

# Bluetooth
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Graphics
PRODUCT_PACKAGES += \
    libGLES_android

# Media
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(DEVICE_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# Properties
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.zygote=zygote64_32 \
    ro.adb.secure=0 \
    ro.secure=0

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.mode=OPTIONAL \
    ro.setupwizard.enable_bypass=1 \
    ro.config.sync=yes

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.hi3635 \
    init.hi3635.chip.usb.rc \
    init.hi3635.connectivity.rc \
    init.hi3635.gps.rc \
    init.hi3635.power.rc \
    init.hi3635.rc \
    init.hi3635.usb.rc \
    ueventd.hi3635.rc

PRODUCT_PACKAGES += \
    oeminfo_nvm_server \
    hw_healthd \
    teecd

# Screen
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1200

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    hostapd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(DEVICE_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
