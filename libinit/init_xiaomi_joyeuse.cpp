/*
 * Copyright (C) 2021 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_variant.h>
#include "vendor_init.h"

static const variant_info_t joyeuse_info = {
    .brand = "Redmi",
    .device = "joyeuse",
    .model = "Redmi Note 9 Pro",
};

static const std::vector<variant_info_t> variants = {
    joyeuse_info,
};

void vendor_load_properties() {
    search_variant(variants);
}
