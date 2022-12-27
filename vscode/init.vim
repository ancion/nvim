" packadd quickscope

" execute 'luafile ' . stdpath('config') . '/lua/settings.lua'

function! s:manageEditorSize(...)
    let count = a:1
    let to = a:2
    for i in range(1, count ? count : 1)
        call VSCodeNotify(to == 'increase' ? 'workbench.action.increaseViewSize' : 'workbench.action.decreaseViewSize')
    endfor
endfunction

function! s:vscodeCommentary(...) abort
    if !a:0
        let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
        return 'g@'
    elseif a:0 > 1
        let [line1, line2] = [a:1, a:2]
    else
        let [line1, line2] = [line("'["), line("']")]
    endif

    call VSCodeCallRange("editor.action.commentLine", line1, line2, 0)
endfunction

function! s:openVSCodeCommandsInVisualMode()
    normal! gv
    let visualmode = visualmode()
    if visualmode == "V"
        let startLine = line("v")
        let endLine = line(".")
        call VSCodeNotifyRange("workbench.action.showCommands", startLine, endLine, 1)
    else
        let startPos = getpos("v")
        let endPos = getpos(".")
        call VSCodeNotifyRangePos("workbench.action.showCommands", startPos[1], endPos[1], startPos[2], endPos[2], 1)
    endif
endfunction

function! s:openWhichKeyInVisualMode()
    normal! gv
    let visualmode = visualmode()
    if visualmode == "V"
        let startLine = line("v")
        let endLine = line(".")
        call VSCodeNotifyRange("whichkey.show", startLine, endLine, 1)
    else
        let startPos = getpos("v")
        let endPos = getpos(".")
        call VSCodeNotifyRangePos("whichkey.show", startPos[1], endPos[1], startPos[2], endPos[2], 1)
    endif
endfunction

" Better Navigation
nnoremap <silent> <C-j> <cmd>call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <C-j> <cmd>call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> <cmd>call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-k> <cmd>call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> <cmd>call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-h> <cmd>call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> <cmd>call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <C-l> <cmd>call VSCodeNotify('workbench.action.navigateRight')<CR>

nnoremap <silent> za <cmd>call VSCodeNotify('editor.toggleFold')<CR>;
nnoremap <silent> gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>

" Bind C-/ to vscode commentary since calling from vscode produces double comments due to multiple cursors
xnoremap <expr> <C-/> <SID>vscodeCommentary()
nnoremap <expr> <C-/> <SID>vscodeCommentary() . '_'

nnoremap <silent> <C-w>_ :<C-u>call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>

nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
xnoremap <silent> <Space> :<C-u>call <SID>openWhichKeyInVisualMode()<CR>

xnoremap <silent> <C-P> :<C-u>call <SID>openVSCodeCommandsInVisualMode()<CR>

xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

" Simulate same TAB behavior in VSCode
nmap <Tab> :Tabnext<CR>
nmap <S-Tab> :Tabprev<CR>
noremap H 0 
noremap L $
noremap s <nop>

noremap K 5k
noremap J 5j

" copy still end of line
nnoremap Y y$
" cosy to system clipboard
vnoremap Y "+y
