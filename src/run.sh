#!/bin/bash

echo "Starting QEMU..."

qemu-system-i386 \
    -display sdl \
    -drive format=raw,file=build/boot.img,index=0,media=disk \
    -boot c