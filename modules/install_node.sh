#!/bin/bash
set -E
MODULE_NAME="NodeJS"
function _install {
  [[ -x $(which brew) ]] || ( source $(dirname ${BASH_SOURCE})/install_homebrew.sh && _install ) || false
  echo -n "Installing "

  brew install node &>/dev/null

  echo -n "node " && node --version
}
(return 0 2>/dev/null) || _install
