" Color configuration
if (has("termguicolors"))
    set termguicolors                                       " Enable true color
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"                  " Required for tmux
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"                  " Required for tmux
endif

" Airline configuration
let g:airline#extensions#tabline#enabled = 1                " Enable showing open buffers
let g:airline#extensions#tabline#formatter = 'unique_tail'  " Only show filename in tabline
let g:airline_powerline_fonts = 0                           " Disable fancy fonts
let g:airline_theme ='oceanicnext'                          " Match the theme

" OceanicNext configuration
colorscheme OceanicNext                                     " Set the theme

" Enable and disable syntax highlighting and window color whenever the window
" gains or loses focus. The GUI foreground colors are taken from the OceanicNext
" theme and should be updated if the colorscheme changes.

function! EnableFocus()
    colorscheme OceanicNext
    AirlineRefresh
    set cursorline
    set cursorcolumn
    set colorcolumn=80,120
    set hlsearch
    IlluminationEnable
endfunction

function! DisableFocus()
    colorscheme OceanicNextDim
    set nocursorline
    set nocursorcolumn
    set colorcolumn=
    set nohlsearch
    IlluminationDisable
endfunction

autocmd FocusGained * call EnableFocus()
autocmd FocusLost * call DisableFocus()

