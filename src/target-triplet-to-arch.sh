#!/bin/sh
if echo "$1" | grep -q "x86_64"; then
    echo "x86_64-elf"
else
    echo "i686-elf"
fi