# Setup Guide for Various Sandbox Environments

- [Setup Guide for Various Sandbox Environments](#setup-guide-for-various-sandbox-environments)
  - [Virtual Machine](#virtual-machine)
    - [Installation (MacOS)](#installation-macos)
  - [Sandboxes](#sandboxes)
  - [Shared Tools](#shared-tools)

## Virtual Machine

All sandboxes use [QEMU](https://www.qemu.org).

### Installation (MacOS)

```sh
brew install qemu
qemu-system-x86_64 --version
qemu-img create -f qcow2 test.img 1G
rm test.img
```

## Sandboxes

Various environments used for research and performance testing

1. [Debian 11.11.0 (Bullseye) - AMD64](./box/debian-11.11.0-amd64)
2. [Debian 11.11.0 (Bullseye) - ARM64](./box/debian-11.11.0-arm64)

## Shared Tools

Setup guides for various tools that are shared across many environments

- [bat](/tools/bat)
- [docker](/tools/docker)
- [gcloud](./tools/gcloud)
- [gh](./tools/gh)
- [git](./tools/git)
- [helix](./tools/helix)
- [lazygit](./tools/lazygit)
- [poetry](./tools/poetry)
- [python](./tools/python)
- [rust](./tools/rust)
- [uv](./tools/uv)
- [xplr](./tools/xplr)
- [zellij](./tools/zellij)
- [zsh](./tools/zsh)
