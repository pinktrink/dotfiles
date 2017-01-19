" Set maps for squashing and picking (s and a, respectively)

nnoremap p ^cwpick<Esc>
nnoremap r ^cwreword<Esc>
nnoremap e ^cwedit<Esc>
nnoremap s ^cwsquash<Esc>
nnoremap f ^cwfixup<Esc>
nnoremap x ^cwexec<Esc>
nnoremap D dd

nnoremap K ^K

" Go to the first line then to the last line of the paragraph
autocmd BufWinEnter * normal gg}k
