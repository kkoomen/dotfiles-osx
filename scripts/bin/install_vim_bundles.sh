#!/usr/bin/env bash

# ------------------------------------------------------------------------------
#
# YouCompleteMe
#
# ------------------------------------------------------------------------------

dotfiles=~/dotfiles

cp $dotfiles/.tern-project /tech/
cd $dotfiles/.vim/bundle/YouCompleteMe
./install.py --js-completer
