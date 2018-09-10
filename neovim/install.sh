#!/usr/bin/env bash

# Store the current directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Create the neovim config if it doesn't exist
NVIM_DIR="$HOME/.config/nvim"
if [ ! -d "${NVIM_DIR}" ]; then
    mkdir -p "${NVIM_DIR}"
fi

# Create a link to init.vim
if [ -L "${NVIM_DIR}/init.vim" ] || [ -e "${NVIM_DIR}/init.vim" ]; then
    mv "${NVIM_DIR}/init.vim" "${NVIM_DIR}/init.vim.backup"
fi
ln -s "${SCRIPT_DIR}/init.vim" "${NVIM_DIR}/init.vim"

# Create a link to the config directory
if [ -L "${NVIM_DIR}/config" ] || [ -d "${NVIM_DIR}/config" ]; then
    mv "${NVIM_DIR}/config" "${NVIM_DIR}/config.backup"
fi
ln -s "${SCRIPT_DIR}/config" "${NVIM_DIR}/config"

# Create a link to settings.json
if [ -L "${NVIM_DIR}/settings.json" ] || [ -e "${NVIM_DIR}/settings.json" ]; then
    mv "${NVIM_DIR}/settings.json" "${NVIM_DIR}/settings.json.backup"
fi
ln -s "${SCRIPT_DIR}/settings.json" "${NVIM_DIR}/settings.json"

