" Initial settings
set nocompatible
set cindent                     " Turn on autoindent
set smartindent
set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4
set foldmethod=indent           " Turn on folding
set foldnestmax=12
set nofoldenable
set foldlevel=1
set backspace=indent,eol,start  " Fix backspace
set number                      " Turn on line numbers
set ruler                       " Turn on the ruler
set cursorline                  " Highlight the current line
set cursorcolumn                " Highlight the current column
set directory=$HOME/.swp        " Swapfiles to $HOME/.swp
set mouse=a                    " Enable the mouse
set ttymouse=xterm2
set visualbell                  " Visual bell
set cmdheight=2                 " Larger command window height
set lazyredraw                  " Don't redraw while running macros
set showcmd                     " Show command info
set showmatch                   " Show matching brackets
set ttyfast                     " Fast terminal
set ignorecase                  " Ignore case when searching unless there is a capital letter
set smartcase
set colorcolumn=81              " Add a column marker at 81
set laststatus=2                " Enable the status line

set statusline=\ %F%=[0x%B\ %l(/%L),%c\ [%p%%]\ 

syntax on  " Turn on syntax highlighting

let g:mapleader=","
let mapleader=","    ", for the leader



" Pathogen
call pathogen#infect()  " Load Pathogen

filetype plugin indent on  " Load pathogen plugins



" Highlighting
" Highlight trailing whitespace
highlight WhitespaceEOL ctermbg=88 guibg=88

" Gutter color
highlight SignColumn ctermbg=234 guibg=234

" Line number color
highlight LineNr ctermfg=250 guifg=250

" Color for the cursor's line
highlight CursorLineNr ctermfg=45 guifg=45

" The column marker's color
highlight ColorColumn ctermbg=206 guibg=206

call matchadd('WhitespaceEOL', '\s\+$')
" autocmd CholorScheme * highlight WhitespaceEOL ctermbg=88 guibg=88



" Mappings
" Move lines up or down with C-k or C-j, repsectively
nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m '>+<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Navigate between windows with <leader>h|j|k|l and <leader>Up|Down|Left|Right
nnoremap <leader>h <C-w>h
nnoremap <leader><Left> <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader><Down> <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader><Up> <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader><Right> <C-w>l



" Jump to the same place as you were when you closed the file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

