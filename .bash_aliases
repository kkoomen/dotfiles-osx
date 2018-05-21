shopt -s expand_aliases

# GENERAL
alias dsize='du -hs'
alias mkdir='mkdir -pv'
alias vi='vim'
alias ls='ls -lhG'
alias sl='ls'
alias tree='tree -C'
alias calc='bc -l'
alias cb="pbcopy"
alias yt-dl='youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s"'
alias make-tar='tar -czvf'
alias rsync='rsync -avzh -P --stats --timeout=120'

# NETWORK
alias xip='curl icanhazip.com'
alias lip="ipconfig getifaddr en0"

# DOTFILES
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias reload='source ~/.bash_profile'

# PASTEBINS
alias ix="curl -s -F 'f:1=<-' ix.io"
alias pb="curl -s -F c=@- https://ptpb.pw/ | grep url"

# DOCKER
alias dsh='docker-compose exec php sh'
