#!/usr/bin/env bash

pip_packages=(
  subliminal
  omnitagger
  youtube-dl
  vim-vint
  autoflake
  autopep8
  pep8
)

pip3 install "${pip_packages[@]}" --user
echo "Installed pip3 modules."
exit 0
