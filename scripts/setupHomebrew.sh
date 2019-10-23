#!/bin/bash
isLinux=0; [ -f "/etc/os-release" ] && isLinux=1
# Install Homebrew
if test ! $(which brew); then
  echo "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


# Install Good Stuff
brews=(
  bat
  git-secrets
  hub
  nvm
  pipenv
  python
  shellcheck
  the_silver_searcher
  vim
  watch
  zsh
)

if [ "$isLinux" -eq "1" ] ; then
  echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> $HOME/dotfiles/.doNotCommit
else
  brews+=(cask git kubectx mas)
fi

echo "Installing brews"
brew update
brew install ${brews[@]}

# K9s is an amazing Kubernetes manager
brew tap derailed/k9s && brew install k9s

# Looking forward to this being on normal tap
if [ "$isLinux" -eq "1" ] ; then
  sudo apt-get install python-setuptools
fi
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
