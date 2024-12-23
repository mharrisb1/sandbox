#!/bin/bash

git clone https://github.com/helix-editor/helix.git
cd helix
cargo install --path . --locked
cd ..
