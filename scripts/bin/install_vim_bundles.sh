#!/usr/bin/env bash

sudo true || exit 1

DOTFILES=~/dotfiles
VIM_VENDOR_PACK_DIR=$DOTFILES/.vim/pack/vendor/start
ACTION=$1

cd $DOTFILES
git submodule deinit -f --all
if [[ $ACTION == "update" ]]; then
	git submodule update --init --remote --merge
	git submodule foreach "git checkout master && git pull origin master && git submodule update --init --recursive"
else
	git submodule update --init --recursive
fi

# -----------------------------------------------------------------------------
#
# YouCompleteMe
#
# ----------------------------------------------------------------------------

cp $DOTFILES/.tern-project /tech/
cd $VIM_VENDOR_PACK_DIR/YouCompleteMe
sudo npm i -g typescript
python3 install.py --ts-completer

# -----------------------------------------------------------------------------
#
# UltiSnips
#
# -----------------------------------------------------------------------------

for f in $DOTFILES/.vim/snippets/*.snippets; do
	echo "Removing $VIM_VENDOR_PACK_DIR/vim-snippets/UltiSnips/$(basename \"$f\")"
	rm $VIM_VENDOR_PACK_DIR/vim-snippets/UltiSnips/$(basename "$f") > /dev/null 2>&1

	echo "Removing $VIM_VENDOR_PACK_DIR/vim-snippets/snippets/$(basename \"$f\")"
	rm $VIM_VENDOR_PACK_DIR/vim-snippets/snippets/$(basename "$f") > /dev/null 2>&1
done

# -----------------------------------------------------------------------------
#
# FZF + ripgrep
#
# -----------------------------------------------------------------------------
brew install fzf diff-so-fancy ripgrep
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global color.ui true

git config --global color.diff-highlight.oldNormal		"red"
git config --global color.diff-highlight.oldHighlight "red 52"
git config --global color.diff-highlight.newNormal		"green"
git config --global color.diff-highlight.newHighlight "green 22"

git config --global color.diff.meta				"yellow"
git config --global color.diff.frag				"magenta"
git config --global color.diff.commit			"yellow"
git config --global color.diff.old				"red"
git config --global color.diff.new				"green"
git config --global color.diff.whitespace "red reverse"

# -----------------------------------------------------------------------------
#
# PHPActor
#
# -----------------------------------------------------------------------------
cd $VIM_VENDOR_PACK_DIR/phpactor
composer install
