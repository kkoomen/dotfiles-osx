# ~/.bashrc: executed by bash(1) for non-login shells.
# See /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples.

# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac

# Base variable exporting.
export EDITOR=vim
export NODE_ENV="development"
export BROWSER="firefox"

# virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=true

# FZF
export FZF_DEFAULT_OPTS="--exact"
export FZF_DEFAULT_COMMAND='ag --ignore *.pyc -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it.
shopt -s histappend

# Use case-insensitive filename globbing.
shopt -s nocaseglob

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1).
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Include all the other bash files.
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bash_functions ]] && . ~/.bash_functions
[[ -f ~/.bash_private ]] && . ~/.bash_private
[[ -f ~/.fzf.bash ]] && . ~/.fzf.bash

# Completions
[[ -d ~/.completions ]] && . ~/.completions/* > /dev/null 2>&1
[[ -f /usr/local/etc/bash_completion ]] && . /usr/local/etc/bash_completion > /dev/null 2>&1

# Autocorrect typos in path names when using "cd".
shopt -s cdspell

# Set PS1 format.
PS1_NORMAL="\[$(tput setaf 4)\]┌─ $(tput setaf 4)\w\[$(tput setaf 1)\]\[$(tput setaf 3)\]\$(git-branch)\[$(tput setaf 7)\]\$(get-virtualenv)\n\[$(tput setaf 4)\]└──── ➜  \[$(tput setaf 7)\]"
PS1_ERROR="\[$(tput setaf 1)\]┌─ $(tput setaf 4)\w\[$(tput setaf 1)\]\[$(tput setaf 3)\]\$(git-branch)\[$(tput setaf 7)\]\$(get-virtualenv)\n\[$(tput setaf 1)\]└──── ➜  \[$(tput setaf 7)\]"
export PS1="\$(if [[ \$? == 0 ]]; then echo \"$PS1_NORMAL\"; else echo \"$PS1_ERROR\"; fi)"

export PATH="$PATH:$HOME/Library/Python/3.6/bin"
