#!/usr/bin/env bash
#
# This file is used to install the system dependencies.

bash ./../update.sh
bash ./install/install_brew.sh
bash ./install/install_npm_modules.sh
bash ./install/install_pip_modules.sh
