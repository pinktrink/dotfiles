highlight ConsoleLog ctermbg=226 ctermfg=0 cterm=bold guibg=226 guifg=0

call matchadd('ConsoleLog', '\<console\.log\>')

highlight DebuggerInstruction ctermbg=226 ctermfg=0 cterm=bold guibg=226 guifg=0

call matchadd('DebuggerInstruction', '\<debugger\>\;\=')
