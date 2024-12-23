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

# python 3.12 build deps
sudo apt-get install -y \
  libffi-dev \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  libncursesw5-dev \
  xz-utils \
  tk-dev \
  libxml2-dev \
  libxmlsec1-dev \
  liblzma-dev

# install python 3.12 from source
wget https://www.python.org/ftp/python/3.12.8/Python-3.12.8.tgz
tar -xf Python-3.12.8.tgz
cd Python-3.12.8
./configure --enable-optimizations
make -j $(nproc)
sudo make altinstall
cd ..

# python3.12 -m ensurepip --upgrade
python3.12 -m ensurepip --upgrade
python3.12 -m pip install --upgrade pip
