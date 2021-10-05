#!/bin/bash
set -E
MODULE_NAME="iTerm2"
function _install {
  [[ -x $(which brew) ]] || ( source $(dirname ${BASH_SOURCE})/install_homebrew.sh && _install ) || false
  echo -n "Installing "

  brew install --cask iterm2 &>/dev/null

  brew info iterm2 | head -n 1 | sed 's/://'
}
(return 0 2>/dev/null) || _install
