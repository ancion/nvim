
" ======> Settings of  GitGutter {{{
" ----------------------------------------------------------------------------
"let g:gitgutter_signs = 0
let g:gitgutter_sign_allow_clobber             = 1
let g:gitgutter_map_keys                       = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating           = 1
let g:gitgutter_sign_added                     = '░'
let g:gitgutter_sign_modified                  = '░'
let g:gitgutter_sign_removed                   = '░'
let g:gitgutter_sign_removed_first_line        = '▔'
let g:gitgutter_sign_modified_removed          = '▒'
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
autocmd BufWritePost * GitGutter
nnoremap <leader>gf :GitGutterFold<CR>
"nnoremap H :GitGutterPreviewHunk<CR>
nnoremap <leader>g- :GitGutterPrevHunk<CR>
nnoremap <leader>g= :GitGutterNextHunk<CR>"
" ----------------------------------------------------------------------------
" ======> End }}}

" ======> Settings of vim-fugitive {{{
" ----------------------------------------------------------------------------
nnoremap gb :Gblame<CR>
" ----------------------------------------------------------------------------
" ======> End }}}

" ======> Settings of fzf-gitignore {{{
" ----------------------------------------------------------------------------
noremap <LEADER>gi :FzfGitignore<CR>
" ----------------------------------------------------------------------------
" ======> End }}}

" ======> Settings of lazygit {{{
" -----------------------------------------------------------------------------
" Open up lazygit
noremap \g :Git<CR>
noremap <leader>gg :tabe<CR>:-tabmove<CR>:term lazygit<CR>
"noremap <c-h> :tabe<CR>:-tabmove<CR>:term ranger<CR>
" -----------------------------------------------------------------------------
" ======> End }}}

" vim: foldmethod=marker foldlevel=0:
