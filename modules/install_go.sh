#!/bin/bash
set -E
MODULE_NAME="Golang"
function _install {
  [[ -x $(which brew) ]] || ( source $(dirname ${BASH_SOURCE})/install_homebrew.sh && _install ) || false
  echo -n "Installing "

  brew install go &>/dev/null
  echo 'export GOPATH=$HOME/.golang' | tee -a $HOME/.zprofile $HOME/.bash_profile &>/dev/null
  echo 'export PATH=$GOPATH/bin:$PATH' | tee -a $HOME/.zprofile $HOME/.bash_profile &>/dev/null
  export GOPATH=$HOME/.golang
  export PATH=$GOPATH/bin:$PATH

  go version
}
(return 0 2>/dev/null) || _install
