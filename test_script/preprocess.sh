#!/bin/bash
# Author: phyhac
# Email: phyhac@yeah.net
# Date: 2021/09/26

# Note: Run this script in the current directory `test_script`.

# Add toolchains
cd ..
rustup target add x86_64-unknown-linux-gnu
rustup target add x86_64-unknown-linux-musl


# Build by toolchains
cargo build --release --target x86_64-unknown-linux-gnu
cargo build --release --target x86_64-unknown-linux-musl


# Download kernel image and rootfs image in directory `test_script`
cd test_script

wget https://repo.openeuler.org/openEuler-21.03/stratovirt_img/x86_64/vmlinux.bin -O vmlinux.bin

wget https://repo.openeuler.org/openEuler-21.03/stratovirt_img/x86_64/openEuler-21.03-stratovirt-x86_64.img.xz -O rootfs.img.xz
unxz rootfs.img.xz


echo "Preprocession done"

