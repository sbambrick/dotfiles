#!/usr/bin/env bash

# Store the current directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Create a link to tmux.conf
if [ -L "${HOME}/.tmux.conf" ] || [ -e "${HOME}/.tmux.conf" ]; then
    mv "${HOME}/.tmux.conf" "${HOME}/.tmux.conf.backup"
fi
ln -s "${SCRIPT_DIR}/tmux.conf" "${HOME}/.tmux.conf"

