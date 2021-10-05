#!/bin/bash
set -E
MODULE_NAME="VIM"
function _install {
  [[ -x $(which brew) ]] || ( source $(dirname ${BASH_SOURCE})/install_homebrew.sh && _install ) || false
  echo -n "Installing "

  brew install vim &>/dev/null

  vim --version | head -n 1
}
(return 0 2>/dev/null) || _install
