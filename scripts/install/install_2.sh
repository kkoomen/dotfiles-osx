#!/usr/bin/env bash
#
# This file is used to install the system dependencies.

bash ./../../update.sh
echo "Finished symlinking of dotfiles."

bash ./../install_brew.sh
echo "Installed homebrew packages."

################################################################################
# NPM                                                                          #
################################################################################

echo "Installing NPM modules."

npm_packages=(
    # Development
    gulp
    nodemon
    http-server

    # For security check npm packages
    nsp

    # Linting
    eslint
    eslint-config-airbnb
    eslint-plugin-html
    eslint-plugin-import
    eslint-plugin-jsx-a11y
    eslint-plugin-react

    # CSS prefixing
    autoprefixer-cli
)

npm install -g "${npm_packages[@]}"

################################################################################
# PIP                                                                          #
################################################################################

echo "Installing PIP modules."

pip_packages=(
  mutagen
  omnitagger
  youtube-dl
)

pip3 install -g "${pip_packages[@]}"
