" ====================
" === Editor Setup ===
" ====================

let &t_ut=''
set autochdir

" ===
" === Editor behavior
" ===
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
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=5
set timeoutlen=500
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
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
set mouse=a
"set guifont=Fira\ Code:h16

set colorcolumn=100
set updatetime=100
set virtualedit=block
filetype indent on
"filetype plugin on
autocmd FileType javascript,css,html,xml,json setlocal ai
autocmd FileType javascript,css,html,xml,josn setlocal tabstop=2
autocmd FileType javascript,css,html,xml,json setlocal softtabstop=2
autocmd FileType javascript,css,html,xml,json setlocal shiftwidth=2

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" ===
" ===Basic Mapping
" ===
let mapleader=" "

" Save & quit
noremap Q :q<CR>
noremap S :w<CR>

set clipboard=unnamedplus
" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

" copy wsl nvim clipboard content to Windows clipboard
vnoremap p[ :!clip.exe <CR>u

"set g:clipboard=xclip

" Indentation
nnoremap < <<
nnoremap > >>

noremap <C-c> zz


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

vnoremap <M-k> :move '<-2<CR>gv-gv'
vnoremap <M-j> :move '>+1<CR>gv-gv'

" H key: go to the start of the line
noremap <silent> H 0
" L key: go to the end of the line
noremap <silent> L $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" Disable the default s key
noremap s <nop>

" ===
" === Insert Mode Cursor Movement
" ===
inoremap <C-a> <ESC>A
" change jj to the <ESC>
imap jj <ESC>
" go to next line in insert mode with cursor middle in line
inoremap <C-j> <ESC>o


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
noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l

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

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" press <SPACE>+q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>

" Folding
noremap <silent> <LEADER>o za

" open init.vim filre in anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
nnoremap <LEADER>tt :%s/    /\t/g
vnoremap <LEADER>tt :s/    /\t/g



" find and replace
noremap \s :%s//g<left><left>


" ===================== Start of Plugin Settings =============================
if !exists('g:vscode') 
    source $HOME/.config/nvim/settings/fisrt-load.vim
    source $HOME/.config/nvim/settings/manage-plug.vim
    source $HOME/.config/nvim/settings/dress-setting.vim
    source $HOME/.config/nvim/settings/floaterm-setting.vim
    source $HOME/.config/nvim/settings/normal-setting.vim
    source $HOME/.config/nvim/settings/fzf-setting.vim
    source $HOME/.config/nvim/settings/git-setting.vim
    source $HOME/.config/nvim/settings/coc-setting.vim
    source $HOME/.config/nvim/settings/app-setting.vim
    source $HOME/.config/nvim/settings/undo-setting.vim
    source $HOME/.config/nvim/settings/debug-setting.vim
    source $HOME/.config/nvim/settings/golang-setting.vim
    source $HOME/.config/nvim/settings/snippet-setting.vim
    source $HOME/.config/nvim/settings/markdown-setting.vim
    "source $HOME/.config/nvim/settings/omniSharp-setting.vim
    "source $HOME/.config/nvim/settings/rnvimr-setting.vim
    source $HOME/.config/nvim/settings/showkey-setting.vim
    source $HOME/.config/nvim/settings/signature-setting.vim
    source $HOME/.config/nvim/settings/bookmark-setting.vim
elseif exists('g:vscode')

endif


exec "nohlsearch"

