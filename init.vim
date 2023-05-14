
" =====> PlatForm information {{{
" ------------------------------------------------------------------------------
" this is function return a string representate you computer platform
" like windows or linux or macos
" use this to load different configration file
function! Mysys()
    if has("win32") || has("win64")||has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction
" ------------------------------------------------------------------------------
" ====== End }}}

"====> resolve encoding error {{{
" ------------------------------------------------------------------------------
set encoding=utf-8
set langmenu=zh_CN.utf-8
set fileencodings=utf-8,ucs-bom,cp936,big5,gbk,gb2312,euc-jp,euc-kr,latin-1
if Mysys()=="windows"
    set termencoding=utf-8
    set fileencodings=utf-8,gbk,ucs-bom,cp936
elseif Mysys()=="linux"
    let &termencoding=&encoding
    set fileencodings=utf-8,gbk,ucs-bom,cp936
endif
"
" ------------------------------------------------------------------------------
"======= End }}}

" =====> Function of Run and Complier {{{
" ------------------------------------------------------------------------------
noremap <F58> :call CompileRunGcc()<CR>
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
        exec "FloatermNew python3 %"
        "set splitbelow
        ":sp
        ":term python3 %
    elseif &filetype == 'html'
        "silent! exec "!".g:mkdp_browser." % &"
        silent! exec "FloatermNew live-server"
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'dart'
        "CocCommand flutter.run
        exec "CocCommand flutter.run -d ".g:flutter_default_device
        silent! exec "CocCommand flutter.dev.openDevLog"
    elseif &filetype == 'javascript'
        exec 'FloatermNew node --trace-warnings %'
        "set splitbelow
        ":sp
        ":term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings %
    elseif &filetype == "typescript"
        exec "FloatermNew ts-node %"
    elseif &filetype == 'go'
        exec "FloatermNew go run ."
        "set splitbelow
        ":sp
        ":term go run .
    endif
endfunc

" ------------------------------------------------------------------------------
" ====== End }}}

"=====> Start of Plugin Settings {{{
" ------------------------------------------------------------------------------
if Mysys() == "linux"
    source $HOME/.config/nvim/settings/option-setting.vim
    source $HOME/.config/nvim/settings/unix-load.vim
    source $HOME/.config/nvim/settings/manage-plug.vim
    source $HOME/.config/nvim/settings/dress-setting.vim
    source $HOME/.config/nvim/settings/floaterm-setting.vim
    source $HOME/.config/nvim/settings/fzf-setting.vim
    source $HOME/.config/nvim/settings/git-setting.vim
    source $HOME/.config/nvim/settings/coc-setting.vim
    source $HOME/.config/nvim/settings/app-setting.vim
    source $HOME/.config/nvim/settings/undo-setting.vim
    source $HOME/.config/nvim/settings/debug-setting.vim
    source $HOME/.config/nvim/settings/golang-setting.vim
    source $HOME/.config/nvim/settings/snippet-setting.vim
    source $HOME/.config/nvim/settings/markdown-setting.vim
    " Snippets
    source $HOME/.config/nvim/Ultisnips/md-snippets.vim
    "source $HOME/.config/nvim/settings/omniSharp-setting.vim
    "source $HOME/.config/nvim/settings/bookmark-setting.vim
    "source $HOME/.config/nvim/settings/rnvimr-setting.vim
    source $HOME/.config/nvim/settings/whichkey-setting.vim
    source $HOME/.config/nvim/settings/signature-setting.vim
    source $HOME/.config/nvim/settings/treesitter-setting.vim

elseif Mysys() == "windows"
    source $HOME/AppData/Local/nvim/settings/option-setting.vim
    source $HOME/AppData/Local/nvim/settings/win-load.vim
    source $HOME/AppData/Local/nvim/settings/manage-plug.vim
    source $HOME/AppData/Local/nvim/settings/dress-setting.vim
    source $HOME/AppData/Local/nvim/settings/floaterm-setting.vim
    source $HOME/AppData/Local/nvim/settings/fzf-setting.vim
    source $HOME/AppData/Local/nvim/settings/git-setting.vim
    source $HOME/AppData/Local/nvim/settings/coc-setting.vim
    source $HOME/AppData/Local/nvim/settings/app-setting.vim
    source $HOME/AppData/Local/nvim/settings/undo-setting.vim
    source $HOME/AppData/Local/nvim/settings/debug-setting.vim
    source $HOME/AppData/Local/nvim/settings/golang-setting.vim
    source $HOME/AppData/Local/nvim/settings/snippet-setting.vim
    source $HOME/AppData/Local/nvim/settings/markdown-setting.vim
    " Snippets
    source $HOME/AppData/Local/nvim/Ultisnips/md-snippets.vim
    "source $HOME/AppData/Local/nvim/settings/omniSharp-setting.vim
    "source $HOME/AppData/Local/nvim/settings/bookmark-setting.vim
    "source $HOME/AppData/Local/nvim/settings/rnvimr-setting.vim
    source $HOME/AppData/Local/nvim/settings/whichkey-setting.vim
    source $HOME/AppData/Local/nvim/settings/signature-setting.vim
    source $HOME/AppData/Local/nvim/settings/treesitter-setting.vim

endif
" ------------------------------------------------------------------------------
" ============= end }}}
" vim: foldmethod=marker foldlevel=0

exec "nohlsearch"

