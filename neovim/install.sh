#!/usr/bin/env bash

# Check if neovim, ripgrep, cargo, python3, and pip3 are installed
if ! [ -x "$(command -v nvim)" ]; then
    echo "nvim not found on path, exiting" >&2
    exit 1
fi

if ! [ -x "$(command -v rg)" ]; then
    echo "rg not found on path, exiting" >&2
    exit 1
fi

if ! [ -x "$(command -v cargo)" ]; then
    echo "cargo not found on path, exiting" >&2
    exit 1
fi

if ! [ -x "$(command -v python3)" ]; then
    echo "python3 not found on path, exiting" >&2
    exit 1
fi

if ! [ -x "$(command -v pip3)" ]; then
    echo "pip3 not found on path, exiting" >&2
    exit 1
fi

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
    rm -rf "${NVIM_DIR}/config.backup"
    mv "${NVIM_DIR}/config" "${NVIM_DIR}/config.backup"
fi
ln -s "${SCRIPT_DIR}/config" "${NVIM_DIR}/config"

# Create a link to settings.json
if [ -L "${NVIM_DIR}/settings.json" ] || [ -e "${NVIM_DIR}/settings.json" ]; then
    mv "${NVIM_DIR}/settings.json" "${NVIM_DIR}/settings.json.backup"
fi
ln -s "${SCRIPT_DIR}/settings.json" "${NVIM_DIR}/settings.json"

# Install the neovim plugin
pip3 install neovim
nvim +UpdateRemotePlugins +qall

# Install the language clients
pip3 install 'python-language-server[all]'

if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install cquery
else
    echo "OS is not macOS, cquery not installed"
fi

if [ -x "$(command -v go)" ]; then
    go get -u github.com/sourcegraph/go-langserver
else
    echo "go not found on path, go-langserver not installed" >&2
    exit 1
fi

