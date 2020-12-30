#!/bin/bash
set -E
MODULE_NAME="Git"
function _install {
  [[ -x $(which brew) ]] || ( source $(dirname ${BASH_SOURCE})/install_homebrew.sh && _install ) || false
  echo -n "Installing "

  brew install git &>/dev/null

  git --version
}
(return 0 2>/dev/null) || _install
