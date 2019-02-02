#!/usr/bin/env bash
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.


# Setup GOLANG paths
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi

fi

# update brew
brew update

# Upgrade any already-installed formulae
brew upgrade --all

# Set everything correct
brew doctor

# turn off analytics
brew analytics off

# Add brew to the commands
export PATH="/usr/local/bin:$PATH"

cask_apps=(
  # Documents
  libreoffice

  # Terminals
  iterm2

  # Video
  kap

  # Requirements for curlftpfs
  xquartz
  osxfuse

  # Development
  postman

  # Quicklook
  qlcolorcode
  qlstephen
  qlmarkdown
  quicklook-json
  qlimagesize
  suspicious-package
  quicklookase
  qlvideo
)

brew cask install "${cask_apps[@]}"

apps=(
  # Compiling
  cmake

  # Shell
  bash-completion

  # Image
  imagemagick --with-webp --with-librsvg
  jpeg

  # Developement
  node
  yarn
  php71
  python
  python3
  ruby
  sqlite
  watchman
  openssl
  composer
  curlftpfs
  go
  typescript

  # Terminal
  vim --with-override-system-vi
  wget
  curl
  tree
  htop
  acrogenesis/macchanger/macchanger
  --HEAD universal-ctags/universal-ctags/universal-ctags

  # Omnitagger
  chromaprint

  # IRC
  weechat

  # Compression
  p7zip
  unrar
)

brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup

echo "Installed homebrew packages."

exit 0
