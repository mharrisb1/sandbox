# Setup Guide for Various Sandbox Environments

<!--toc:start-->

- [Setup Guide for Various Sandbox Environments](#setup-guide-for-various-sandbox-environments)
  - [Virtual Machine](#virtual-machine)
    - [Installation (MacOS)](#installation-macos)
  - [Sandboxes](#sandboxes)
  - [Shared Tools](#shared-tools)
  <!--toc:end-->

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

1. [Python 3.12 (Bullseye)](./box/py3.12.8)

## Shared Tools

Setup guides for various tools that are shared across many environments

- [gcloud](./tools/gcloud)
- [gh](./tools/gh)
- [git](./tools/git)
- [helix](./tools/helix)
- [lazygit](./tools/lazygit)
- [poetry](./tools/poetry)
- [rust](./tools/rust)
- [xplr](./tools/xplr)
- [zsh](./tools/zsh)
- [zellij](./tools/zellij)
