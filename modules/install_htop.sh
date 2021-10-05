#!/bin/bash
set -E
MODULE_NAME="htop"
function _install {
  [[ -x $(which brew) ]] || ( source $(dirname ${BASH_SOURCE})/install_homebrew.sh && _install ) || false
  echo -n "Installing "

  brew install htop &>/dev/null

  htop --version
}
(return 0 2>/dev/null) || _install
