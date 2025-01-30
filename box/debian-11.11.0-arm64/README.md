# Debian 11.11.0 (Bullseye) - ARM64

- [Debian 11.11.0 (Bullseye) - ARM64](#debian-11110-bullseye-arm64)
  - [Launch Debian Installer](#launch-debian-installer)
  - [Boot (Interactive)](#boot-interactive)
    - [Enable SSH](#enable-ssh)
    - [Install basic build deps](#install-basic-build-deps)
  - [Boot (Daemon)](#boot-daemon)
  - [Misc](#misc)
    - [Poweroff](#poweroff)

ISO Image: https://cdimage.debian.org/cdimage/archive/11.11.0/arm64/iso-cd/

## Launch Debian Installer

```sh
qemu-img create -f qcow2 debian11-arm64.qcow2 20G
qemu-system-aarch64 \
  -accel hvf \
  -machine virt \
  -cpu cortex-a72 \
  -smp 4 \
  -m 4096 \
  \
  -drive if=pflash,format=raw,readonly=on,file=/opt/homebrew/share/qemu/edk2-aarch64-code.fd \
  -drive if=pflash,format=raw,file=/opt/homebrew/share/qemu/edk2-arm-vars.fd \
  \
  -device virtio-scsi-pci \
  \
  -drive file=debian-11.11.0-arm64-netinst.iso,if=none,id=cd0,media=cdrom \
  -device scsi-cd,drive=cd0 \
  \
  -drive file=debian11-arm64.qcow2,if=none,id=hd0,format=qcow2 \
  -device scsi-hd,drive=hd0 \
  \
  -boot d \
  -device virtio-net-pci,netdev=net0 \
  -netdev user,id=net0,hostfwd=tcp::2222-:22 \
  -nographic
```

Manually boot from UEFI shell:

```sh
FS0:
dir
cd EFI\BOOT
dir
BOOTAA64.EFI
```

## Boot (Interactive)

```sh
qemu-system-aarch64 \
  -accel hvf \
  -machine virt \
  -cpu cortex-a72 \
  -smp 4 \
  -m 4096 \
  -drive if=pflash,format=raw,readonly=on,file=/opt/homebrew/share/qemu/edk2-aarch64-code.fd \
  -drive if=pflash,format=raw,file=/opt/homebrew/share/qemu/edk2-arm-vars.fd \
  -drive if=virtio,format=qcow2,file=debian11-arm64.qcow2 \
  -device virtio-net-pci,netdev=net0 \
  -netdev user,id=net0,hostfwd=tcp::2222-:22,dns=75.75.75.75 \
  -serial mon:stdio \
  -nographic
```

### Enable SSH

```sh
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh
```

### Install basic build deps

```sh
sudo apt-get install -y \
  build-essential \
  curl \
  wget \
  unzip \
  tar \
  git \
  gcc \
  g++ \
  make \
  pkg-config \
  ca-certificates \
  gnupg \
  lsb-release
```

## Boot (Daemon)

```sh
qemu-system-aarch64 \
  -accel hvf \
  -machine virt \
  -cpu cortex-a72 \
  -smp 4 \
  -m 4096 \
  -drive if=pflash,format=raw,readonly=on,file=/opt/homebrew/share/qemu/edk2-aarch64-code.fd \
  -drive if=pflash,format=raw,file=/opt/homebrew/share/qemu/edk2-arm-vars.fd \
  -drive if=virtio,format=qcow2,file=debian11-arm64.qcow2 \
  -device virtio-net-pci,netdev=net0 \
  -netdev user,id=net0,hostfwd=tcp::2222-:22,dns=75.75.75.75 \
  -display none \
  -daemonize
```

## Misc

### Poweroff

```sh
sudo poweroff
```
