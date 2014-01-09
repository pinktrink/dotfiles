" Set the tab size to 4
set tabstop=4

" Set the shift width to 4
set shiftwidth=4

" Use shiftwidth for inserting tabs
set smarttab

" Use spaces instead of tabs
set expandtab

" Make sure vim deletes 4 spaces when backspacing indentation
set softtabstop=4

" Use auto-indent
set autoindent

" Better syntax highlighting
let python_highlight_all=1

" Smart indentation
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Highlight characters after 80 characters on a line
highlight LongLine guibg=red ctermbg=red
call matchadd('LongLine', '\%>80v.\+')

" Highlight tabs
highlight TabsAreBad guibg=blue ctermbg=blue
call matchadd('TabsAreBad', '\t')

