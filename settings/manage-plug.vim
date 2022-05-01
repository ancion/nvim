
"========= [[[ Manage Plugs ]]] {{{
"---------------------------------------------------------------------------

call plug#begin('~/.config/nvim/plugged')
"===========================================================================
"===First of all we should put some basic plug to apply ourself properties==
"===========================================================================

Plug 'norcalli/nvim-colorizer.lua'
Plug 'KabbAmine/vCoolor.vim'
Plug 'AndrewRadev/splitjoin.vim'
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

"Plug 'theniceboy/eleline.vim'
"Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'ajmwagar/vim-deus
Plug 'theniceboy/vim-deus'
Plug 'connorholyday/vim-snazzy'
"Plug 'arzg/vim-colors-xcode'
"Plug 'rakr/vim-one'
"Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'overcache/NeoSolarized'
"Plug 'mhartington/oceanic-next'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'kyoz/purify', { 'rtp': 'vim'  }
Plug 'liuchengxu/space-vim-theme'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

"=============================================================================
"======> Genreal Highlighter <=======================
"=============================================================================

"Plug 'jaxbot/semantic-highlight.vim'
Plug 'chrisbra/Colorizer' " Show colors with :ColorHighlight
Plug 'dracula/vim',{'as':'dracula'}
Plug 'RRethy/vim-illuminate'
"Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase'  }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

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
Plug 'github/copilot.vim'

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
"Plug 'tiagofumo/dart-vim-flutter-layout'

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
Plug 'junegunn/vim-peekaboo'
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
" Plug 'MattesGroeger/vim-bookmarks'

" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }
Plug 'osyo-manga/vim-anzu'

" Documentation
"Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc

" Vim Applications

Plug 'makerj/vim-pdf'
"Plug 'liuchengxu/vim-clap'
"Plug 'jceb/vim-orgmode'
Plug 'voldikss/vim-floaterm'
" This plug can show you a list files recently opened when you start nvim
Plug 'mhinz/vim-startify'

Plug 'folke/which-key.nvim'
"Plug 'liuchengxu/vim-which-key'

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
"-----------------------------------------------------------------------------
" ========= End }}}
" vim: foldmethod=marker foldlevel=0:
