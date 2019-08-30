#
# Copyright 2019 The Android Open-Source Project
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

#
# All components inherited here go to system image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/mainline_system.mk)

# Enable mainline checking
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := relaxed

# Exclude all files under system/product and system/system_ext
PRODUCT_ARTIFACT_PATH_REQUIREMENT_WHITELIST += \
    system/etc/seccomp_policy/mediacodec.policy \
    system/product/% \
    system/system_ext/%

#
# All components inherited here go to product image
#
PRODUCT_PACKAGES += Launcher3QuickStep Settings SystemUI

#
# Special settings for GSI releasing
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_release.mk)

# Don't build super.img.
PRODUCT_BUILD_SUPER_PARTITION := false


PRODUCT_NAME := mgsi_arm
PRODUCT_DEVICE := dummy_arm
PRODUCT_BRAND := Android
PRODUCT_MODEL := Minimal GSI on arm32
