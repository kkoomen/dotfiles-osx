#!/usr/bin/env bash

pip_packages=(
  mutagen
  omnitagger
  youtube-dl
)

pip3 install -g "${pip_packages[@]}"
echo "Installed PIP modules."
exit 0
