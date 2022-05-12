
" ======> Start of vimspector {{{
" -----------------------------------------------------------------------------------------
let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
    " has to be a function to avoid the extra space fzf#run insers otherwise
    execute '0r ' .g:setting_dir. '/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
            \   'source': 'ls -1 ' .g:setting_dir. '/sample_vimspector_json',
            \   'down': 20,
            \   'sink': function('<sid>read_template_into_buffer')
            \ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
noremap <F17> :VimspectorReset<CR>
sign define vimspectorBP         text=🟢 texthl=Normal
sign define vimspectorBPDisabled text=🔴 texthl=Normal
sign define vimspectorPC         text=👉 texthl=SpellBad
" -----------------------------------------------------------------------------------------
" ======> End  }}}
"
" vim: foldmethod=marker foldlevel=0:

