#!/bin/bash
set -
. ./config.sh

mkdir -p "$SYSROOT"

for PROJECT in $SYSTEM_HEADER_PROJECTS; do
    (cd $PROJECT && DESTIR="$SYSROOT' $MAKE install-headers)
done