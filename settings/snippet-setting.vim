
" ======> Settings of Ultisnips {{{
" ----------------------------------------------------------------------------
let g:tex_flavor = "latex"
inoremap <c-n> <nop>
let g:UltiSnipsExpandTrigger="<A-/>"
let g:UltiSnipsJumpForwardTrigger="<A-/>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"
let g:UltiSnipsSnippetDirectories = [
            \g:setting_dir. '/Ultisnips/',
            \g:setting_dir. '/plugged/vim-snippets/UltiSnips/'
            \]
silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
" ----------------------------------------------------------------------------
" ======> End }}}
"
" vim: foldmethod=marker foldlevel=0:

