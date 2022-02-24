
" ======> Settings of vim-treesitter {{{
" ---------------------------------------------------------------------------------
lua << EOF
require "nvim-treesitter.configs".setup {
    -- one of "all", "language", or a list of languages
    ensure_installed = {
        "typescript",
        "javascript",
        "html",
        "css",
        "python",
        "java",
        "dart",
        "lua",
        "go",
        "c",
        "bash",
    },
    highlight = {
        enable = true,
        disable = { "rust" }, -- list of language to disable
    },
}
EOF
" ---------------------------------------------------------------------------------
" ======> End }}}
" vim: set foldmethod=marker foldlevel=0:
