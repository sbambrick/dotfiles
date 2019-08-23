" Vim/Neovim configuration for language packs and autocompletion.
"
" Required plugins:
"   * neoclide/coc.nvim
"
" Recommended plugins:
"   * sheerun/vim-polyglot - Language pack for 100s of languages
"   * fatih/vim-go - Go language pack
"
" Required external tools:
"   * cquery - Language server for C/Cpp
"   * go-langserver - Language server for go
"   * pyls - Language server for python
"

" Completion menu
set completeopt-=preview
set completeopt+=menu,menuone,noinsert,noselect

" Close split pane if visible when leaving insert mode
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

