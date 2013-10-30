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
