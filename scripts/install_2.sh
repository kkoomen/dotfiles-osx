#!/usr/bin/env bash
#
# This file is used to install the system dependencies.

bash ./../update.sh
bash ./bin/install_brew.sh
bash ./bin/install_npm_modules.sh
bash ./bin/install_pip_modules.sh
