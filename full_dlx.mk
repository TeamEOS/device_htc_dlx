#
# Copyright (C) 2011 The CyanogenMod Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from m7 device
$(call inherit-product, device/htc/dlx/device.mk)

# Specify phone tech before including full_phone
$(call inherit-product, vendor/eos/config/cdma.mk)
$(call inherit-product, vendor/eos/config/common_full_phone.mk)

# Copy Bootanimation
PRODUCT_COPY_FILES += \
    vendor/eos/prebuilt/common/bootanimation/1080.zip:system/media/bootanimation.zip

# common msm8960 configs
$(call inherit-product, device/htc/msm8960-common/msm8960.mk)

# Inherit from dlx device
$(call inherit-product, device/htc/dlx/device.mk)

# Release name
PRODUCT_RELEASE_NAME := dlx

# overlays
PRODUCT_PACKAGE_OVERLAYS += device/htc/dlx/overlay

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := dlx
PRODUCT_NAME := full_dlx
PRODUCT_BRAND := Verizon
PRODUCT_MODEL := HTC6435LVW
PRODUCT_MANUFACTURER := HTC

# Set build fingerprint / ID / Product Name etc.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=dlx \
    BUILD_FINGERPRINT=htc/verizon_wwe/dlx:4.2.2/JDQ39/277065.4:user/release-keys \
    PRIVATE_BUILD_DESC="3.06.605.4 CL277065 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-verizon
