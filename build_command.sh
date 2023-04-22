#!/bin/bash -ex
#
QMK_FIRMWARE_BASEDIR="/home/ubuntu/qmk_firmware"
MOONLANDER_KEYMAPS_DIR="${QMK_FIRMWARE_BASEDIR}/keyboards/moonlander/keymaps"
NEW_KEYMAP_DIR="/keymap"

ln -s "${NEW_KEYMAP_DIR}" "${MOONLANDER_KEYMAPS_DIR}/custom"

cd ${QMK_FIRMWARE_BASEDIR}

make moonlander:custom

ls -laF moonlander_custom.bin

mkdir -p "${NEW_KEYMAP_DIR}/builded"

cp -f moonlander_custom.bin "${NEW_KEYMAP_DIR}/builded/"
