" If you're using Terminal, go ahead and install SIMBL and MouseTerm, then go
" into Terminal > Preferences > Settings > Keyboard, then add the following
" mappings (Press the escape key to get \033):
"     Ctrl + Cursor Up: \033[5A
"     Ctrl + Cursor Down: \033[5B
"     Ctrl + Cursor Right: \033[5C
"     Ctrl + Cursor Left: \033[5D

set nocompatible

" Load Pathogen
call pathogen#infect()

" Turn on syntax highlighting
syntax on

" Load Pathogen plugins
filetype plugin indent on

" Turn on autoindent
set cindent
set smartindent
set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4

" Turn on code folding
set foldmethod=indent
set foldnestmax=12
set nofoldenable
set foldlevel=1

set backspace=indent,eol,start

" Turn on line numbers
set number

" Turn on the ruler
set ruler

" Highlight the current line
set cursorline

" Highlight trailing whitespace
highlight WhitespaceEOL ctermbg=red guibg=red
call matchadd('WhitespaceEOL', '\s\+$')

" Yes we want swap files, no we don't want swap files all over. Let's organize
set directory=$HOME/.swp

" Set the updatetime to 250 instead of 4000 (for gitgutter)
set updatetime=1000

" I'd love to scroll and click
set mouse=a
set ttymouse=xterm2

" Auto-maximize the current window if in a split
set winminwidth=0
set winminheight=0
set winheight=999
set winwidth=999

" Fix arrow key maps
map <ESC>[5C <C-Right>
map <ESC>[5D <C-Left>
map <ESC>[5A <C-Up>
map <ESC>[5B <C-Down>

" Navigate split windows with ctrl+<direction>
nnoremap <silent> <C-Right> <C-W><Right>
nnoremap <silent> <C-Left> <C-W><Left>
nnoremap <silent> <C-Up> <C-W><Up>
nnoremap <silent> <C-Down> <C-W><Down>

" Add a ruler at 80
set colorcolumn=80

" Use Molokai for the default colorscheme
set t_Co=256
colorscheme molokai

