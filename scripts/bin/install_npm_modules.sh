#!/usr/bin/env bash

npm_packages=(
  # Package managers
  yarn

  # For security check npm packages
  nsp

  # Linting
  # eslint
  # eslint-config-airbnb
  # eslint-plugin-html
  # eslint-plugin-import
  # eslint-plugin-jsx-a11y
  # eslint-plugin-react
  # stylelint

  # CSS prefixing
  autoprefixer-cli
)

sudo npm install -g "${npm_packages[@]}"
echo "Installed NPM modules."
exit 0
