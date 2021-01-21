#!/bin/bash
set -E
MODULE_NAME="Ruby"
function _install {
  [[ -x $(which brew) ]] || ( source $(dirname ${BASH_SOURCE})/install_homebrew.sh && _install ) || false
  echo -n "Installing "

  brew install ruby &>/dev/null
  RUBY_VER=$(ls -r $HOME/homebrew/lib/ruby/gems/ | head -n 1)
  [[ -n ${RUBY_VER} ]] || false
  export PATH="$HOME/homebrew/opt/ruby/bin:$PATH"
  export PATH="$HOME/homebrew/lib/ruby/gems/$RUBY_VER/bin:$PATH"
  echo 'export PATH="$HOME/homebrew/lib/ruby/gems/'$RUBY_VER'/bin:$PATH"' | tee -a $HOME/.zprofile $HOME/.bash_profile &>/dev/null
  echo 'export PATH="$HOME/homebrew/opt/ruby/bin:$PATH"' | tee -a $HOME/.zprofile $HOME/.bash_profile &>/dev/null

  ruby --version
}
(return 0 2>/dev/null) || _install
