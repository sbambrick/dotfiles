" Vim/Neovim configuration for language packs and autocompletion.
"
" Required plugins:
"   * Shougo/deoplete.vim - Async autocompletion framework
"   * autozimu/LanguageClient-neovim - Language server client
"   * Shougo/echodoc - Show function signature in bottom dock
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

" Deoplete
let g:deoplete#enable_at_startup                    = 1 " Enable code completion
let g:deoplete#auto_complete_delay                  = 0 " Disable autocompletion delay
call deoplete#custom#option('smart_case', v:true)       " Enable smart case completion

" Manually configure the autocomplete providers
let g:deoplete#sources         = {}
let g:deoplete#sources.c       = ['LanguageClient']
let g:deoplete#sources.cpp     = ['LanguageClient']
let g:deoplete#sources.python  = ['LanguageClient']
let g:deoplete#sources.python3 = ['LanguageClient']
let g:deoplete#sources.vim     = ['vim']

" Disable autocomplete in comments and strings
call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])

" Close split pane if visible when leaving insert mode
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Echodoc
let g:echodoc_enable_at_startup = 1 " Show function signature on bottom

" LanguageClient
let g:LanguageClient_settingsPath   = '$HOME/.config/nvim/settings.json'
let g:LanguageClient_loadSettings   = 1
let g:LanguageClient_serverCommands = {
            \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
            \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
            \ 'go': ['go-langserver', '-gocodecompletion'],
            \ 'python': ['pyls'],
            \ }

" Disable/Enable autocomplete when using multiple cursors
function! Multiple_cursors_before()
  let b:deoplete_disable_auto_complete=2
endfunction

function! Multiple_cursors_after()
  let b:deoplete_disable_auto_complete=0
endfunction

