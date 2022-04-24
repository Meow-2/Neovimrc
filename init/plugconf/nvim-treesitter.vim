
" ===
" === nvim-treesitter
" ===
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"javascript","cmake", "cpp","c_sharp", "python","bash","yaml","json","vim","lua","go"},
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  incremental_selection ={
  enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
    }
  }
}
EOF
