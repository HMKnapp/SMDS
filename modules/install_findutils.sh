#!/bin/bash
set -E
MODULE_NAME="GNU find, xargs, locate"
function _install {
  [[ -x $(which brew) ]] || ( source $(dirname ${BASH_SOURCE})/install_homebrew.sh && _install ) || false
  echo -n "Installing "

  brew install findutils &>/dev/null

  export PATH="$HOME/homebrew/opt/findutils/libexec/gnubin:$PATH"
  echo 'export PATH="$HOME/homebrew/opt/findutils/libexec/gnubin:$PATH"' | tee -a $HOME/.zprofile $HOME/.bash_profile &>/dev/null

  grep -V | head -n 1
}
(return 0 2>/dev/null) || _install
