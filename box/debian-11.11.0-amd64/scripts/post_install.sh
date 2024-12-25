#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

# basic build deps
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

# development environment
sudo apt-get install -y \
  vim \
  tmux

# profiling and analysis
sudo apt-get install -y \
  linux-perf \
  sysstat \
  strace
