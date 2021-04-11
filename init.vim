"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @ancion


" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===> Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" =============================================================================
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
    let has_machine_specific_file = 0
    silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===
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
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=~/.config/nvim/tmp/undo,.
endif
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

" ===
" ===Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'


" ===
" ===Basic Mapping
" ===
let mapleader=" "

" Save & quit
noremap Q :q<CR>
noremap S :w<CR>
" open init.vim filre in anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>


" Open Startify
noremap <LEADER>st :Startify<CR>

set clipboard=unnamedplus
" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

" copy wsl nvim clipboard content to Windows clipboard
vnoremap p[ :!clip.exe <CR>u

"set g:clipboard=xclip
"let g:clipboard = {
"            \   'name': 'myClipboard',
"            \   'copy': {
"            \      '+': 'tmux load-buffer -',
"            \      '*': 'tmux load-buffer -',
"            \    },
"            \   'paste': {
"            \      '+': 'tmux save-buffer -',
"            \      '*': 'tmux save-buffer -',
"            \   },
"            \   'cache_enabled': 1,
"            \}

" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
nnoremap <LEADER>tt :%s/    /\t/g
vnoremap <LEADER>tt :s/    /\t/g

" Folding
noremap <silent> <LEADER>o za

" Open up lazygit
noremap \g :Git<CR>
noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>
"noremap <c-h> :tabe<CR>:-tabmove<CR>:term ranger<CR>

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
" press <SPACE>+q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>

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

" user tx to make ASII art
map tx :r !figlet

" ===
" === Markdown Settings
" ===
" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell

" ===
" === Other useful stuff
" ===

" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>

" Opening a terminal window
" noremap <LEADER>/ :term<CR>
" noremap <LEADER>/ :set splitbelow<CR>:split<CR>:term<CR>
noremap <LEADER>/ :FloatermNew<CR>
"noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>


noremap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" find and replace
noremap \s :%s//g<left><left>

" ===
" === with this function you can comile and run you code easily
" ===
" Compile function
noremap r :call CompileRunGcc()<CR>
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
        silent! exec "!".g:mkdp_browser." % &"
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


"===
"===PlatForm information
"===
function! Mysys()
    if has("win32") || has("win64")||has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction

"===
"=== resolve encoding error
"===
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936,big5,gbk,gb2312,euc-jp,euc-kr,latin-1
if Mysys()=="windows"
    set termencoding=chinese
    set fileencoding=chinese
elseif Mysys()=="linux"
    let &termencoding=&encoding
    set fileencodings=utf-8,gbk,ucs-bom,cp936
endif
"===
"===unnormal character
"===
"if exists("&ambiwidth")
"set ambiwidth=double
"endif

set langmenu=zh_CN.utf-8
"language messages zh_cn.utf-8

call plug#begin('~/.config/nvim/plugged')
"===========================================================================
"===First of all we should put some basic plug to apply ourself properties==
"===========================================================================

Plug 'tiagofumo/dart-vim-flutter-layout'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'KabbAmine/vCoolor.vim'
"Plug 'pechorin/any-jump.vim'
Plug 'airblade/vim-rooter'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

"=============================================================================
"=== There is a calculate tool of the theniceboy self developed,just for Test=
"=============================================================================

"Plug 'theniceboy/vim-calc'

"=============================================================================
"======== Pretty Dress  ==> just give a little of color to the IDE============
"=============================================================================

"Plug 'ajmwagar/vim-deus
Plug 'theniceboy/vim-deus'
Plug 'connorholyday/vim-snazzy'
"Plug 'arzg/vim-colors-xcode'
"Plug 'rakr/vim-one'
"Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
"Plug 'mhartington/oceanic-next'
"Plug 'kristijanhusak/vim-hybrid-material'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'liuchengxu/space-vim-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'theniceboy/eleline.vim'
Plug 'kyoz/purify', { 'rtp': 'vim'  }
Plug 'bling/vim-bufferline'

"=============================================================================
"======> Genreal Highlighter <=======================
"=============================================================================

"Plug 'jaxbot/semantic-highlight.vim'
Plug 'chrisbra/Colorizer' " Show colors with :ColorHighlight
Plug 'dracula/vim',{'as':'dracula'}
Plug 'RRethy/vim-illuminate'
"Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase'  }

" ============================================================================
" =====> Navigation WithinBuffer <====================
" ============================================================================
Plug 'liuchengxu/vista.vim'

"=============================================================================
"======> Undo Tree <==================
"=============================================================================

Plug 'mbbill/undotree'

"=============================================================================
"======> DUBUGGER  TOOL <===================
"=============================================================================

" Debugger for python
Plug 'puremourning/vimspector', {'do': './install_gadget.py  --enable-python --enable-go --enable-bash --force-enable-node --force-enable-chrome'}

"=============================================================================
"======> AutoComplete tool <=======================================
"=============================================================================

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/tmux-complete.vim'

" Formatter
Plug 'Chiel92/vim-autoformat'

"=============================================================================
"======> Let me find what I wantted faster <========================
"=============================================================================

" File navigation
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf.vim'
"Plug 'yuki-ycino/fzf-preview.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'kevinhwang91/rnvimr'

"=============================================================================
"======> Snippets <============================
"=============================================================================

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"=============================================================================
"======>  Markdown <=========================
"=============================================================================

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown'] }
Plug 'theniceboy/bullets.vim'

"=============================================================================
"======> Git related <======================
"=============================================================================

" Git
Plug 'tpope/vim-fugitive'
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'

"=============================================================================
"======> HTML, CSS, JavaScript, PHP, JSON, etc.
"=============================================================================
Plug 'elzr/vim-json'
"Plug 'hail2u/vim-css3-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
"Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'jaxbot/browserlink.vim'
Plug 'mattn/emmet-vim'
Plug 'posva/vim-vue'
"=============================================================================
"======> Go <=====================
"=============================================================================

" Go
Plug 'fatih/vim-go' , { 'do': ':GoUpdateBinaries', 'for': ['go', 'vim-plug'] }

"=============================================================================
"======> C# <====================
"=============================================================================

" CSharpS
"Plug 'OmniSharp/omnisharp-vim'
"Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency

"=============================================================================
"======> Python <===========
"=============================================================================

" Python
"Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }

"=============================================================================
"======> Tex  <========
"=============================================================================

" Tex
" Plug 'lervag/vimtex'

"=============================================================================
"======> Dark  <================
"=============================================================================

" Flutter
"Plug 'dart-lang/dart-vim-plugin'
"Plug 'thosakwe/vim-flutter'

"=============================================================================
"======> Swift <===============
"=============================================================================

" Swift
"Plug 'keith/swift.vim'

"=============================================================================
"======>
"=============================================================================

" Other filetypes
Plug 'jceb/vim-orgmode', {'for': ['vim-plug', 'org']}

"=============================================================================
"======> Editor Enhancement
"=============================================================================

" Editor Enhancement
"Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi'
Plug 'preservim/nerdcommenter' " in <space>cn to comment a line
Plug 'theniceboy/antovim' " gs to switch
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
Plug 'junegunn/vim-after-object' " da= to delete what's after =
Plug 'junegunn/vim-easy-align' " gaip= to align the = in paragraph,
Plug 'Konfekt/FastFold'
"Plug 'junegunn/vim-peekaboo'
"Plug 'wellle/context.vim'
Plug 'svermeulen/vim-subversive'
Plug 'theniceboy/argtextobj.vim'
Plug 'rhysd/clever-f.vim'

" Input Method Autoswitch
Plug 'rlue/vim-barbaric' " slowing down vim-multiple-cursors

"=============================================================================
"======> Other Tool <=====
"=============================================================================

" For general writing
Plug 'junegunn/goyo.vim'
"Plug 'reedes/vim-wordy'
"Plug 'ron89/thesaurus_query.vim'

" Bookmarks
Plug 'MattesGroeger/vim-bookmarks'

" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }
Plug 'osyo-manga/vim-anzu'

" Documentation
"Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc

" Vim Applications
Plug 'makerj/vim-pdf'
Plug 'theniceboy/vim-leader-mapper'
"Plug 'liuchengxu/vim-clap'
"Plug 'jceb/vim-orgmode'
Plug 'voldikss/vim-floaterm'
" This plug can show you a list files recently opened when you start nvim
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vim-which-key'

" Other visual enhancement
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-xtabline'
Plug 'wincent/terminus'
Plug 'kshenoy/vim-signature'
Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite"


" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'roxma/nvim-yarp'
"Plug 'rbgrouleff/bclose.vim' " For ranger.vim

call plug#end()

" ============================================================================
" ======> Dress up my vim
" ============================================================================
set termguicolors " enable true colors support

"let g:space_vim_transp_bg = 1
"colorscheme space_vim_theme

"colorscheme snazzy
"let g:SnazzyTransparent = 1
set background=dark

"colorscheme dracula
"colors deus
color purify
"color gruvbox

"color one
"color ayu
"color xcodelighthc

"let ayucolor="light"
"let ayucolor="mirage"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1
let g:airline_theme = 'night_owl'

hi NonText ctermfg = gray guifg  = grey10
hi NonText ctermfg = Black guifg = black10
hi normal ctermfg  = 252 ctermbg = none

" set ruby_host_prog
let g:ruby_host_prog = 'rvm system do neovim-ruby-host'
" ===================== Start of Plugin Settings =============================


" ======> Start of Anzu ======================================================
set statusline=%{anzu#search_status()}
nnoremap = n
nnoremap - N
" ======> End ================================================================


" ======> Start of AutoFormat ================================================
nnoremap \f :Autoformat<CR>
let g:formatdef_custom_js = '"js-beautify -t"'
let g:formatters_javascript = ['custom_js']
au BufWrite  *.js :Autoformat
" ======> End ================================================================


" ======> Start of vim-after-object ==========================================
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
" ======> End ================================================================


" ======> Start of AsyncTasks ================================================
let g:asyncrun_open = 6
" ======> End ================================================================


" ======>Start of Bullets.vim ===============================================
"let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
            \ 'markdown',
            \ 'text',
            \ 'gitcommit',
            \ 'scratch'
            \]
" ======> End ================================================================


" ======> Start of vim-bookmarks =============================================
let g:bookmark_no_default_key_mappings = 1
nmap mt <Plug>BookmarkToggle
nmap ma <Plug>BookmarkAnnotate
nmap ml <Plug>BookmarkShowAll
nmap mj <Plug>BookmarkNext
nmap mk <Plug>BookmarkPrev
nmap mC <Plug>BookmarkClear
nmap mX <Plug>BookmarkClearAll
nmap mu <Plug>BookmarkMoveUp
nmap me <Plug>BookmarkMoveDown
nmap <Leader>g <Plug>BookmarkMoveToLine
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_highlight_lines = 1
let g:bookmark_manage_per_buffer = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_center = 1
let g:bookmark_auto_close = 1
let g:bookmark_location_list = 1
" ======> End ================================================================


" ======> Start of Colorizer =================================================
let g:colorizer_syntax = 1
" ======> End ================================================================


" ======> Start of vim-calc ==================================================
"noremap <LEADER>a :call Calc()<CR>
" ======> End ================================================================


" ======> Start of context.vim ===============================================
"let g:context_add_mappings = 0
"noremap <leader>ct :ContextToggle<CR>
" ======> End ================================================================

" ======> Start of nvim-colorizer.lua ========================================
lua require'colorizer'.setup()
" ======> End ================================================================

" ======> Start of Coc =======================================================
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
inoremap <silent><expr> <c-o> coc#refresh()
function! Show_documentation()
    call CocActionAsync("highlight")
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
        execute 'normal srv'
    else
        call CocAction('doHover')
        execute 'normal srv'
    endif
endfunction
nnoremap <LEADER>m :call Show_documentation()<CR>

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
nmap tt :CocCommand explorer<CR>
" coc-translator
nmap ts <Plug>(coc-translator-p)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" coctodolist
nnoremap <leader>tn :CocCommand todolist.create<CR>
nnoremap <leader>tl :CocList todolist<CR>
nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <silent> C :CocList tasks<CR>
" coc-snippets
imap <M-/> <Plug>(coc-snippets-expand)
vmap <M-/> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-e>'
let g:coc_snippet_prev = '<c-n>'
imap <C-e> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'ancion'

" ======> End ================================================================


" ======> Start of CTRLP (Dependency for omnisharp) ==========================
"let g:ctrlp_map = ''
"let g:ctrlp_cmd = 'CtrlP'
" ======> End ================================================================


" ======> Start of eleline.vim ===============================================
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:eleline_powerline_fonts = 1
" ======> End ================================================================

" ======> Start of emmet<=============================================
" enable all funtion in all mode
let g:user_emmet_mode='i'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" To remap the default<C-Y> leader
let g:user_emmet_leader_key='<C-m>'
" ======> End <================================================================


" ======> Start of vim-easy-align ============================================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" ======> End ================================================================


" ======> Start of vim-fugitive ==============================================
nnoremap gb :Gblame<CR>
" ======> End ================================================================


" ======> Start of fzf-gitignore =============================================
noremap <LEADER>gi :FzfGitignore<CR>
" ======> End ================================================================


" ======> Start of Far.vim ===================================================
noremap <LEADER>f :F  **/*<left><left><left><left><left>
let g:far#mapping = {
            \ "replace_undo" : ["u"],
            \ }
" ======> End ================================================================


" ======> Start of floaterm<=============================================
let g:floaterm_width     = 0.8
let g:floaterm_height    = 0.8
let g:floaterm_winblend  = 10
let g:floaterm_autoclose = 0
let g:floaterm_wintype   = 'floating'
let g:floaterm_open_command = "vsplit"
let g:floaterm_title     = '🐋···Floaterm($1/$2)···💦'
noremap R :FloatermNew ranger<CR>
" ======> End <================================================================


" ======> Start of fzf=======================================================
set rtp+=/usr/bin/fzf
"set rtp+=~/.fzf/bin/fzf
"set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
noremap <C-f> :Files<CR>
noremap <C-e> :Rg<CR>
"noremap <C-h> :History<CR>
noremap <C-d> :BD<CR>
noremap <C-\> :BTags<CR>
noremap <C-l> :Lines<CR>
noremap <C-w> :Buffers<CR>
noremap <leader>; :History:<CR>

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

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.7 } }

" ======> End ================================================================


" ======> Start of fastfold ==================================================
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'ze', 'zu']
let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1
" ======> End ================================================================


" ======> Start of  GitGutter ================================================
"let g:gitgutter_signs = 0
let g:gitgutter_sign_allow_clobber = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
"nnoremap H :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>"
" ======> End ================================================================


" ======> Start of vim-go ====================================================
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_command = "goimports"
" ======> End ================================================================


" ======>  Start of goyo  ====================================================
map <LEADER>gy :Goyo<CR>
" ======> End ================================================================


" ======> Start of vim-illuminate ============================================
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl
" ======> End ================================================================


" ======> Start of jsx =======================================================
let g:vim_jsx_pretty_colorful_config = 1
" ======> End ================================================================


" ======>Start of MarkdownPreview ============================================
let g:mkdp_path_to_chrome = 'msedge'
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
            \ 'mkit': {},
            \ 'katex': {},
            \ 'uml': {},
            \ 'maid': {},
            \ 'disable_sync_scroll': 0,
            \ 'sync_scroll_type': 'middle',
            \ 'hide_yaml_meta': 1
            \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
nmap <C-p> <Plug>MarkdownPreviewToggle
" ======> End ================================================================


" ======> Start of vim-markdown-toc ==========================================
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
" ======> End ================================================================


" ======> Start of vim-multiple-cursor =======================================
"let g:multi_cursor_use_default_mapping = 0
"let g:multi_cursor_start_word_key = '<c-k>'
"let g:multi_cursor_select_all_word_key = '<a-k>'
"let g:multi_cursor_start_key = 'g<c-k>'
"let g:multi_cursor_select_all_key = 'g<a-k>'
"let g:multi_cursor_next_key = '<c-k>'
"let g:multi_cursor_prev_key = '<c-p>'
"let g:multi_cursor_skip_key = '<C-s>'
"let g:multi_cursor_quit_key = '<Esc>'
" ======> End ================================================================

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


" ======> Start of nerdTree ==================================================
"map <C-n> :NERDTreeToggle<CR>
" ======> End=================================================================


" ======> Start of OmniSharp =================================================
"let g:OmniSharp_typeLookupInPreview = 1
"let g:omnicomplete_fetch_full_documentation = 1

"let g:OmniSharp_server_use_mono = 1
"let g:OmniSharp_server_stdio = 1
"let g:OmniSharp_highlight_types = 2
"let g:OmniSharp_selector_ui = 'ctrlp'

"autocmd Filetype cs nnoremap <buffer> gd :OmniSharpPreviewDefinition<CR>
"autocmd Filetype cs nnoremap <buffer> gr :OmniSharpFindUsages<CR>
"autocmd Filetype cs nnoremap <buffer> gy :OmniSharpTypeLookup<CR>
"autocmd Filetype cs nnoremap <buffer> ga :OmniSharpGetCodeActions<CR>
"autocmd Filetype cs nnoremap <buffer> <LEADER>rn :OmniSharpRename<CR><C-N>:res +5<CR>

"sign define OmniSharpCodeActions text=💡

"augroup OSCountCodeActions
"autocmd!
"autocmd FileType cs set signcolumn=yes
"autocmd CursorHold *.cs call OSCountCodeActions()
"augroup END

"function! OSCountCodeActions() abort
"if bufname('%') ==# '' || OmniSharp#FugitiveCheck() | return | endif
"if !OmniSharp#IsServerRunning() | return | endif
"let opts = {
            "\ 'CallbackCount': function('s:CBReturnCount'),
            "\ 'CallbackCleanup': {-> execute('sign unplace 99')}
"\}
"call OmniSharp#CountCodeActions(opts)
"endfunction

"function! s:CBReturnCount(count) abort
"if a:count
"let l = getpos('.')[1]
"let f = expand('%:p')
"execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
"endif
"endfunction
"" ======> End ================================================================


"" ======> Start of rainbow ===================================================
let g:rainbow_active = 1
" ======> End ================================================================


" ======> Start of vim-rooter ================================================
let g:rooter_patterns = ['__vim_project_root', '.git/']
" ======> End ================================================================


" ======> Start of rnvimr ====================================================
"let g:rnvimr_enable_ex = 1
"let g:rnvimr_enable_picker = 1
"let g:rnvimr_draw_border = 0
"let g:rnvimr_enable_bw = 1
"let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}
"let g:rnvimr_ranger_cmd = 'ranger --cmd="set draw_borders both"'
"highlight link RnvimrNormal CursorLine
"nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
"let g:rnvimr_action = {
"            \ '<C-t>': 'NvimEdit tabedit',
"            \ '<C-x>': 'NvimEdit split',
"            \ '<C-v>': 'NvimEdit vsplit',
"            \ 'gw': 'JumpNvimCwd',
"            \ 'yw':'EmitRangerCwd'
"            \}
"let g:rnvimr_layout = {
"            \ 'relative': 'editor',
"            \ 'width': &columns,
"            \ 'height': &lines,
"            \ 'col': 0,
"            \ 'row': 0,
"            \ 'style': 'minimal' }
"let g:rnvimr_presets = [{'width': 0.8, 'height': 0.8}]
" ======> End ================================================================


" ======> Start of reply.vim =================================================
"noremap <LEADER>rp :w<CR>:Repl<CR><C-\><C-N><C-w><C-h>
"noremap <LEADER>rs :ReplSend<CR><C-w><C-l>a<CR><C-\><C-N><C-w><C-h>
"noremap <LEADER>rt :ReplStop<CR>
" ======> End ================================================================



" ======> Start of vim-signature =============================================
let g:SignatureMap = {
            \ 'Leader':"m",
            \ 'PlaceNextMark':"m,",
            \ 'ToggleMarkAtLine':"m.",
            \ 'PurgeMarksAtLine':"dm",
            \ 'DeleteMark':"",
            \ 'PurgeMarks':"",
            \ 'PurgeMarkers':"",
            \ 'GotoNextLineAlpha':"m<LEADER>",
            \ 'GotoPrevLineAlpha':"",
            \ 'GotoNextSpotAlpha':"m<LEADER>",
            \ 'GotoPrevSpotAlpha':"",
            \ 'GotoNextLineByPos':"",
            \ 'GotoPrevLineByPos':"",
            \ 'GotoNextSpotByPos':"",
            \ 'GotoPrevSpotByPos':"",
            \ 'GotoNextMarker':"",
            \ 'GotoPrevMarker':"",
            \ 'GotoNextMarkerAny':"",
            \ 'GotoPrevMarkerAny':"",
            \ 'ListLocalMarks':"m/",
            \ 'ListLocalMarkers':"m?"
            \ }
" ======> End ================================================================


" ======> Start of vim-session ===============================================
"let g:session_directory = $HOME."AppData\Local\nvim\tmp\sessions"
"let g:session_autosave = 'no'
"let g:session_autoload = 'no'
"let g:session_command_aliases = 1
"set sessionoptions-=buffers
"set sessionoptions-=options
"noremap sl :OpenSession<CR>
"noremap sS :SaveSession<CR>
"noremap ss :SaveSession
"noremap sc :SaveSession<CR>:CloseSession<CR>:q<CR>
"noremap so :OpenSession default<CR>
"noremap sD :DeleteSession<CR>
"noremap sA :AppendTabSession<CR>
" ======> End ================================================================



" ======> Start of suda.vim ==================================================
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%
" ======> End ================================================================


" ======> Start of vim-subversive ============================================
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
" ======> End ================================================================

" ======> Start of vim-table-mode ============================================
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'
" ======> End ================================================================


" ======> Start of Ultisnips =================================================
let g:tex_flavor = "latex"
inoremap <c-n> <nop>
let g:UltiSnipsExpandTrigger="<M-/>"
let g:UltiSnipsJumpForwardTrigger="<M-/>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"
let g:UltiSnipsSnippetDirectories = [
            \$HOME.'/.config/nvim/Ultisnips/',
            \$HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/'
            \]
silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
" ======> End ================================================================


" ======> Start of UndoTree <<=================================================
noremap D :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
    nmap <buffer> u <plug>UndotreeNextState
    nmap <buffer> b <plug>UndotreePreviousState
    nmap <buffer> U 5<plug>UndotreeNextState
    nmap <buffer> B 5<plug>UndotreePreviousState
endfunc
" ======> End ================================================================


" ======> Start of vimspector ================================================
let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
    " has to be a function to avoid the extra space fzf#run insers otherwise
    execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
            \   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
            \   'down': 20,
            \   'sink': function('<sid>read_template_into_buffer')
            \ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP         text=🟢 texthl=Normal
sign define vimspectorBPDisabled text=🔴 texthl=Normal
sign define vimspectorPC         text=👉 texthl=SpellBad
" ======> End =================================================================


" ======> Start of vista ======================================================
noremap <LEADER>v :Vista coc<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
            \   "function": "\uf794",
            \   "variable": "\uf71b"}
function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" ======> End =================================================================


" ======> Start of vim-visual-multi ===========================================
"let g:VM_theme             = 'iceblue'
"let g:VM_default_mappings = 0
let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
let g:VM_maps['Find Under']         = '<C-k>'
let g:VM_maps['Find Subword Under'] = '<C-k>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-n>'
let g:VM_maps["Undo"]               = 'u'
let g:VM_maps["Redo"]               = '<C-r>'
" ======> End ================================================================


" ======> Start of Plug name<=============================================
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" ======> End <================================================================


" ======> Start of xtabline ==================================================
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
noremap to :XTabCycleMode<CR>
noremap \p :XTabInfo<CR>
" ======> End ================================================================


" ========================= End of Plugin Settings ===========================

" ===>> Necessary Commands to Execute
exec "nohlsearch"

" ============================================================================
" ==>> Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
    exec "e ~/.config/nvim/_machine_specific.vim"
endif

" some useful cammand in vim
" 1、:w !sudo tee %  save current file with a rooter permistion
" 2、:%TOhtml        covert current file to html
" 3、:r !ls          insert the partical result(only filename) of ls in current dictionaty
" 4、:e path         open default filemanager and show a file list and opration menu
" 5、:n filename     new a file
" 6、:w filename     restore you file, but not change to the new file
