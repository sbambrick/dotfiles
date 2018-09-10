
" Autocomplete
nnoremap <silent> gh   :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd   :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr   :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs   :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Search
nnoremap <C-p> :<C-u>Denite file_rec<CR>
nnoremap <C-w> :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
nnoremap <C-f> :<C-u>Denite grep:. -mode=normal<CR>
