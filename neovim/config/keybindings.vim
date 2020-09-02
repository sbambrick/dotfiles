" Autocomplete
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gs    <cmd>lua vim.lsp.buf.type_definition()<CR>
nmap <silent> <F2> <Plug>(coc-rename)

" Search
nnoremap <C-p> :FuzzyOpen <CR>
nnoremap <C-w> :FuzzyGrep <C-R><C-W><CR>
nnoremap <C-f> :FuzzyGrep <CR>
