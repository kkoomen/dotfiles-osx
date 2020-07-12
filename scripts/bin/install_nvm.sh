#!/usr/bin/env bash

# For more info about the 'set' command, see
# https://www.gnu.org/software/bash/manual/bash.html#The-Set-Builtin
set -e
set -u

brew install nvm

export NVM_DIR="$HOME/.nvm"
[ -s /usr/local/opt/nvm/nvm.sh ] && . /usr/local/opt/nvm/nvm.sh
[ -s /usr/local/opt/nvm/etc/bash_completion.d/nvm ] && . /usr/local/opt/nvm/etc/bash_completion.d/nvm

nvm install node
nvm use node
nvm alias default node
