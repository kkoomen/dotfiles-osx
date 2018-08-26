#!/usr/bin/env bash

sudo true

# ------------------------------------------------------------------------------
#
# Drupal & DrupalPractive
#
# ------------------------------------------------------------------------------
composer global require drupal/coder
sudo ln -s ~/.composer/vendor/bin/phpcs /usr/local/bin
sudo ln -s ~/.composer/vendor/bin/phpcbf /usr/local/bin
phpcs --config-set installed_paths ~/.composer/vendor/drupal/coder/coder_sniffer

# ------------------------------------------------------------------------------
#
# Python
#
# ------------------------------------------------------------------------------
pip3 install pycodestyle
