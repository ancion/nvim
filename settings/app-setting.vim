" ======> Start of startify <==================================================
" Open Startify
noremap <LEADER>st :Startify<CR>
" ======> End <================================================================

" ======> Settings of lazygit {{{
" -----------------------------------------------------------------------------
" Open up lazygit
noremap \g :Git<CR>
noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>
"noremap <c-h> :tabe<CR>:-tabmove<CR>:term ranger<CR>
" -----------------------------------------------------------------------------
" ======> End }}}

" ======> Start of figlet <====================================================
" user tx to make ASII art
map tx :r !figlet
" ======> End <================================================================

" ======> Start of Anzu ======================================================
set statusline=%{anzu#search_status()}
nnoremap = n
nnoremap - N
" ======> End ================================================================

" ======> Start of AsyncTasks ================================================
let g:asyncrun_open = 6
" ======> End ================================================================

" ======>  Start of goyo  ====================================================
map <LEADER>gy :Goyo<CR>
" ======> End ================================================================

" ======> Start of vim-after-object ==========================================
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
" ======> End ================================================================

" ======> Settings of AutoFormat {{{
" ----------------------------------------------------------------------------
nnoremap \f :Autoformat<CR>
let g:formatdef_custom_js = '"js-beautify -t"'
let g:formatters_javascript = ['custom_js']
au BufWrite  *.js :Autoformat
" ------------------------------------------------------------------------------
" ====== End }}}
"
" ======> Settings of Bullets.vim {{{
" ------------------------------------------------------------------------------
"let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
            \ 'markdown',
            \ 'text',
            \ 'gitcommit',
            \ 'scratch'
            \]
" ------------------------------------------------------------------------------
" ====== End }}}


" ======> Start of start a new terminal<=============================================
" Open a new instance of st with the cwd
noremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'alacritty'<CR><C-\><C-N>:q<CR>
" ======> End <================================================================


" ======> Start of emmet<=============================================
" enable all funtion in all mode
let g:user_emmet_mode='i'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" To remap the default<C-Y> leader
let g:user_emmet_leader_key='<C-m>'
" ======> End <================================================================


" ======> Start of vim-easy-align ============================================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" ======> End ================================================================

" ======> Start of vim-illuminate ============================================
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl
" ======> End ================================================================

" ======> Start of vim-rooter ================================================
let g:rooter_patterns = ['__vim_project_root', '.git/']
" ======> End ================================================================


" ======> Start of suda.vim ==================================================
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%
" ======> End ================================================================



" ======> Start of vim-subversive ============================================
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
" ======> End ================================================================

" ======> Settings of vim-visual-multi  {{{
" -----------------------------------------------------------------------------
"let g:VM_theme             = 'iceblue'
"let g:VM_default_mappings = 0
let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
let g:VM_maps['Find Under']         = '<C-k>'
let g:VM_maps['Find Subword Under'] = '<C-k>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-n>'
let g:VM_maps["Undo"]               = 'u'
let g:VM_maps["Redo"]               = '<C-r>'
" -----------------------------------------------------------------------------
" ======> End }}}

" ======> Settings of vista {{{
" -----------------------------------------------------------------------------
noremap <LEADER>v :Vista coc<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
            \   "function": "\uf794",
            \   "variable": "\uf71b"}
function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
" -----------------------------------------------------------------------------
" ======> End  }}}

" ======> Settings of fastfold {{{
" -----------------------------------------------------------------------------
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'ze', 'zu']
let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1
" -----------------------------------------------------------------------------
" ======> End }}}

" ======> Start of vim-calc ==================================================
"noremap <LEADER>a :call Calc()<CR>
" ======> End ================================================================


" ======> Start of context.vim ===============================================
"let g:context_add_mappings = 0
"noremap <leader>ct :ContextToggle<CR>
" ======> End ================================================================


" ======> Start of CTRLP (Dependency for omnisharp) ==========================
"let g:ctrlp_map = ''
"let g:ctrlp_cmd = 'CtrlP'
" ======> End ================================================================

" ======> Start of nerdTree ==================================================
"map <C-n> :NERDTreeToggle<CR>
" ======> End=================================================================

" ======> Settings of vim-multiple-cursor {{{
" ----------------------------------------------------------------------------
"let g:multi_cursor_use_default_mapping = 0
"let g:multi_cursor_start_word_key = '<c-k>'
"let g:multi_cursor_select_all_word_key = '<a-k>'
"let g:multi_cursor_start_key = 'g<c-k>'
"let g:multi_cursor_select_all_key = 'g<a-k>'
"let g:multi_cursor_next_key = '<c-k>'
"let g:multi_cursor_prev_key = '<c-p>'
"let g:multi_cursor_skip_key = '<C-s>'
"let g:multi_cursor_quit_key = '<Esc>'
" ----------------------------------------------------------------------------
" ======> End }}}

" ======> Settings of reply.vim {{{
" ----------------------------------------------------------------------------
"noremap <LEADER>rp :w<CR>:Repl<CR><C-\><C-N><C-w><C-h>
"noremap <LEADER>rs :ReplSend<CR><C-w><C-l>a<CR><C-\><C-N><C-w><C-h>
"noremap <LEADER>rt :ReplStop<CR>
" ----------------------------------------------------------------------------
" ======> End }}}
"
" vim: foldmethod=marker foldlevel=0:
"
