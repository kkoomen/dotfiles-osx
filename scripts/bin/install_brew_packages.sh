#!/usr/bin/env bash
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.


# Setup GOLANG paths
#. ~/.bashrc
#test -d "${GOPATH}" || mkdir "${GOPATH}"
#test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

# Check for Homebrew
if test ! $(which brew)
then
  echo "Installing Homebrew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew update && brew upgrade

# Set everything correct
brew doctor

# turn off analytics
brew analytics off

# Add brew to the commands
export PATH="/usr/local/bin:$PATH"

cask_apps=(
  # Documents
  libreoffice

  # Media players
  vlc

  # Terminals
  iterm2

  # Requirements for curlftpfs
  xquartz
  osxfuse

  # Compiling
  cmake

  # Development
  postman
  sequel-pro

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

for app in "${cask_apps[@]}"; do
  brew install --cask "$app"
done

apps=(
  # Base
  coreutils
  telnet

  # Encryption
  gpg

  # Shell
  bash-completion

  # Image
  imagemagick
  jpeg

  # Searching
  ripgrep

  # Developement
  yarn
  php
  python
  python3
  ruby
  openssl
  composer
  curlftpfs
  go
  typescript
  git

  # Development: C
  # gcc
  # llvm

  # Terminal
  vim
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

for app in "${apps[@]}"; do
  brew install "$app"
done

# Remove outdated versions from the cellar
brew cleanup

echo "Installed homebrew packages."

exit 0
