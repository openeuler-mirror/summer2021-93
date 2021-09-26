#!/bin/bash

STRATOVIRT_LOG_LEVEL=debug ../target/x86_64-unknown-linux-gnu/release/stratovirt \
    -machine microvm \
    -kernel vmlinux.bin \
    -append "console=ttyS0 root=/dev/vda reboot=k panic=1" \
    -drive file=rootfs.img,id=rootfs,readonly=off \
    -device virtio-blk-device,drive=rootfs \
    -qmp unix:stratovirt.sock,server,nowait \
    -D stratovirt.log \
    -serial stdio
