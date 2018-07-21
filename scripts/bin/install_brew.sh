#!/usr/bin/env bash
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

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
  # Terminals
  iterm2

  # Video
  kap

  # Screenshot
  skitch

  # Requirements for curlftpfs
  xquartz
  osxfuse

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
  php71
  python
  python3
  ruby
  sqlite
  watchman
  openssl
  composer
  curlftpfs
  typescript

  # Terminal
  vim
  wget
  curl
  tree
  htop
  acrogenesis/macchanger/macchanger

  # IRC
  weechat

  # Compression
  p7zip
)

brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup

echo "Installed homebrew packages."

exit 0
