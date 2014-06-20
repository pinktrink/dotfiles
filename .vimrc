" Hello everyone. Seriously, for your .vimrc, PLEASE USE FULL NAMES FOR OPTIONS.
" Not many people understand what `s ci ai et xr ba fj wl ei kw` means.

" Note how I don't have `set nocompatible`. If it detects a .vimrc or .gvimrc,
" it automatically assumes `nocompatible`.
" SO QUIT FRIGGIN' PUTTING IT IN YOUR STUPID .VIMRC FILES

" Vundle
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
Plugin 'tpope/vim-surround'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'altercation/vim-colors-solarized'  " Okay you broke me, I'll use Solarized
Plugin 'pinktrink/localvimrc'


" Initial settings
filetype plugin indent on
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
set noswapfile                  " No swapfiles
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
set colorcolumn=81,121          " Add a column marker at 81 and 121
set laststatus=2                " Enable the status line
set background=dark             " Dark background for lighter foreground colors
set autochdir                   " Automatically change directory to the current file
set nrformats=alpha,hex         " Increment letters and hex
set report=0                    " Report all actions that occur
set spell                       " Turn on spell checking. Too many programmers have deplorable spelling skills

set statusline=\ %#StatusLineSection#\ %F\ %*\ %=\ %#StatusLineSection#\ [0x%B]\ %*\ %#StatusLineSection#\ %l\|%c(%v)\ %*\ %#StatusLineSection#\ %L\ %*\ %#StatusLineSection#\ [%p%%]\ %*\ 

syntax on  " Turn on syntax highlighting

" Serious question here: Who the hell uses , and ;?

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

" Set up solarized for the terminal
let g:solarized_termcolors=256
colorscheme solarized

" Fix colors
autocmd ColorScheme * call SetUpHighlightingBecauseColorschemeFucksEverythingUp()



" Mappings
if has("mac")
    if !has("gui_macvim")
        " Move lines up or down with A-k or A-j, repsectively (MAC ONLY)
        nnoremap ∆ :m+<CR>==
        nnoremap ˚ :m-2<CR>==
        inoremap ∆ <Esc>:m+<CR>==gi
        inoremap ˚ <Esc>:m-2<CR>==gi
        vnoremap ∆ :m '>+<CR>gv=gv
        vnoremap ˚ :m '<-2<CR>gv=gv

        " Move characters left or right with A-h or A-l, respectively
        nnoremap ˙ dlhP
        nnoremap ¬ dlp
        inoremap ˙ dlhP
        inoremap ¬ dlp
        vnoremap ˙ dlhP
        vnoremap ¬ dlp

        " Delete to the black hole with A-d and A-x
        nnoremap ∂ "_d
        nnoremap ≈ "_x
    endif
endif

" Display results for searches in the middle of the page
nnoremap n nzz
nnoremap N Nzz

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

" <leader>s to toggle invisibles
nnoremap <leader>s :set list!<CR>

" <leader>c to toggle colorcolumn
nnoremap <leader>c :call ToggleColorColumn()<CR>

" <leader>f to toggle folding
nnoremap <leader>f za

" <leader>/ to comment or uncomment (requires vim-commentary)
nmap <leader>/ gcc
vmap <leader>/ gcgv

" <leader>x to enter explore
nnoremap <leader>x :Explore<CR>

" <leader>b to unset the buffer type
nnoremap <leader>b :set buftype=<CR>

" <leader><leader>r to reload vim config
nnoremap <leader><leader>r :source $MYVIMRC<CR>

" <leader><leader>x to pull up the explore window in a vertical split
nnoremap <leader><leader>x :Vexplore<CR>



" Jump to the same place as you were when you closed the file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Only show numbers for the current window
autocmd WinEnter * setlocal number
autocmd WinLeave * setlocal nonumber

let b:colorcolval=&l:colorcolumn
function! ToggleColorColumn()
    if &colorcolumn != ''
        let b:colorcolval=&l:colorcolumn

        set colorcolumn&
    else
        let &l:colorcolumn=b:colorcolval
    endif
endfunction

function! SetUpHighlightingBecauseColorschemeFucksEverythingUp()
    " Status line colors
    highlight StatusLineSection ctermbg=206 guibg=#ff5fd7 ctermfg=0 guifg=#000000
    highlight StatusLine ctermfg=45 guifg=#00d7ff

    " Highlight trailing whitespace
    highlight WhitespaceEOL ctermbg=88 guibg=#870000

    " Gutter color
    highlight SignColumn ctermbg=234 guibg=#1c1c1c

    " Line number color
    highlight LineNr ctermfg=250 guifg=#bcbcbc

    " Color for the cursor's line
    highlight CursorLineNr ctermfg=45 guifg=#00d7ff

    call matchadd('WhitespaceEOL', '\s\+$')
endfunction
