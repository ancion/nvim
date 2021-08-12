
" ======> Settings of Colorizer {{{
" -----------------------------------------------------------------------------
" Terminal colors
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
" -----------------------------------------------------------------------------
" ======> End }}}

" ======>  [[[ Dress up my vim  ]]] == {{{
" -----------------------------------------------------------------------------
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

"let g:space_vim_transp_bg = 1
"colorscheme space_vim_theme

"let g:SnazzyTransparent = 1
"set background=dark
"colorscheme snazzy

 "let g:nightflyCursorColor = 1
 "let g:nightflyTransparent = 1
 "let g:nightflyNormalFloat = 1
 "color nightfly

"let g:neosolarized_termtrans        = 1
"let g:neosolarized_contrast         = "normal"
"let g:neosolarized_visibility       = "normal"
"let g:neosolarized_vertSplitBgTrans = 1
"let g:neosolarized_bold             = 1
"let g:neosolarized_underline        = 1
"let g:neosolarized_italic           = 0
"let g:neosolarized_termBoldAsBright = 1
"colorscheme NeoSolarized

"color purify

colorscheme dracula
"colors deus
"color gruvbox
"color xcodelighthc

"let g:one_allow_italics = 1
"color one

"let ayucolor="light"
"let ayucolor="mirage"
"color ayu
"
"let g:oceanic_next_terminal_bold   = 1
"let g:oceanic_next_terminal_italic = 1
let g:airline_theme                = 'night_owl'

hi NonText ctermfg = Gray     guifg = Grey10
hi NonText ctermfg = Black    guifg = Black10
hi normal  ctermfg = 252    ctermbg = NONE     guibg = NONE

" Set cursor line color on visual mode
"highlight Visual cterm=NONE ctermbg=236 guifg=NONE guibg=LightBlue
"highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=NONE


" -----------------------------------------------------------------------------------------
" =======End }}}

" ======> Settings of xtabline {{{
" -----------------------------------------------------------------------------------------
let g:xtabline_settings = {'theme':'dracula'}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
noremap to :XTabCycleMode<CR>
noremap \p :XTabInfo<CR>
" -----------------------------------------------------------------------------------------
" ======> End }}}

" ======> Settings of eleline.vim {{{
" -----------------------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:eleline_powerline_fonts = 1
" -----------------------------------------------------------------------------------------
" ======> End }}}

" ======> Settings of Colorizer {{{
" -----------------------------------------------------------------------------------------
let g:colorizer_syntax = 1
" -----------------------------------------------------------------------------------------
" ======> End }}}

" ======> Settings of nvim-colorizer.lua {{{
" -----------------------------------------------------------------------------------------
lua require'colorizer'.setup()
" -----------------------------------------------------------------------------------------
" ======> End }}}

" ======> Settings of jsx {{{
" -----------------------------------------------------------------------------------------
let g:vim_jsx_pretty_colorful_config = 1
" -----------------------------------------------------------------------------------------
" ======> End }}}

"" ======> Setttings of rainbow  {{{
" -----------------------------------------------------------------------------------------
let g:rainbow_active = 1
" -----------------------------------------------------------------------------------------
" ======> End }}}

" vim: foldmethod=marker foldlevel=0:
