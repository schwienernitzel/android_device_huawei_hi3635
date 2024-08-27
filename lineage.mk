#
# Copyright (C) 2024 The LineageOS Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/locales_full.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit from device.
$(call inherit-product, device/huawei/hi3635/device.mk)

# Characteristics
PRODUCT_CHARACTERISTICS := tablet
PRODUCT_GMS_CLIENTID_BASE := android-huawei

PRODUCT_NAME := lineage_hi3635
PRODUCT_DEVICE := hi3635
PRODUCT_BRAND := huawei
PRODUCT_MANUFACTURER := Huawei
PRODUCT_MODEL := hi3635

# Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="HUAWEI/LISZT/hwliszt:5.1.1/HUAWEIM2-A01L/C100B010:user/release-keys" \
    PRIVATE_BUILD_DESC="M2-A01L-user 5.1.1 HUAWEIM2-A01L C100B010 release-keys" \
    TARGET_DEVICE=hi3635
