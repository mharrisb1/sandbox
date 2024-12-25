# Debian 11.11.0 (Bullseye) - AMD64

- [Debian 11.11.0 (Bullseye) - AMD64](#debian-11110-bullseye-amd64)
  - [Launch Debian Installer](#launch-debian-installer)
  - [Boot (Interactive)](#boot-interactive)
    - [Enable SSH](#enable-ssh)
    - [Post-install Script(s)](#post-install-scripts)
  - [Boot (Daemon)](#boot-daemon)
  - [Misc](#misc)
    - [Poweroff](#poweroff)

ISO Image: https://cdimage.debian.org/cdimage/archive/11.11.0/amd64/iso-cd

## Launch Debian Installer

```sh
qemu-img create -f qcow2 debian11-amd64.qcow2 16G
qemu-system-x86_64 \
  -accel tcg \
  -m 8G \
  -smp 2 \
  -cpu max \
  -drive file=debian11-amd64.qcow2,format=qcow2 \
  -cdrom debian-11.11.0-amd64-netinst.iso \
  -boot d \
  -nic user,hostfwd=tcp::2222-:22 \
  -serial mon:stdio \
  -nographic
```

When you see the ISOLINUX prompt or screen, quickly press `Esc` to interrupt the normal boot and get a boot prompt.

Enter:

```sh
boot: install console=ttyS0
```

## Boot (Interactive)

After the installer completes shutdown the VM and start it again without the `-cdrom` and `-boot d` options

> [!NOTE]
> High-mem and high-cpu are chosen here to speed up any of the installs

```sh
qemu-system-x86_64 \
  -accel tcg \
  -m 16G \
  -smp 8 \
  -cpu max \
  -drive file=debian11-amd64.qcow2,format=qcow2 \
  -nic user,hostfwd=tcp::2222-:22 \
  -serial mon:stdio \
  -nographic
```

### Enable SSH

```sh
sudo apt-get update
sudo apt-get install openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh
```

### Post-install Script(s)

Run the [post-install script](./scripts/post_install.sh) and install any other [tools](../tools) needed.

## Boot (Daemon)

```sh
qemu-system-x86_64 \
  -accel tcg \
  -m 8G \
  -smp 4 \
  -cpu max \
  -drive file=debian11-amd64.qcow2,format=qcow2 \
  -nic user,hostfwd=tcp::2222-:22 \
  -display none \
  -daemonize
```

## Misc

### Poweroff

```sh
sudo poweroff
```
