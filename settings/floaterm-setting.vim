" ======> Settings of floaterm {{{
" -----------------------------------------------------------------------------
let g:floaterm_width        = 0.8
let g:floaterm_height       = 0.3
let g:floaterm_winblend     = 10
let g:floaterm_autoclose    = 0
let g:floaterm_wintype      = 'split'
"let g:floaterm_wintype   = 'floating'
let g:floaterm_position     = 'rightbelow'
let g:floaterm_open_command = "vsplit"
let g:floaterm_title        = '   🐋···Floaterm($1/$2)···💦'
let g:floaterm_shell        = 'zsh'
let g:floaterm_borderchars  = "─│─│╭╮╯╰"
noremap R :FloatermNew ranger<CR>

" -----------------------------------------------------------------------------
" ======> End }}}
" vim: foldmethod=marker foldlevel=0:

" Opening a terminal window
" noremap <LEADER>/ :term<CR>
" noremap <LEADER>/ :set splitbelow<CR>:split<CR>:term powershell -NoLogo<CR>
" noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>
noremap <LEADER>` :FloatermToggle<CR>
xnoremap <LEADER>` :FloatermToggle<CR>
"
"vim: foldmethod=marker foldlevel=0:

