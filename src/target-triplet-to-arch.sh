#!/bin/sh
if echo "$1" | grep -q "x86_64"; then
    echo "x86_64"
else
    echo "i386"
fi
