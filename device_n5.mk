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

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

BOARD_VENDOR := zte
TARGET_DEVICE := n5

DEVICE_PACKAGE_OVERLAYS += \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/overlay

# APNs
PRODUCT_COPY_FILES += \
	device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

# Boot ramdisk setup
PRODUCT_COPY_FILES += \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/ramdisk/at.rle:root/at.rle \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/ramdisk/factorylogo.rle:root/factorylogo.rle \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/ramdisk/fastboot.rle:root/fastboot.rle \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/ramdisk/fstab.$(TARGET_DEVICE):root/fstab.$(TARGET_DEVICE) \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/ramdisk/init.at.rc:root/init.at.rc \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/ramdisk/initlogo.rle:root/initlogo.rle \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/ramdisk/init.$(BOARD_VENDOR).usb.rc:root/init.$(BOARD_VENDOR).usb.rc \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/ramdisk/init.target.rc:root/init.target.rc \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/ramdisk/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/ramdisk/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/ramdisk/init.$(TARGET_DEVICE).rc:root/init.$(TARGET_DEVICE).rc \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/ramdisk/init.qcom.sh:root/init.qcom.sh \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/ramdisk/init.qcom.usb.sh:root/init.qcom.usb.sh \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/ramdisk/init.rf.rc:root/init.rf.rc \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/ramdisk/ueventd.$(TARGET_DEVICE).rc:root/ueventd.$(TARGET_DEVICE).rc \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/ramdisk/wlan.rle:root/wlan.rle

# Qualcomm scripts
PRODUCT_COPY_FILES += \
    device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/init.ath3k.bt.sh:system/etc/init.ath3k.bt.sh \
    device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/init.goldfish.sh:system/etc/init.goldfish.sh \
    device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh \
    device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/init.qcom.mdm_links.sh:system/etc/init.qcom.mdm_links.sh \
    device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh \
    device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/init.qcom.post_fs.sh:system/etc/init.qcom.post_fs.sh \
    device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
    device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/init.qcom.thermald_conf.sh:system/etc/init.qcom.thermald_conf.sh \
    device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh \
    device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/usf_post_boot.sh:system/etc/usf_post_boot.sh

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/nfcee_access_debug.xml
endif

PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

# WLAN
PRODUCT_COPY_FILES += \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/xtwifi.conf:system/etc/xtwifi.conf \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/WCNSS_cfg.dat:system/vendor/firmware/wlan/prima/WCNSS_cfg.dat

## PACKAGES ##

# Audio
PRODUCT_PACKAGES += \
	alsa.msm8960 \
	audio.primary.default \
	audio.primary.msm8960 \
	audio.a2dp.default \
	audio_policy.default \
	audio_policy.msm8960 \
	audio.r_submix.default \
	libalsa-intf \
	libaudioutils \
	libaudio-resampler \
	libaudioparameter

# Bluetooth
PRODUCT_PACKAGES += \
    hci_qcomm_init

# Camera
#PRODUCT_PACKAGES += \
	camera.msm8960 \
	libmmcamera_interface2 \
	libmmcamera_interface

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck

# Graphics
PRODUCT_PACKAGES += \
	libgenlock \
	liboverlay \
	copybit.msm8960 \
	gralloc.msm8960 \
	hwcomposer.msm8960

# GPS
PRODUCT_PACKAGES += \
	gps.msm8960 \
	libloc_adapter \
	libgps.utils \
	libloc_eng \
	libloc_api_v02

# GPS configuration
PRODUCT_COPY_FILES += \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/gps.conf:system/etc/gps.conf
	
# HDMI
PRODUCT_PACKAGES += \
	hdmid

# Lights
PRODUCT_PACKAGES += \
	lights.msm8960

# Live Wallpapers
PRODUCT_PACKAGES += \
	LiveWallpapers \
	LiveWallpapersPicker \
	VisualizationWallpapers \
	librs_jni

# Keystore
PRODUCT_PACKAGES += \
	keystore.default

# NFC
PRODUCT_PACKAGES += \
	libnfc \
	libnfc_ndef \
	libnfc_jni \
	Nfc \
	Tag \
	com.android.nfc_extras

# OMX
PRODUCT_PACKAGES += \
	libmm-omxcore \
	libc2dcolorconvert \
	libdivxdrmdecrypt \
	libOmxCore \
	libOmxVdec \
	libOmxVenc \
	libOmxAacEnc \
	libOmxAmrEnc \
	libOmxEvrcEnc \
	libOmxQcelp13Enc \
	libOmxMp3Dec \
	libOmxAc3HwDec \
	libstagefrighthw

# Power
PRODUCT_PACKAGES += \
	power.default

# Recovery
PRODUCT_PACKAGES += \
	init.recovery.qcom.rc \
	choice_fn \
	power_test \
	offmode_charging \
	detect_key

# QCOM rngd
PRODUCT_PACKAGES += \
	qrngd

# USB
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Torch
#PRODUCT_PACKAGES += \
	Torch

## Config Files ##

# GPS config
PRODUCT_COPY_FILES += \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/gps.conf:system/etc/gps.conf

# Input device config
PRODUCT_COPY_FILES += \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/idc/qwerty.idc:system/usr/idc/qwerty.idc

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/keylayout/atmel_mxt_ts.kl:/system/usr/keylayout/atmel_mxt_ts.kl \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/keylayout/AVRCP.kl:/system/usr/keylayout/AVRCP.kl \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/keylayout/Button_Jack.kl:/system/usr/keylayout/Button_Jack.kl \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/keylayout/cyttsp-i2c.kl:/system/usr/keylayout/cyttsp-i2c.kl \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/keylayout/Generic.kl:/system/usr/keylayout/Generic.kl \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/keylayout/gpio-keys.kl:/system/usr/keylayout/gpio-keys.kl \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/keylayout/keypad_8960.kl:/system/usr/keylayout/keypad_8960.kl \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/keylayout/keypad_8960_liquid.kl:/system/usr/keylayout/keypad_8960_liquid.kl \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/keylayout/philips_remote_ir.kl:/system/usr/keylayout/philips_remote_ir.kl \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/keylayout/qwerty.kl:/system/usr/keylayout/qwerty.kl \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/keylayout/ue_rf4ce_remote.kl:/system/usr/keylayout/rf4ce_remote.kl \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/keylayout/Vendor_045e_Product_028e.kl:/system/usr/keylayout/Vendor_045e_Product_028e.kl \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/keylayout/Vendor_046d_Product_c216.kl:/system/usr/keylayout/Vendor_046d_Product_c216.kl \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/keylayout/Vendor_046d_Product_c294.kl:/system/usr/keylayout/Vendor_046d_Product_c294.kl \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/keylayout/Vendor_046d_Product_c299.kl:/system/usr/keylayout/Vendor_046d_Product_c299.kl \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/keylayout/Vendor_046d_Product_c532.kl:/system/usr/keylayout/Vendor_046d_Product_c532.kl \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/keylayout/Vendor_054c_Product_0268.kl:/system/usr/keylayout/Vendor_054c_Product_0268.kl \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/keylayout/Vendor_05ac_Product_0239.kl:/system/usr/keylayout/Vendor_05ac_Product_0239.kl \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/keylayout/Vendor_22b8_Product_093d.kl:/system/usr/keylayout/Vendor_22b8_Product_093d.kl 

# Media config
PRODUCT_COPY_FILES += \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/audio_policy.conf:system/etc/audio_policy.conf \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/media_profiles.xml:system/etc/media_profiles.xml \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/media_codecs.xml:system/etc/media_codecs.xml

# QC thermald config
PRODUCT_COPY_FILES += \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/thermald-8064.conf:/system/etc/thermald-8064.conf \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/thermald-8960.conf:/system/etc/thermald-8960.conf \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/thermald-8930.conf:/system/etc/thermald-8930.conf

# Qualcomm
PRODUCT_COPY_FILES += \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/capability.xml:/system/etc/capability.xml \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/qosmgr_rules.xml:/system/etc/qosmgr_rules.xml \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/OperatorPolicy.xml:/system/etc/OperatorPolicy.xml \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/UserPolicy.xml:/system/etc/UserPolicy.xml \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/wfdconfig.xml:/system/etc/wfdconfig.xml

# Sound configs
PRODUCT_COPY_FILES += \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/dsp/snd_soc_msm/snd_soc_msm:/system/etc/snd_soc_msm/snd_soc_msm \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/dsp/snd_soc_msm/snd_soc_msm_2x:/system/etc/snd_soc_msm/snd_soc_msm_2x \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/dsp/snd_soc_msm/snd_soc_msm_2x_Fusion3:/system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3 \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/dsp/snd_soc_msm/snd_soc_msm_Sitar:/system/etc/snd_soc_msm/snd_soc_msm_Sitar

# Vold config
PRODUCT_COPY_FILES += \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/vold.fstab:system/etc/vold.fstab


# WPA supplicant config
PRODUCT_COPY_FILES += \
	device/$(BOARD_VENDOR)/$(TARGET_DEVICE)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

## Permissions ##

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardwardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Extra properties
PRODUCT_PROPERTY_OVERRIDES += \
	ro.setupwizard.enable_bypass=1 \
	ro.sf.lcd_density=480 \
	ro.hdmi.enable=true \
	ro.com.google.locationfeatures=1 \
	dalvik.vm.heapstartsize=8m \
	dalvik.vm.heapgrowthlimit=192m \
	dalvik.vm.heapsize=256m \
	dalvik.vm.heaputilization=0.25 \
	dalvik.vm.heapidealfree=8388608 \
	dalvik.vm.heapconcurrentstart=2097152 \
	keyguard.no_require_sim=true
    
PRODUCT_PROPERTY_OVERRIDES += \
	com.qc.hardware=true \
	debug.composition.type=gpu \
	debug.egl.hw=1 \
	debug.mdpcomp.maxlayer=2 \
	debug.mdpcomp.logs=0 \
	debug.sf.hw=1 \
	dev.pm.dyn_samplingrate=1 \
	lpa.decode=false \
	mpq.audio.decode=true \
	persist.audio.fluence.mode=endfire \
	persist.audio.vr.enable=false \
	persist.audio.handset.mic=digital \
	persist.audio.speaker.location=high \
	persist.thermal.monitor=true \
	ro.baseband.arch=msm \
	ro.com.google.clientidbase=android-$(BOARD_VENDOR) \
	ro.qualcomm.bt.hci_transport=smd \
	ro.opengles.version=131072 \
	ro.product.wireless=WCN3660 \
	ro.qc.sdk.audio.fluencetype=none \
	ro.qc.sdk.audio.ssr=false \
	ro.qualcomm.bt.hci_transport=smd \
	ro.use_data_netmgrd=true \
	wifi.interface=wlan0

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_CHARACTERISTICS := nosdcard

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_LOCALES += en_US xhdpi xxhdpi

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.adb.secure=0 \
	ro.secure=0 \
	ro.debuggable=1 \
	persist.sys.usb.config=mtp

# call the proprietary setup
$(call inherit-product-if-exists, vendor/$(BOARD_VENDOR)/$(TARGET_DEVICE)/$(TARGET_DEVICE)-vendor.mk)

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# This is the n5-specific audio package (will add zte package after I get some feedback)
#$(call inherit-product, device/zte/oem/AudioPackageOppo.mk)
$(call inherit-product, frameworks/base/data/sounds/AudioPackage10.mk)

# Discard inherited values and use our own instead.
PRODUCT_DEVICE := $(TARGET_DEVICE)
PRODUCT_NAME := cm_$(TARGET_DEVICE)
PRODUCT_BRAND := $(BOARD_VENDOR)
PRODUCT_MODEL := $(TARGET_DEVICE)
PRODUCT_MANUFACTURER := $(BOARD_VENDOR)
