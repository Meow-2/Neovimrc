lua<<EOF
local Rule = require('nvim-autopairs.rule')
local npairs = require("nvim-autopairs")
local ts_conds = require('nvim-autopairs.ts-conds')
local remap = vim.api.nvim_set_keymap

npairs.setup({
    check_ts = true,
    disable_filetype = { "dap-repl" },
    map_cr = false,
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    },
    fast_wrap = {
      map = '<c-f>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
      end_key = 'l',
      keys = 'qwertyuiopzxcvbnmasdfghjk',
      check_comma = true,
      highlight = 'Search',
      highlight_grey='Comment'
    },
})
_G.MUtils= {}

MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    return vim.fn["coc#_select_confirm"]()
  else
    return npairs.autopairs_cr()
  end
end

remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
-- press % => %% only while inside a comment or string
npairs.add_rules({
  Rule("%", "%", "lua")
    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  Rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'}))
})
EOF
