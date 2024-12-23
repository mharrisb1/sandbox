# Python 3.12 (Bullseye)

This sandbox uses [Debian 11.11.0 ISO](../../iso).

## Launch Debian Installer

> [!NOTE]
> CPU and RAM options here are chosen to be close to a GCP Cloud Run target VM. Configure accordingly.

```sh
qemu-img create -f qcow2 debian11-amd64.qcow2 16G
qemu-system-x86_64 \
  -accel tcg \
  -m 4G \
  -smp 6 \
  -cpu max \
  -drive file=debian11-amd64.qcow2,format=qcow2 \
  -cdrom ../../iso/debian-11.11.0-amd64-netinst.iso \
  -boot d \
  -nic user,hostfwd=tcp::2222-:22 \
  -serial mon:stdio \
  -nographic
```

When you see the ISOLINUX prompt or screen, quickly press `Tab`, `Esc`, or an `F`-key (depending on the ISO) to interrupt the normal boot and get a boot prompt.

Enter:

```sh
boot: install console=ttyS0
```

## Boot (Interactive)

After the installer completes shutdown the VM and start it again without the `-cdrom` and `-boot d` options

```sh
qemu-system-x86_64 \
  -accel tcg \
  -m 4G \
  -smp 6 \
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

## Boot (Daemon)

```sh
qemu-system-x86_64 \
  -accel tcg \
  -m 4G \
  -smp 6 \
  -cpu max \
  -drive file=debian11-amd64.qcow2,format=qcow2 \
  -nic user,hostfwd=tcp::2222-:22 \
  -display none \
  -daemonize
```

### Gracefully Shutdown

```sh
sudo poweroff
```

## Post-Install Script

Run the [post-install script](./scripts/post_install.sh)
