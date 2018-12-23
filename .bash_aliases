shopt -s expand_aliases

# GENERAL
alias mkdir="mkdir -pv"
alias vi="vim"
alias ls="ls -lhG"
alias sl="ls"
alias tree="tree -C"
alias calc="bc -l"
alias cb="pbcopy"
alias yt-dl='youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s"'
alias make-tar="tar -czvf"
alias rsync="rsync -azh -P --stats --timeout=120 --update"

# NETWORK
alias xip="curl icanhazip.com"
alias lip="ipconfig getifaddr en0"

# DOTFILES
alias bashrc="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias reload="source ~/.bash_profile"

# PASTEBINS
alias ix="curl -s -F 'f:1=<-' ix.io"
alias pb="curl -s -F c=@- https://ptpb.pw/ | grep url"

# DOCKER
alias dsh="docker-compose exec php sh"

# LINTERS
alias drupalcs="phpcs --standard=Drupal --extensions='php,module,inc,install,test,profile,theme,css,info,txt,md' --ignore=node_modules,bower_components,vendor,profiles/*.info.yml"
alias drupalcsp="phpcs --standard=DrupalPractice --extensions='php,module,inc,install,test,profile,theme,css,info,txt,md' --ignore=node_modules,bower_components,vendor,profiles/*.info.yml"
alias drupalcbf="phpcbf --standard=Drupal --extensions='php,module,inc,install,test,profile,theme,css,info,txt,md' --ignore=node_modules,bower_components,vendor,profiles/*.info.yml"
