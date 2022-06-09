
" ======> Start of Coc {{{
" --------------------------------------------------------------------------------------
let g:coc_global_extensions = [
            \'coc-actions',
            \'coc-css',
            \'coc-diagnostic',
            \'coc-explorer',
            \'coc-gitignore',
            \'coc-html',
            \'coc-json',
            \'coc-java',
            \'coc-lists',
            \'coc-lua',
            \'coc-prettier',
            \'coc-pyright',
            \'coc-snippets',
            \'coc-sourcekit',
            \'coc-stylelint',
            \'coc-syntax',
            \'coc-tasks',
            \'coc-todolist',
            \'coc-translator',
            \'coc-tslint-plugin',
            \'coc-tsserver',
            \'coc-vimlsp',
            \'coc-vetur',
            \'coc-yaml',
            \'coc-go',
            \'coc-yank']
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>CheckBackspace() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() 
                        \? coc#_select_confirm()
                        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <c-space> coc#refresh()

nnoremap M :call Show_documentation()<CR>

function! s:CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! Show_documentation()
    call CocActionAsync("highlight")
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif(coc#rpc#ready())
        call CocActionAsync('doHover')
    else 
        exec "!" . &keywordprg . " " .expand('<cword>')
    endif
    execute 'normal srv'
endfunction

autocmd CursorHold * silent call CocActionAsync("highlight")

augroup CocTsGroup
    autocmd!
    " Setup formatexpr specified filetype
    autocmd FileType typescripe,json setl formatexpr=CocAction('formatSelected')
    " update signature on help jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

nnoremap <silent><nowait> <leader>o :<C-u>CocOutline<CR>
nnoremap <silent><nowait> <leader>y :<C-u>CocList -A --normal yank<cr>

nmap <silent> <leader>- <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>= <Plug>(coc-diagnostic-next)

" Open up coc-commands
nnoremap <c-c> :CocCommand<CR>
" Text Objects
xmap kf <Plug>(coc-funcobj-i)
omap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap kc <Plug>(coc-classobj-i)
omap kc <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Useful commands
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <LEADER>e :CocCommand explorer<CR>
" coc-translator
nmap ts <Plug>(coc-translator-p)

xmap <silent> <leader>a <Plug>(coc-codeaction-selected)
nmap <silent> <leader>a <Plug>(coc-codeaction-selected)
vmap <silent> <C-S><CR> <Plug>(coc-format-selected)

" coctodolist
nnoremap <leader>td :CocList diagnostics<CR>
nnoremap <leader>tn :CocCommand todolist.create<CR>
nnoremap <leader>tl :CocList todolist<CR>
nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <silent> C :CocList tasks<CR>
" coc-snippets
imap <A-/> <Plug>(coc-snippets-expand)
vmap <A-/> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-n>'
let g:coc_snippet_prev = '<c-e>'
imap <C-e> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'ancion'

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold   :call CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR     :call CocAction('runCommand', 'editor.action.organizeImport')

" --------------------------------------------------------------------------------------
" ======> End }}}
"
" vim: set foldmethod=marker foldlevel=0:
