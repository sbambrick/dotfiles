if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
  call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
call dein#begin(expand('~/.config/nvim'))

call dein#add('Shougo/dein.vim')

" Extend the installation timeout to allow time for markdown composer build to
" complete
let g:dein#install_process_timeout=300

" Editor
call dein#add('terryma/vim-multiple-cursors')
call dein#add('tpope/vim-eunuch')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')

" Theme
call dein#add('sbambrick/oceanic-next')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('Yggdroot/indentLine')
call dein#add('amerlyq/vim-focus-autocmd')
call dein#add('sjl/vitality.vim')
call dein#add('RRethy/vim-illuminate')

" Markdown
call dein#add('tpope/vim-markdown', {'on_ft': 'markdown'})
call dein#add('dhruvasagar/vim-table-mode')
call dein#add('nelstrom/vim-markdown-folding', {'on_ft': 'markdown'})
call dein#add('euclio/vim-markdown-composer', {'build': 'cargo build --release'})

" Language
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/deoplete-lsp')
call dein#add('neovim/nvim-lsp')
call dein#add('roxma/nvim-yarp')
call dein#add('roxma/vim-hug-neovim-rpc')
call dein#add('sheerun/vim-polyglot')

" Search
call dein#add('cloudhead/neovim-fuzzy')

" Fold
call dein#add('Konfekt/FastFold')

" SCM
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')
call dein#add('vim-scripts/vim-svngutter')

if dein#check_install()
  call dein#install()
  let pluginsExist=1
endif

call dein#end()
filetype plugin indent on

