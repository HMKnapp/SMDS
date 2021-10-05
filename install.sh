#!/bin/bash
set -E

echo "SMDS v0.1 - github.com/HMKnapp"

echo
echo "Installs without admin privileges:"
echo

for m in modules/*; do source ${m} && echo "${MODULE_NAME} (manual installation: bash ${m})"; done

echo
read -t 30 -p "Continues in 30 seconds or press Enter to continue now..."
echo

echo "Please be patient, VERY patient while brew compiles and installs..."
export PATH="$HOME/homebrew/bin:$PATH"
_workdir=$(pwd)
for m in modules/*; do source ${m} && _install; cd ${_workdir}; done

echo
echo "All done"

exit 0
