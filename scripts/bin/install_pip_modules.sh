#!/usr/bin/env bash

pip_packages=(
  omnitagger
  youtube-dl
)

pip3 install "${pip_packages[@]}"
echo "Installed PIP modules."
exit 0
