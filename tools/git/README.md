# Configure git on a new machine

This is compatible with Debian and other similar Linux distros.

## Install git

```sh
sudo apt update
sudo apt install git -y
```

## Global config

```sh
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --list
```

## Configure SSH

```sh
ssh-keygen -t ed25519 -C "your.email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
```

## Test SSH

```sh
ssh -T git@github.com
```

## Optional configs

```sh
git config --global init.defaultBranch main
```
