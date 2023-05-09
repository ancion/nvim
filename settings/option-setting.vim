
" ====================
" === Editor Setup ===
" ====================

let &t_ut=''
set autochdir

" ===
" === Editor behavior
" ===
filetype indent on
filetype plugin on
syntax on
set hidden
set number
set relativenumber
set cursorline
set cursorcolumn
set cmdheight=1
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
" set list
" set listchars=tab:\|\ ,trail:▫
set scrolloff=10
set timeoutlen=300
set pumheight=20
set pumblend=10
"set notimeout
set viewoptions=cursor,folds,slash,unix
set nowrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set laststatus=3
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast                " should make scrolling faster
set lazyredraw             " same as above
set visualbell
set mouse=a

"set guifont=Fira\ Code:h16
"set guifont=SauceCodePro\ Nerd\ Font:h14
"set guifont=Source\ Code\ Variable:h20
set guifont=FiraCode\ Nerd\ Font\ Mono:h12

set colorcolumn=100
set updatetime=100
set virtualedit=block

" front UI file indent tab size
augroup UIFileIndent
    autocmd!
    autocmd FileType javascript*,typescript*,css,html,xml,json,vue setlocal ai
    autocmd FileType javascript*,typescript*,css,html,xml,json,vue setlocal tabstop=2
    autocmd FileType javascript*,typescript*,css,html,xml,json,vue setlocal softtabstop=2
    autocmd FileType javascript*,typescript*,css,html,xml,json,vue setlocal shiftwidth=2
augroup end

" WSL yank to system clipboard
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip) 
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup END
endif

" keep laest postion when next enter this file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h


" ===
" ===Basic Mapping
" ===
let mapleader=" "

set clipboard=unnamedplus
" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

" copy wsl nvim clipboard content to Windows clipboard
" vnoremap p[ :!clip.exe <CR>u

"set g:clipboard=xclip

" Indentation
nnoremap < <<
nnoremap > >>



" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizin g windows)

" Ctrl + K or E will move up/down the view port without moving the cursor
noremap <C-K> 5<C-y>
noremap <C-J> 5<C-e>


" J/K keys for 4 times j/k (faster navigation)
noremap <silent> K 5k
noremap <silent> J 5j

vnoremap <A-k> :move '<-2<CR>gv-gv'
vnoremap <A-j> :move '>+1<CR>gv-gv'

" H key: go to the start of the line
noremap <silent> H 0
" L key: go to the end of the line
noremap <silent> L $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" Save & quit
noremap Q :q<CR>
noremap S :w<CR>

" Disable the default s key
noremap s <nop>

" ===
" === Insert Mode Cursor Movement
" ===
inoremap <C-a> <ESC>A
" change jj to the <ESC>
imap jj <ESC>
" go to next line in insert mode with cursor middle in line
inoremap <C-o> <ESC>o

inoremap <expr> <C-j> coc#pum#visible() 
            \? coc#pum#next(1) 
            \: pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> coc#pum#visible() 
            \? coc#pum#prev(1) 
            \: pumvisible() ? "\<C-p>" : "\<C-k>"

" ===
" === Command Mode Cursor Movement
" ===
cnoremap <C-h> <Home>
cnoremap <C-l> <End>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>

" ===
" === Window management
" ===
" use <space>+new arrow keys for moving the cursor around windows
noremap <leader>w <C-w>w
noremap <leader>k <C-w>k
noremap <leader>j <C-w>j
noremap <leader>h <C-w>h
noremap <leader>l <C-w>l

" split the screens to up(horizontal) down(horizontal) left(vertical) right(vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>


" Place the screen up and down
noremap sx <C-w>t<C-w>K
" Place the teo screen side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srx <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H


" ===
" === Tab management
" ===
" Create a new tab with tj
noremap tj :tabe<CR>
" Move around tabs with th and tl
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tmh and tml
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>

" ===
" === other useful stuff
" ===

" Search
noremap <leader><CR> :nohlsearch<CR>

" - = as N n
noremap <leader>- :lN<CR>
noremap <leader>= :lne<CR>

" find and replace
noremap \s :%s//g<left><left>

" Adjacent duplicate words
noremap <leader>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
nnoremap <leader>tt :%s/    /\t/g
vnoremap <leader>tt :s/    /\t/g

" Spelling Check with <space>sc
noremap <leader>sc :set spell!<CR>

noremap <C-c> zz

" Folding
noremap <silent> <leader>o za

" Press space twice to jump to the next '<++>' and edit it
noremap <leader><leader> <Esc>/<++><CR>:nohlsearch<CR>c4l

" press <SPACE>+q to close the window below the current window
noremap <leader>q <C-w>j:q<CR>

" open init.vim filre in anytime
noremap <leader>rc :e $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>
