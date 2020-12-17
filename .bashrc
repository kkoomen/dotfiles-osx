# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac

# PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# -- PATH: GOLANG
export GOPATH="$HOME/tech/go"
export GOROOT="$BREW_PREFIX/opt/go/libexec"
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"

# -- PATH: Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"

# -- PATH: Python
export PATH="$HOME/Library/Python/3.8/bin:$PATH"

# -- PATH: PHP
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"

# -- PATH: LLVM
export PATH="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include:$PATH"
export PATH="/usr/local/Cellar/llvm/9.0.0_1/bin:$PATH"
export LD_LIBRARY_PATH="/Library/Developer/CommandLineTools/usr/lib:$LD_LIBRARY_PATH"

# Base variable exporting.
export EDITOR=vim
export NODE_ENV=development
export BROWSER=firefox
export BREW_PREFIX=$(brew --prefix)
export TERM=xterm-256color

# virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=true

# FZF
export FZF_DEFAULT_OPTS='--exact'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it.
shopt -s histappend

# Use case-insensitive filename globbing.
shopt -s nocaseglob

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1).
export HISTSIZE=100000
export HISTFILESIZE=200000
export HISTTIMEFORMAT='%F %T '
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Include all the other bash files.
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bash_functions ]] && . ~/.bash_functions
[[ -f ~/.bash_private ]] && . ~/.bash_private
[[ -f ~/.fzf.bash ]] && . ~/.fzf.bash

# Completions.
[[ -d ~/.completions ]] && . ~/.completions/* > /dev/null 2>&1
[[ -f /usr/local/etc/bash_completion ]] && . /usr/local/etc/bash_completion > /dev/null 2>&1
[[ -d /usr/local/etc/bash_completion.d ]] && . /usr/local/etc/bash_completion.d/* > /dev/null 2>&1

# COMPOSER
export COMPOSER_MEMORY_LIMIT=-1

# Brew
export HOMEBREW_NO_AUTO_UPDATE=1

# Autocorrect typos in path names when using "cd".
shopt -s cdspell

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s /usr/local/opt/nvm/nvm.sh ] && . /usr/local/opt/nvm/nvm.sh
[ -s /usr/local/opt/nvm/etc/bash_completion.d/nvm ] && . /usr/local/opt/nvm/etc/bash_completion.d/nvm

# Set PS1 format.
PS1_NORMAL="$(tput setaf 7)┌─ \w\[$(tput setaf 3)\]\$(git-branch)\[$(tput setaf 7)\]\$(get-virtualenv)\n└──── ➜  "
PS1_ERROR="$(tput setaf 1)┌─ $(tput setaf 7)\w\[$(tput setaf 3)\]\$(git-branch)\[$(tput setaf 7)\]\$(get-virtualenv)\n\[$(tput setaf 1)\]└──── ➜  \[$(tput setaf 7)\]"
export PS1="\$([[ \$? == 0 ]] && echo \"$PS1_NORMAL\" || echo \"$PS1_ERROR\")"

# PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# -- PATH: GOLANG
export GOPATH="$HOME/tech/go"
export GOROOT="$BREW_PREFIX/opt/go/libexec"
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"

# -- PATH: Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"

# -- PATH: Python
export PATH="$HOME/Library/Python/3.7/bin:$PATH"

# -- PATH: PHP
export PATH="/usr/local/opt/php/bin:$PATH"
export PATH="/usr/local/opt/php/sbin:$PATH"

# -- PATH: LLVM
export PATH="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include:$PATH"
export PATH="/usr/local/Cellar/llvm/9.0.0_1/bin:$PATH"
export LD_LIBRARY_PATH="/Library/Developer/CommandLineTools/usr/lib:$LD_LIBRARY_PATH"

# Swift
export TOOLCHAINS=swift

# RUBY
# surpress warnings
# see: https://stackoverflow.com/a/59594760
export RUBYOPT='-W0'
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Damn Apple who made zsh the default shell on OS X ¯\_(///▽///)_/¯
export BASH_SILENCE_DEPRECATION_WARNING=1

# LANG
export LC_ALL="en_US.UTF-8"

# GPG
export GPG_TTY=$(tty)
