#!/usr/bin/env bash

# Store the current directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Create a link to .zshrc
if [ -L "${HOME}/.zshrc" ] || [ -e "${HOME}/.zshrc" ]; then
    mv "${HOME}/.zshrc" "${HOME}/.zshrc.backup"
fi
ln -s "${SCRIPT_DIR}/zshrc" "${HOME}/.zshrc"

