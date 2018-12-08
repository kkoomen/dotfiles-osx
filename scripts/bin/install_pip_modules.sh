#!/usr/bin/env bash

pip_packages=(
  omnitagger
  youtube-dl
)

pip3 install "${pip_packages[@]}"
echo "Installed pip3 modules."
exit 0
