#!/bin/bash
set -E
MODULE_NAME="ohmyzsh"
function _install {
  echo -n "Installing "

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended &>/dev/null

  echo "Oh My ZSH"
}
(return 0 2>/dev/null) || _install
