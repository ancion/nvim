
" ======> Settings of MarkdownPreview {{{
" ------------------------------------------------------------------------------
let g:mkdp_path_to_chrome     = 'msedge'
let g:mkdp_auto_start         = 0
let g:mkdp_auto_close         = 1
let g:mkdp_refresh_slow       = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world  = 1
let g:mkdp_open_ip            = ''
let g:mkdp_port               = '9039'
let g:mkdp_echo_preview_url   = 1
let g:mkdp_browserfunc        = ''
let g:mkdp_preview_options = {
            \ 'mkit': {},
            \ 'katex': {},
            \ 'uml': {},
            \ 'maid': {},
            \ 'disable_sync_scroll': 0,
            \ 'sync_scroll_type': 'middle',
            \ 'hide_yaml_meta': 1
            \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_page_title = '「${name}」'
nmap <C-p> <Plug>MarkdownPreviewToggle
" ------------------------------------------------------------------------------
" ======> End }}}

" ======> Settings of vim-markdown-toc {{{
" ------------------------------------------------------------------------------
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
" ------------------------------------------------------------------------------
" ======> End }}}

" ======> Settings of markdown-preview {{{ 
" ------------------------------------------------------------------------------
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell
" ------------------------------------------------------------------------------
" ======> End }}}

" ======> Settings of vim-table-mode {{{
" ------------------------------------------------------------------------------
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'
" ------------------------------------------------------------------------------
" ======> End }}}
"
" vim: foldmethod=marker foldlevel=0:
