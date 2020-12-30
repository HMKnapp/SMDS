#!/bin/bash
set -E
MODULE_NAME="GNU bash"
function _install {
  [[ -x $(which brew) ]] || ( source $(dirname ${BASH_SOURCE})/install_homebrew.sh && _install ) || false
  echo -n "Installing "

  brew install bash &>/dev/null

  bash --version | head -n 1
}
(return 0 2>/dev/null) || _install
