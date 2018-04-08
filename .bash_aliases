shopt -s expand_aliases

# GENERAL
alias dsize='du -hs'
alias mkdir='mkdir -pv'
alias vi='vim'
alias ls='ls -lG'
alias sl='ls'
alias tree='tree -C'
alias calc='bc -l'
alias cb="pbcopy"
alias yt-dl='youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s"'
alias make-tar='tar -czvf'
alias rsync='rsync -avzh -P --stats --timeout=60'

# NETWORK
alias xip='curl icanhazip.com'
alias lip="ifconfig | grep -A 1 'en0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1"

# DOTFILES
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias reload='source ~/.bashrc'

# PASTEBINS
alias ix="curl -s -F 'f:1=<-' ix.io"
alias pb="curl -s -F c=@- https://ptpb.pw/ | grep url"

# FIREWALL
# alias httpon='sudo ufw allow http'
# alias httpoff='sudo ufw delete allow http'
