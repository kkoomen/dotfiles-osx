#!/usr/bin/env bash

# -----------------------------------------------------------------------------
#
# FZF + ripgrep
#
# -----------------------------------------------------------------------------
brew install fzf diff-so-fancy ripgrep
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red"
git config --global color.diff-highlight.oldHighlight "red 52"
git config --global color.diff-highlight.newNormal    "green"
git config --global color.diff-highlight.newHighlight "green 22"

git config --global color.diff.meta       "yellow"
git config --global color.diff.frag       "magenta"
git config --global color.diff.commit     "yellow"
git config --global color.diff.old        "red"
git config --global color.diff.new        "green"
git config --global color.diff.whitespace "red reverse"
