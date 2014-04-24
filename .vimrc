" Hello everyone. Seriously, for your .vimrc, PLEASE USE FULL NAMES FOR
" OPTIONS. Not many people understand what `s ci ai et xr ba fj wl ei kw` means.

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Plugin 'gmarik/vundle'

" Plugins
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'pinktrink/localvimrc'



" Initial settings
filetype plugin indent on
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
set mouse=a                     " Enable the mouse
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
set background=dark             " Dark background for lighter foreground colors
set autochdir                   " Automatically change directory to the current file

set statusline=\ %F%=[0x%B]\ %l\|%c\ %L\ [%p%%]\ 

syntax on  " Turn on syntax highlighting

let g:mapleader=","
let mapleader=","    " , for the leader

let g:netrw_liststyle=3   " Prefer tree view for browsing
let g:netrw_fastbrowse=2  " Cache all directory listing buffers
let g:netrw_preview=1     " Open previews in a vertical split
let g:netrw_winsize=20    " Make the directory listing 30 columns when a preview is open
let g:netrw_keepdir=0     " Track directory changes when traversing the filesystem
let g:netrw_altv=1        " Keep the explore window open when editing files

" Remap ; to :
nnoremap ; :



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

" Move characters left or right with C-h or C-l, respectively
nnoremap <C-h> xhhp
nnoremap <C-l> xp

" Navigate between windows with <leader>h|j|k|l and <leader>Up|Down|Left|Right
nnoremap <leader>h <C-w>h
nnoremap <leader><Left> <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader><Down> <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader><Up> <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader><Right> <C-w>l

" Close the preview window with <leader>z
nnoremap <leader>z <C-w>z

" <leader>r to toggle relative line numbers
nnoremap <leader>r :set relativenumber!<CR>

" <leader>f to toggle folding
nnoremap <leader>f za

" <leader>/ to comment or uncomment (requires vim-commentary)
nmap <leader>/ gcc
vmap <leader>/ gcgv

" <leader><leader>w to write
nnoremap <leader><leader>w :w<CR>

" <leader><leader>r to reload vim config
nnoremap <leader><leader>r :source $MYVIMRC<CR>

" <leader><leader>e to reload current file
nnoremap <leader><leader>e :e<CR>

" <leader><leader>q to close the current window
nnoremap <leader><leader>q :q<CR>

" <leader><leader>x to pull up the explore window in a vertical split
nnoremap <leader><leader>x :Vexplore<CR>



" Jump to the same place as you were when you closed the file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Only show numbers for the current window
autocmd WinEnter * :setlocal number
autocmd WinLeave * :setlocal nonumber
