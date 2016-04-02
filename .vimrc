execute pathogen#infect()

" syntax highlighting
syntax on

" loads files with indetation of given file type
filetype plugin indent on

" automatic indetation
set autoindent
" tab is 4 spaces
set tabstop=4
" use spaces, not tabs, for autoindent/tab key
set expandtab
" indent level is 4 spaces wide
set shiftwidth=2
" width of space used by <TAB> and <BS> keys
set softtabstop=4

" Rebind <Leader> key
let mapleader=","

" round indent to a multiple of shiftwidth
set shiftround
" handle tabs more intelligently
set smarttab
" but do not be to much intelligent in tex files
autocmd FileType tex setlocal nosmarttab

" keep 3 context lines above and below the cursor
set scrolloff=3

" wildmenu
set wildmenu
set wildignore=*.o,*.obj,*.swp,*~,*.pyc
" on 1st TAB complete the longest common prefix, on next TABs complete the next full option
set wildmode=longest:full,full

" Let cursor move past the last char in <C-v> mode
set virtualedit=block

" line numbers
set number              " display line numbers
set numberwidth=2       " using at least 2 columns (+ 1 space) for number column

" ==========================================================
"  Source code settings
" ==========================================================

" Allow visual break on ony character (nolinebreak).
" Highlight 80th column and set textwidth to 79 (important e.g. for comments
" to automatically break).
autocmd FileType python,java,javascript,haskell,sh
    \  setlocal nolinebreak
    \ | setlocal colorcolumn=80
    \ | setlocal textwidth=79

" Note: comments can be aligned properly using 'gq' command.

" ==========================================================
"  Search
" ==========================================================
set ignorecase  " Default to using case insensitive searches,
set smartcase   " unless uppercase letters are used in the regex.
set incsearch   " Incrementally search while typing a /regex

" experimentalne: zvyraznovani vyhledavani
set hlsearch    " Highlight searches by default.

"Turn off highlighting on entering insert mode
nnoremap i :noh<CR>i

"Experimental : Turn off highlighting on pressing <enter>
nnoremap <CR>  :noh<CR>

"Experimental : very magic search by defaut
:nnoremap / /\v
:cnoremap %s/ %s/\v


" ==========================================================
"  Commands
" ==========================================================

" show whitespace (tabes and new lines)
nmap <leader>i :set list!<CR>

" ==========================================================
"  theme options
" ==========================================================
set background=dark
colorscheme gryffin

" highlight current line
set cursorline

" toggle light and dark background with F4
call togglebg#map("<F4>")

" characters to show insted of white characters
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<


" ==========================================================
"  Syntastic
" ==========================================================

" Python Checkers
let g:syntastic_python_checkers = ['pylint']

" write errors to loc list
"let g:syntastic_always_populate_loc_list = 1
" location list can be populated explicitly by :Errors

" jump automatically to first error
" let g:syntastic_auto_jump=1

" jump to next error
map <leader>e :lnext<CR>

" jump to previous error
map <leader>p :lprev<CR>

" ignore some messages (note: can be set in ~/.pylintrc)
" F403 = 'from foo import *' used
" E265 = block comment should start with '# '
" E501 = line too long
"let g:syntastic_python_pylint_args = '--disable="F403,E265,E501"'

"" messages filtering
"let g:syntastic_rst_rst2pseudoxml_quiet_messages = {"regex": "Unknown directive type"}

" ==========================================================
"  AirLine
" ==========================================================

" display all the time
set laststatus=2

" set symbols
let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = ''
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.whitespace = 'Ξ'

" use solarized color theme
let g:airline_theme = 'wombat'

" top line (for tabs and buffers)
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number

" to avoid pause when leaving insert mode
set ttimeoutlen=50

" integration of other plugins
let g:airline#extensions#syntastic#enabled = 1
" let g:airline#extensions#virtualenv#enabled = 1
" let g:airline#extensions#branch#enabled = 1


noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        set virtualedit=all
        silent! nunmap <buffer> <Up>
        silent! nunmap <buffer> <Down>
        silent! nunmap <buffer> <Home>
        silent! nunmap <buffer> <End>
        silent! iunmap <buffer> <Up>
        silent! iunmap <buffer> <Down>
        silent! iunmap <buffer> <Home>
        silent! iunmap <buffer> <End>
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        set virtualedit=
        setlocal display+=lastline
        noremap  <buffer> <silent> <Up>   gk
        noremap  <buffer> <silent> <Down> gj
        noremap  <buffer> <silent> <Home> g<Home>
        noremap  <buffer> <silent> <End>  g<End>
        inoremap <buffer> <silent> <Up>   <C-o>gk
        inoremap <buffer> <silent> <Down> <C-o>gj
        inoremap <buffer> <silent> <Home> <C-o>g<Home>
        inoremap <buffer> <silent> <End>  <C-o>g<End>
    endif
endfunction



set wrap linebreak nolist
set virtualedit=
setlocal display+=lastline
noremap  <buffer> <silent> <Up>   gk
noremap  <buffer> <silent> <Down> gj
noremap  <buffer> <silent> <Home> g<Home>
noremap  <buffer> <silent> <End>  g<End>
inoremap <buffer> <silent> <Up>   <C-o>gk
inoremap <buffer> <silent> <Down> <C-o>gj
inoremap <buffer> <silent> <Home> <C-o>g<Home>
inoremap <buffer> <silent> <End>  <C-o>g<End>

" enable mouse
set mouse=a

" enable clipbord integration
set clipboard=unnamedplus

" easier moviong of selected blocks
vnoremap < <gv
vnoremap > >gv
