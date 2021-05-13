
" ======> Start of vim-map-leader ============================================
let g:leaderMenu = {
            \'name':  "Shortcut Menu",
            \'<SPACE> Enter':  ['Clear search'],
            \'<SPACE> a':  ['Calculate equation'],
            \'<SPACE> f':  ['Advanced find'],
            \'<SPACE> o':  ['Open folds'],
            \'<SPACE> q':  ['Close win below'],
            \'<SPACE> /':  ['Open terminal'],
            \'<SPACE> rc': ['Edit nvim config'],
            \'<SPACE> dw':  ['Remove adj. dup. words'],
            \'<SPACE> tt':  ['spc to tabs'],
            \'<SPACE> *2':  ['Find <++>'],
            \'<SPACE> sc':  ['Toggle spell-check'],
            \'<SPACE> gf':  ['Fold unchanged'],
            \'<SPACE> g-':  ['Previous hunk'],
            \'<SPACE> g=':  ['Next Hunk'],
            \'<SPACE> rn':  ['Rename variable'],
            \'<SPACE> tm':  ['Toggle table-mode'],
            \'<SPACE> gi':  ['New .gitignore'],
            \'<SPACE> gy':  ['Toggle focus mode'],
            \'<SPACE> cn':  ['commente the code'],
            \'<SPACE> cu':  ['uncomment the code'],
            \}

nnoremap <silent> ? :call leaderMapper#start() "<Space>"<CR>
let g:leaderMapperWidth = 70
" ======> End ================================================================

" ======> Start of Plug name<=============================================
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" ======> End <================================================================
