#!/usr/bin/env bash

sudo -v

# Drupal / DrupalPractice
# ----------------------------------------
composer global require drupal/coder
sudo ln -s ~/.composer/vendor/bin/phpcs /usr/local/bin
sudo ln -s ~/.composer/vendor/bin/phpcbf /usr/local/bin
phpcs --config-set installed_paths ~/.composer/vendor/drupal/coder/coder_sniffer
