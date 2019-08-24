
" Autocomplete
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gh :call <SID>show_documentation()<CR>
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gs <Plug>(coc-type-definition)
nmap <silent> <F2> <Plug>(coc-rename)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Search
nnoremap <C-p> :<C-u>Denite file/rec<CR>
nnoremap <C-w> :<C-u>DeniteCursorWord grep:. <CR>
nnoremap <C-f> :<C-u>Denite grep:. <CR>
