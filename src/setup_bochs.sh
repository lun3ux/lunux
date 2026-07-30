#!/bin/bash

set -e

echo "Setting up Bochs..."

# Paths
ROOT_DIR="$(pwd)"
IMAGE="$ROOT_DIR/build/boot.img"
CONFIG="$ROOT_DIR/bochsrc.txt"

# Check image exists
if [ ! -f "$IMAGE" ]; then
    echo "ERROR: $IMAGE does not exist"
    echo "Run your build script first."
    exit 1
fi

# Make sure image is a reasonable hard disk size
SIZE=$(stat -c%s "$IMAGE")

if [ "$SIZE" -lt 1048576 ]; then
    echo "Expanding disk image to 10MB..."
    truncate -s 10M "$IMAGE"
fi


# Find BIOS
BIOS=$(find /usr/share -name "BIOS-bochs-latest" 2>/dev/null | head -1)

if [ -z "$BIOS" ]; then
    echo "ERROR: Could not find Bochs BIOS"
    exit 1
fi


# Find VGA BIOS
VGABIOS=$(find /usr/share -iname "VGABIOS*" 2>/dev/null | head -1)

if [ -z "$VGABIOS" ]; then
    echo "ERROR: Could not find VGA BIOS"
    exit 1
fi


echo "BIOS:     $BIOS"
echo "VGA BIOS: $VGABIOS"


# Generate config
cat > "$CONFIG" <<EOF
megs: 32

romimage: file=$BIOS
vgaromimage: file=$VGABIOS

boot: disk

ata0-master: type=disk, path="$IMAGE", mode=flat

cpu: count=1, ips=1000000

log: bochs.log

mouse: enabled=0

keyboard: type=mf, keymap=/usr/share/bochs/keymaps/x11-pc-us.map

display_library: x

panic: action=ask

magic_break: enabled=1
EOF


echo ""
echo "Created:"
echo "  $CONFIG"
echo ""
echo "Launching Bochs debugger..."

bochs -f "$CONFIG"