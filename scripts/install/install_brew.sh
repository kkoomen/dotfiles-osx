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
  # Video
  kap

  # Screenshot
  skitch

  # Requirements for curlftpfs
  xquartz
  osxfuse
)

brew cask install "${cask_apps[@]}"

apps=(
  # Install Docker
  docker
  docker-compose

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

  # Terminal
  wget
  curl
  tree
  htop

  # IRC
  weechat

  # Tags
  ctags

  # Compression
  p7zip
)

brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup

echo "Installed homebrew packages."

exit 0
