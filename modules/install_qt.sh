#!/bin/bash
set -E
MODULE_NAME="Qt"
function _install {
  [[ -x $(which brew) ]] || ( source $(dirname ${BASH_SOURCE})/install_homebrew.sh && _install ) || false
  echo -n "Installing "

  brew install qt &>/dev/null

  export PATH="$HOME/homebrew/opt/qt/bin:$PATH"
  echo 'export PATH="$HOME/homebrew/opt/qt/bin:$PATH"' | tee -a $HOME/.zprofile $HOME/.bash_profile &>/dev/null

  export PKG_CONFIG_PATH="$HOME/homebrew/opt/qt/lib/pkgconfig"
  echo 'export PKG_CONFIG_PATH="$HOME/homebrew/opt/qt/lib/pkgconfig"' | tee -a $HOME/.zprofile $HOME/.bash_profile &>/dev/null

  echo -n "Qt " && qtplugininfo -v | cut -d ' ' -f2
}
(return 0 2>/dev/null) || _install
