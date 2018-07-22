#!/usr/bin/env bash

dotfiles=~/dotfiles

# ------------------------------------------------------------------------------
#
# YouCompleteMe
#
# ------------------------------------------------------------------------------

cp $dotfiles/.tern-project /tech/
cd $dotfiles/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --js-completer

# ------------------------------------------------------------------------------
#
# UltiSnips
#
# ------------------------------------------------------------------------------

for f in $dotfiles/.vim/snippets/*.snippets; do
  echo "removing '$dotfiles/.vim/bundle/vim-snippets/snippets/$(basename \"$f\")'"
  rm $dotfiles/.vim/bundle/vim-snippets/snippets/$(basename "$f") > /dev/null 2>&1
done

