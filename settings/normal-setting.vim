
" ======> Function of Run and Complier {{{
" ------------------------------------------------------------------------------
noremap <F22> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        set splitbelow
        exec "!g++ -std=c++11 % -Wall -o %<"
        :sp
        :res -15
        :term ./%<
    elseif &filetype =='java'
        exec 'FloatermNew javac % && echo % | cut -d "." -f1 | xargs java'
        "exec "!javac %"
        "exec "!time java %<"
    elseif &filetype == 'sh'
        exec "FloatermNew bash %"
        ":!time bash %
    elseif &filetype == 'python'
        :FloatermNew python3 %
        "set splitbelow
        ":sp
        ":term python3 %
    elseif &filetype == 'html'
        "silent! exec "!".g:mkdp_browser." % &"
        silent! exec "!live-server % &"
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'dart'
        "CocCommand flutter.run
        exec "CocCommand flutter.run -d ".g:flutter_default_device
        silent! exec "CocCommand flutter.dev.openDevLog"
    elseif &filetype == 'javascript'
        :FloatermNew export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings %
        "set splitbelow
        ":sp
        ":term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings %
    elseif &filetype == 'go'
        :FloatermNew go run .
        "set splitbelow
        ":sp
        ":term go run .
    endif
endfunc

" ------------------------------------------------------------------------------
" ====== End }}}

" =====> PlatForm information {{{
" ------------------------------------------------------------------------------
function! Mysys()
    if has("win32") || has("win64")||has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction
" ------------------------------------------------------------------------------
" ====== End }}}

"=======> resolve encoding error {{{
" ------------------------------------------------------------------------------
set encoding=utf-8
set langmenu=zh_CN.utf-8
set fileencodings=utf-8,ucs-bom,cp936,big5,gbk,gb2312,euc-jp,euc-kr,latin-1
if Mysys()=="windows"
    set termencoding=chinese
    set fileencoding=chinese
elseif Mysys()=="linux"
    let &termencoding=&encoding
    set fileencodings=utf-8,gbk,ucs-bom,cp936
endif
"
" ------------------------------------------------------------------------------
"======= End }}}

"======= local undo and backup file position {{{
" ------------------------------------------------------------------------------
" 
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=~/.config/nvim/tmp/undo,.
endif
" ------------------------------------------------------------------------------
" ====== End }}}

" vim: foldmethod=marker foldlevel=0:

 
