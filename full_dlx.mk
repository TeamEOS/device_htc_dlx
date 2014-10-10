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

# Inherit from EOS vendor
$(call inherit-product, vendor/eos/config/common_full_phone.mk)

# The gps config appropriate for this device
PRODUCT_COPY_FILES += device/htc/dlx/gps/gps.conf:system/etc/gps.conf

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.dlx \
    init.qcom.firmware_links.sh \
    init.dlx.rc \
    init.dlx.usb.rc \
    ueventd.dlx.rc

# Post boot service
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init.post_boot.sh:system/etc/init.post_boot.sh

# Recovery
PRODUCT_PACKAGES += \
    lpm.rc \
    choice_fn \
    detect_key \
    power_test \
    chargeled \
    offmode_charging \
    offmode_charging_res_images \
    offmode_charging_warn_res_images \
    init.recovery.dlx.rc

PRODUCT_PACKAGES += \
    libnetcmdiface

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/htc/dlx/configs/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/htc/dlx/configs/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

# QC thernald config
PRODUCT_COPY_FILES += device/htc/dlx/configs/thermald.conf:/system/etc/thermald.conf

# Media configs
PRODUCT_COPY_FILES += device/htc/dlx/configs/AudioBTID.csv:system/etc/AudioBTID.csv
PRODUCT_COPY_FILES += device/htc/dlx/configs/AudioBTIDnew.csv:system/etc/AudioBTIDnew.csv

# wifi config
PRODUCT_COPY_FILES += \
    device/htc/dlx/configs/calibration:/system/etc/calibration \
    device/htc/dlx/configs/calibration.gpio4:/system/etc/calibration.gpio4

# Audio config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Sound configs
PRODUCT_COPY_FILES += \
    device/htc/dlx/dsp/soundimage/srs_bypass.cfg:system/etc/soundimage/srs_bypass.cfg \
    device/htc/dlx/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/dlx/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/dlx/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/dlx/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg \
    device/htc/dlx/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/dlx/dsp/soundimage/srs_global.cfg:system/etc/soundimage/srs_global.cfg

PRODUCT_COPY_FILES += \
    device/htc/dlx/dsp/snd_soc_msm/snd_soc_msm_2x_Fusion3:/system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3 

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
    BUILD_FINGERPRINT=htc/verizon_wwe/dlx:4.4.2/KOT49H/322791.1:user/release-keys \
    PRIVATE_BUILD_DESC="4.09.605.1 CL322791 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-verizon
