
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
            \'coc-lists',
            \'coc-prettier',
            \'coc-pyright',
            \'coc-python',
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
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
function! Show_documentation()
    call CocActionAsync("highlight")
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
        execute 'normal srv'
    elseif(coc#rpc#ready())
        call CocAction('doHover')
        execute 'normal srv'
    else 
        exec "!" . &keywordprg . " " . expand('<cword>')
    endif
endfunction
nnoremap M :call Show_documentation()<CR>

autocmd CursorHold * silent call CocActionAsync("highlight")
augroup CocTsGroup 
    autocmd!
    " Setup formatexpr specified filetype
    autocmd FileType typescripe,json setl formatexpr=CocAction('formatSelected')
    " update signature on help jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<CR>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

" Open up coc-commands
nnoremap <c-c> :CocCommand<CR>
" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap kc <Plug>(coc-classobj-i)
omap kc <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
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

" coctodolist
nnoremap <leader>tn :CocCommand todolist.create<CR>
nnoremap <leader>tl :CocList todolist<CR>
nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <silent> C :CocList tasks<CR>
" coc-snippets
imap <M-/> <Plug>(coc-snippets-expand)
vmap <M-/> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-n>'
let g:coc_snippet_prev = '<c-e>'
imap <C-e> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'ancion'

" --------------------------------------------------------------------------------------
" ======> End }}}
"
" vim: set foldmethod=marker foldlevel=0:
