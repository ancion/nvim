" ======> Start of floaterm<=============================================
let g:floaterm_width     = 0.8
let g:floaterm_height    = 0.8
let g:floaterm_winblend  = 10
let g:floaterm_autoclose = 0
let g:floaterm_wintype   = 'floating'
let g:floaterm_open_command = "vsplit"
let g:floaterm_title     = '🐋···Floaterm($1/$2)···💦'
noremap R :FloatermNew ranger<CR>
" ======> End <================================================================


" Opening a terminal window
" noremap <LEADER>/ :term<CR>
" noremap <LEADER>/ :set splitbelow<CR>:split<CR>:term<CR>
noremap <LEADER>/ :FloatermNew<CR>
"noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>
