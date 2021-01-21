#!/bin/bash
set -E
MODULE_NAME="Homebrew"
function _install {
  [[ -x $(which brew) ]] && return 0
  echo -n "Installing "

  cd $HOME && mkdir homebrew && curl -L 'https://github.com/Homebrew/brew/tarball/master' | tar xz --strip 1 -C homebrew
  echo 'export PATH="$HOME/homebrew/bin:$PATH"' | tee -a $HOME/.zprofile $HOME/.bash_profile &>/dev/null
  export PATH="$HOME/homebrew/bin:$PATH"
  echo 'export HOMEBREW_CASK_OPTS="--appdir=$HOME/Apps"' | tee -a $HOME/.zprofile $HOME/.bash_profile &>/dev/null

  2>&1 brew --version | head -n 1
}
(return 0 2>/dev/null) || _install
