#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_USE_DYNAMIC_PARTITIONS := true

PRODUCT_SHIPPING_API_LEVEL := 29

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Fscrypt policy
TW_USE_FSCRYPT_POLICY := 1

# Decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.dm_default_key.options_format.version=2 \
    ro.crypto.volume.filenames_mode=aes-256-cts \
    ro.crypto.volume.metadata.method=dm-default-key \
    ro.crypto.volume.options=::v2

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    vendor/qcom/opensource/commonsys-intf/display

# Fastbootd stuff
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery

# Exclude Apex
TW_EXCLUDE_APEX := true

# OEM otacert
PRODUCT_EXTRA_RECOVERY_KEYS += \
    vendor/recovery/security/miui

# Libraries
TARGET_RECOVERY_DEVICE_MODULES += libion vendor.display.config@1.0 vendor.display.config@2.0 libdisplayconfig.qti
RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/libdisplayconfig.qti.so
