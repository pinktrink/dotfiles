" Most of the settings are handled in vimrc. These are gui-specific.

" Initial settings
set macmeta
set guioptions-=rl
set background=dark
set guioptions=



" Mappings
" Source gvimrc as well as vimrc with <leader><leader>r
nnoremap <leader><leader>r :source $MYVIMRC<CR>:source $MYGVIMRC<CR>
" Move lines up or down with M-k or M-j, repsectively
nnoremap <M-j> :m+<CR>==
nnoremap <M-Down> :m+<CR>==
nnoremap <M-k> :m-2<CR>==
nnoremap <M-Up> :m-2<CR>==
inoremap <M-j> <Esc>:m+<CR>==gi
inoremap <M-Down> <Esc>:m+<CR>==gi
inoremap <M-k> <Esc>:m-2<CR>==gi
inoremap <M-Up> <Esc>:m-2<CR>==gi
vnoremap <M-j> :m '>+<CR>gv=gv
vnoremap <M-Down> :m '>+<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv
vnoremap <M-Up> :m '<-2<CR>gv=gv

" Move characters left or right with A-h or A-l, respectively
nnoremap <M-h> dlhP
nnoremap <M-Left> dlp
nnoremap <M-l> xp
nnoremap <M-Right> xp
inoremap <M-h> dlhP
inoremap <M-Left> dlp
inoremap <M-l> xp
inoremap <M-Right> xp
vnoremap <M-h> dlhP
vnoremap <M-Left> dlp
vnoremap <M-l> xp
vnoremap <M-Right> xp

" Delete to the black hole
nnoremap <M-d> "_d
nnoremap <M-x> "_x
nnoremap <M--> "_

" C-M-a and C-M-x to increment or decrement by whatever b:minc is, respectively
let b:minc = 10

nnoremap <C-M-a> :execute "normal " . b:minc . "\<C-a>"<CR>
nnoremap <C-M-x> :execute "normal " . b:minc . "\<C-x>"<CR>

" Cmd-Return to toggle fullscreen mode (mimicking iTerm2)
noremap <D-Return> :set fullscreen!<CR>

" M-Return to add a line below and M-S-Return to add a line above
nnoremap <M-Return> mXo<Esc>`X
nnoremap <M-S-Return> mXO<Esc>`X
