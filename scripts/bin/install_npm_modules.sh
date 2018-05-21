#!/usr/bin/env bash

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
echo "Installed NPM modules."
exit 0
