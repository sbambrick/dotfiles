#!/usr/bin/env bash

# Store the current directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Create a link to tmux.conf
if [ -L "${HOME}/.gitconfig" ] || [ -e "${HOME}/.gitconfig" ]; then
    mv "${HOME}/.gitconfig" "${HOME}/.gitconfig.backup"
fi
ln -s "${SCRIPT_DIR}/gitconfig" "${HOME}/.gitconfig"

