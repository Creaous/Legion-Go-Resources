#!/bin/bash

# Function for downloading and applying patches
download_and_apply_patch() {
    patch_url=$1
    patch_filename=$(basename "${patch_url}")
    target_file="/usr/lib/hwsupport/${patch_filename%.patch}"

    echo "Downloading patch: ${patch_filename}"
    curl -sSL "${patch_url}" -o "${patch_filename}"

    if [ $? -eq 0 ]; then
        echo "Applying patch to ${target_file}"
        patch -b -u ${target_file} -i ${patch_filename}
        rm "${patch_filename}"
    else
        echo "Failed to download patch: ${patch_filename}"
    fi
}

# Ensure target directory exists
if [ ! -d "/usr/lib/hwsupport" ]; then
    echo "Creating target directory: /usr/lib/hwsupport"
    sudo mkdir -p "/usr/lib/hwsupport"
fi

# Download and apply patches
download_and_apply_patch "https://gitlab.com/popsulfr/steamos-btrfs/-/raw/main/files/usr/lib/hwsupport/format-sdcard.sh.patch"
download_and_apply_patch "https://gitlab.com/popsulfr/steamos-btrfs/-/raw/main/files/usr/lib/hwsupport/sdcard-mount.sh.patch"
