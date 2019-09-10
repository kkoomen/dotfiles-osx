# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac

# Base variable exporting.
export EDITOR=vim
export NODE_ENV=development
export BROWSER=firefox
export BREW_PREFIX=$(brew --prefix)

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
[[ -s /usr/local/opt/nvm/nvm.sh ]] && . $BREW_PREFIX/opt/nvm/nvm.sh

# Completions
[[ -d ~/.completions ]] && . ~/.completions/* > /dev/null 2>&1
[[ -f /usr/local/etc/bash_completion ]] && . /usr/local/etc/bash_completion > /dev/null 2>&1
[[ -d /usr/local/etc/bash_completion.d ]] && . /usr/local/etc/bash_completion.d/* > /dev/null 2>&1

# Autocorrect typos in path names when using "cd".
shopt -s cdspell

# Enable terminal password prompt for GPG.
export GPG_TTY=$(tty)

# Set PS1 format.
PS1_NORMAL="$(tput setaf 15)┌─ \w\[$(tput setaf 3)\]\$(git-branch)\[$(tput setaf 15)\]\$(get-virtualenv)\n└──── ➜  "
PS1_ERROR="$(tput setaf 1)┌─ $(tput setaf 15)\w\[$(tput setaf 3)\]\$(git-branch)\[$(tput setaf 15)\]\$(get-virtualenv)\n\[$(tput setaf 1)\]└──── ➜  \[$(tput setaf 15)\]"
export PS1="\$([[ \$? == 0 ]] && echo \"$PS1_NORMAL\" || echo \"$PS1_ERROR\")"

# GOLANG
export GOPATH="/tech/go"
export GOROOT="$BREW_PREFIX/opt/go/libexec"

# NVM
export NVM_DIR="$HOME/.nvm"

# PATH
export PATH="/usr/local/opt/ruby/bin:/usr/local/sbin:$PATH:$GOPATH/bin:$GOROOT/bin"

# LANG
export LANG="C"
export LC_COLLATE="C"
export LC_CTYPE="C"
export LC_MESSAGES="C"
export LC_MONETARY="C"
export LC_NUMERIC="C"
export LC_TIME="C"
export LC_ALL="C"
