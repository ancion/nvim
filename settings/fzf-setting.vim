
" ======> Settings of fzf {{{
" --------------------------------------------------------------------------------------------
noremap <M-f> :Files<CR>
noremap <M-e> :Rg<CR>
"noremap <C-h> :History<CR>
noremap <M-d> :BD<CR>
noremap <M-\> :BTags<CR>
noremap <M-l> :Lines<CR>
noremap <M-b> :Buffers<CR>
noremap <M-h> :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
    redir => list
    silent ls
    redir END
    return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
    execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
            \ 'source': s:list_buffers(),
            \ 'sink*': { lines -> s:delete_buffers(lines) },
            \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
            \ }))

function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.9 } }

" --------------------------------------------------------------------------------------------
" ======> End }}}

" ======> Settings of Far.vim {{{
" --------------------------------------------------------------------------------------------
noremap <LEADER>f :F  **/*<left><left><left><left><left>
let g:far#mapping = {
            \ "replace_undo" : ["u"],
            \ }
" --------------------------------------------------------------------------------------------
" ======> End }}}
" vim: foldmethod=marker foldlevel=0:

