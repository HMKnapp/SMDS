#!/bin/bash
set -E

echo "SMDS v0.1 - github.com/HMKnapp"

echo
echo "Installs without admin privileges:"
echo

for m in modules/*; do source ${m} && echo "${MODULE_NAME}"; done

echo
read -t 30 -p "Continues in 30 seconds or press Enter to continue now..."
echo

for m in modules/*; do source ${m} && _install; done

echo
echo "All done"
