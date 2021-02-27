shopt -s expand_aliases

function editorconfig-init {
    if [[ -f .editorconfig ]]; then
        echo "[ERROR] .editorconfig config already exists in $(pwd)"
    else
        echo "# editorconfig.org" > .editorconfig
        echo "root = true" >> .editorconfig
        echo "" >> .editorconfig
        echo "[*]" >> .editorconfig
        echo "indent_style = space" >> .editorconfig
        echo "indent_size = 2" >> .editorconfig
        echo "end_of_line = LF" >> .editorconfig
        echo "charset = utf-8" >> .editorconfig
        echo "trim_trailing_whitespace = true" >> .editorconfig
        echo "insert_final_newline = true" >> .editorconfig
        echo "" >> .editorconfig
        echo "[*.md]" >> .editorconfig
        echo "trim_trailing_whitespace = false" >> .editorconfig
    fi
}

function jb {
  curl -s -F file=@- -F expire="${1:-}" https://jinb.in
}

function chsh() {
  local lang=$1
  shift
  local keywords_raw=$1
  shift;
  keywords=$(printf %s "$keywords_raw" "${@/#/+}")
  curl cht.sh/$lang/$keywords
}

function git-branch {
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch="detached*"
    fi
    git_branch=" ($branch)"
  else
    git_branch=""
  fi

  # Check if the current git directory has uncommitted changes.
  if [[ -n $(git status --porcelain --ignore-submodules 2> /dev/null) ]]; then
    printf "$git_branch $(tput setaf 1)[+]$(tput setaf 7)"
  else
    printf "$git_branch"
  fi

}

function get-virtualenv {
  local venv
  if [[ ! -z "$VIRTUAL_ENV" ]]; then
    venv=" ➜  $(tput setaf 4)$(basename "$VIRTUAL_ENV")$(tput setaf 7)"
  else
    venv=""
  fi
  printf "$venv"
}

function prefix-css {
  if [[ -x /usr/local/bin/autoprefixer-cli ]]; then
    echo "Running autoprefixer on $1."
    echo "Saving file as ${2:-$1}."

    /usr/local/bin/autoprefixer-cli --no-remove --no-cascade -o "${2:-$1}" "$1" -b "> 1%, last 4 versions, IE > 10, iOS > 6, safari > 6, Firefox ESR"
  else
    echo "No executable: autoprefixer-cli. Install it via [sudo] npm install -g autoprefixer-cli"
  fi
}

function cut-mp3 {
  ffmpeg -i "$1" -ss "$3" -to "$4" -c copy "${2:-$1}"
}

function weather {
  langcode=$(curl -s ipinfo.io/country)
  curl wttr.in/~$langcode
}

function vim-format {
  # Example:
  # find . -name "*.js" -not -path "*/node_modules/*" -exec sh -c "echo {}; vim '+normal! gg=G' '+wq' {} > /dev/null 2>&1" \;
  if [[ "$1" == "" ]]; then
    echo "Usage: vim-format <file>"
  else
    # +normal! gg=G
    #   This command will indent all the code (hopefully in a proper way).
    # +wq
    #   Save and quit.
    echo "Formatting $1..."
    vim '+normal! gg=G' '+wq' "$1" > /dev/null 2>&1
  fi
}


# -----------------------------------------------------------------------------
#
# FZF
#
# -----------------------------------------------------------------------------

# fbr - checkout git branch (including remote branches)
function gc {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fshow_preview - git commit browser with previews
alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(magenta)%cr %C(white)➜  %C(blue)%an <%ae> %C(green)%GK%C(auto)" "$@"'
function gl {
  local _gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
  local _viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"

    glNoGraph |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview="$_viewGitLogLine" \
                --header "enter to view, alt-y to copy hash" \
                --bind "enter:execute:$_viewGitLogLine   | less -R" \
                --bind "alt-y:execute:$_gitLogLineToHash | xclip"
}
