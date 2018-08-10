#!/usr/bin/env bash

sudo true

dotfiles=~/dotfiles

cd $dotfiles
git submodule deinit -f .
git submodule update --init --recursive

# ------------------------------------------------------------------------------
#
# YouCompleteMe
#
# ------------------------------------------------------------------------------

cp $dotfiles/.tern-project /tech/
cd $dotfiles/.vim/bundle/YouCompleteMe
sudo npm i -g typescript
python3 install.py --js-completer --tern-completer

# ------------------------------------------------------------------------------
#
# UltiSnips
#
# ------------------------------------------------------------------------------

for f in $dotfiles/.vim/snippets/*.snippets; do
  echo "removing $dotfiles/.vim/bundle/vim-snippets/snippets/$(basename \"$f\")"
  rm $dotfiles/.vim/bundle/vim-snippets/snippets/$(basename "$f") > /dev/null 2>&1
done
