highlight OutputOrHaltCommands ctermbg=226 ctermfg=0 cterm=bold guibg=#ffff00 guifg=#000000

call matchadd('OutputOrHaltCommands', '\<\(echo\|print\|print_r\|var_dump\|var_export\|header\|die\|exit\|__halt_compiler\)\>')
