#!/usr/bin/env bash
#
# This file is used to install the system dependencies.

bash ./../update.sh
bash ./bin/install_brew_packages.sh
bash ./bin/install_linters.sh
bash ./bin/install_npm_modules.sh
bash ./bin/install_pip_modules.sh
bash ./bin/install_vim_bundles.sh
