" Vim/Neovim configuration for language packs and autocompletion.
lua << END
    require'nvim_lsp'.pyls.setup{}
    require'nvim_lsp'.ccls.setup{}
    require'nvim_lsp'.rust_analyzer.setup{}
END

" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('smart_case', v:true)
call deoplete#custom#option('auto_complete_delay', 500)

" Disable/Enable autocomplete when using multiple cursors
function g:Multiple_cursors_before()
    call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction
function g:Multiple_cursors_after()
    call deoplete#custom#buffer_option('auto_complete', v:true)
endfunction

" Completion menu
set completeopt-=preview
set completeopt+=menu,menuone,noinsert,noselect

" Close split pane if visible when leaving insert mode
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Disable markdown concealing
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_conceal = 0
