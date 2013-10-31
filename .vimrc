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

" Turn on line numbers
set nu

" Turn on the ruler
set ruler

" Highlight trailing whitespace
highlight WhitespaceEOL ctermbg=red guibg=red
call matchadd('WhitespaceEOL', '\s\+$')

" Yes we want swap files, no we don't want swap files all over. Let's organize
set directory=$HOME/.swp

" Set the updatetime to 250 instead of 4000 (for gitgutter)
set updatetime=1000

" I'd love to scroll (install SIMBL and MouseTerm first if using Terminal)
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

" In order for these two to work you need to add a keymap in Terminal's
" preferences for \033[5A for Ctrl+Cursor Up and \033[5B for Ctrl+Cursor Down
" This is done automatically in my .osx
map <ESC>[5A <C-Up>
map <ESC>[5B <C-Down>

" Navigate split windows with ctrl+<direction>
nnoremap <silent> <C-Right> <C-W><Right>
nnoremap <silent> <C-Left> <C-W><Left>
nnoremap <silent> <C-Up> <C-W><Up>
nnoremap <silent> <C-Down> <C-W><Down>
