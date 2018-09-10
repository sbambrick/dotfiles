# Neovim
A collection of dotfiles for Neovim.

### Features
* Autocomplete - Language autocompletion for C, Cpp, Go, and Python. Including
  the following keybindings:
    * `gh` - Show documentation
    * `gd` - Goto definition
    * `gr` - Find references
    * `gs` - Goto declaration
    * `F2` - Refactor variable
* Multi-cursor - Edit multiple locations at once. Press `<ctrl>-n` to add a new
  cursor.
* Fuzzy search - Search for files, tags, and words
    * `<ctrl-p>` - Search for files by name
    * `<ctrl-f>` - Search within files in the project directory
    * `<ctrl-w>` - Search for the cursor word within project directory
* Focused editing - Colorscheme updates when tmux focus changes.

### Installation
The following pre-requisites are needed:

* Neovim - Version 0.3+
* Tmux - Version 2.2+ with configuration for true color
* Ripgrep
* Python 3
* Rust

Run the install script to create symlinks to the dotfiles.

```bash
./install.sh
```

This will create the following directories/files:

```
~/.config/nvim/
    config/          # Sub-dotfiles organized by functionality
    init.vim         # Initialization script
    settings.json    # Settings file required by cquery
```

The first time neovim is started after the installation the plugins will be
installed.

