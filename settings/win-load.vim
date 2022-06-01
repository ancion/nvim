
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @ancion

"  First Time Download Neovim Setting Folder {{{
"  ----------------------------------------------------------------------------------

" === Auto load for first time uses
if empty(glob('$HOME/AppData/Local/nvim/autoload/plug.vim'))
    silent !curl -fLo \%USERPROFILE\%/AppData/Local/nvim/autoload/plug.vim --create-dirs 
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===> Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" =============================================================================
let has_machine_specific_file = 1
if empty(glob('$HOME/AppData/Local/nvim/_machine_specific.vim'))

    let has_machine_specific_file = 0
    silent! exec "!copy \\%USERPROFILE\\%\\AppData\\Local\\nvim\\default_configs\\_machine_specific_default.vim \\%USERPROFILE\\%\\AppData\\Local\\nvim\\_machine_specific.vim"
    silent! exec "!copy \\%USERPROFILE\\%\\AppData\\Local\\nvim\\default_configs\\coc-settings.json_win \\%USERPROFILE\\%\\AppData\\Local\\nvim\\coc-settings.json"
endif

" ==>> Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
    exec "e $HOME/AppData/Local/nvim/_machine_specific.vim"
endif

source $HOME/AppData/Local/nvim/_machine_specific.vim
" ----------------------------------------------------------------------------------
" ========== End }}}


"======= local undo and backup file position {{{
" -----------------------------------------------------------------------------------------
if empty(glob('$HOME/AppData/Local/nvim/tmp/backup'))
    silent! exec "!mkdir \\%USERPROFILE\\%\\AppData\\Local\\nvim\\tmp\\backup"
endif
if empty(glob('$HOME/AppData/Local/nvim/tmp/undo'))
    silent! exec "!mkdir \\%USERPROFILE\\%\\AppData\\Local\\nvim\\tmp\\undo"
endif
if empty(glob('$HOME/AppData/Local/nvim/tmp/sessions'))
    silent! exec "!mkdir \\%USERPROFILE\\%\\AppData\\Local\\nvim\\tmp\\sessions"
endif
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=$HOME/AppData/Local/nvim/tmp/backup,.
set directory=$HOME/AppData/Local/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=$HOME/AppData/Local/nvim/tmp/undo,.
endif
" -----------------------------------------------------------------------------------------
" ====== End }}}

