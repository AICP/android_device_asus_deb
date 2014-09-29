#
# Copyright 2013 The Android Open-Source Project
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

# rild
PRODUCT_PACKAGES := \
    rild \
    BasicSmsReceiver

PRODUCT_COPY_FILES := \
    device/asus/deb/fstab.deb:root/fstab.flo \
    device/asus/deb/init.deb.rc:root/init.flo.rc \
    device/asus/deb/fstab/fstab.deb.all-EXT4:system/extras/fstab/fstab.deb.all-EXT4 \
    device/asus/deb/fstab/fstab.deb.all-F2FS:system/extras/fstab/fstab.deb.all-F2FS \
    device/asus/deb/fstab/fstab.deb.data-F2FS:system/extras/fstab/fstab.deb.data-F2FS \
    device/asus/deb/tools/repack-and-flash.sh:system/extras/tools/repack-and-flash.sh \
    device/asus/deb/tools/format-system.sh:system/extras/tools/format-system.sh \
    device/asus/deb/tools/kernel/repackimg.sh:system/extras/tools/kernel/repackimg.sh \
    device/asus/deb/tools/kernel/unpackimg.sh:system/extras/tools/kernel/unpackimg.sh \
    device/asus/deb/tools/kernel/cleanup.sh:system/extras//tools/kernel/cleanup.sh \
    device/asus/deb/tools/kernel/authors.txt:system/extras/tools/kernel/authors.txt \
    device/asus/deb/tools/kernel/bin/aik:system/extras/tools/kernel/bin/aik \
    device/asus/deb/tools/kernel/bin/busybox:system/extras/tools/kernel/bin/busybox \
    device/asus/deb/tools/kernel/bin/file:system/extras/tools/kernel/bin/file \
    device/asus/deb/tools/kernel/bin/lz4:system/extras/tools/kernel/bin/lz4 \
    device/asus/deb/tools/kernel/bin/magic:system/extras/tools/kernel/bin/magic \
    device/asus/deb/tools/kernel/bin/mkbootfs:system/extras/tools/kernel/bin/mkbootfs \
    device/asus/deb/tools/kernel/bin/mkbootimg:system/extras/tools/kernel/bin/mkbootimg \
    device/asus/deb/tools/kernel/bin/unpackbootimg:system/extras/tools/kernel/bin/unpackbootimg \
    device/asus/deb/tools/kernel/bin/xz:system/extras/tools/kernel/bin/xz

PRODUCT_PACKAGES += \
    camera.deb

#NFC
PRODUCT_PACKAGES += \
    nfc_nci.deb

# F2FS
PRODUCT_PACKAGES += \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs

# Filesystem management tools
PRODUCT_PACKAGES += \
    setup_fs \
    e2fsck

# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
        persist.radio.apm_sim_not_pwdn=1

#Stop rild if non 3G SKU
PRODUCT_PACKAGES += \
        init.qcom.class_main.sh

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
        rild.libpath=/system/lib/libril-qc-qmi-1.so

# the actual meat of the device-specific product definition
$(call inherit-product, device/asus/flo/device-common.mk)

# inherit from the non-open-source side, if present
$(call inherit-product-if-exists, vendor/asus/deb/device-vendor.mk)

DEVICE_PACKAGE_OVERLAYS := device/asus/deb/overlay
