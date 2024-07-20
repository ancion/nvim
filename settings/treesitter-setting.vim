
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
    "rust",
  },
  highlight = {
    enable = true,
    disable = { "ruby" }, -- list of language to disable
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = 'v',
      node_decremental = "V",
    },
  },
  indent = { enable = true, disable = { "yaml", "python" } },
  autotag = { enable = true },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  },
}
EOF
" ---------------------------------------------------------------------------------
" ======> End }}}
" vim: set foldmethod=marker foldlevel=0:
