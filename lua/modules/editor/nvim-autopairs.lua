return function()
local Rule = require('nvim-autopairs.rule')
local npairs = require("nvim-autopairs")
-- local ts_conds = require('nvim-autopairs.ts-conds')

npairs.setup({
    -- check_ts = true,
    disable_filetype = { "dap-repl" },
    map_cr = false,
    -- ts_config = {
    --     lua = {'string'},-- it will not add a pair on that treesitter node
    --     javascript = {'template_string'},
    --     java = false,-- don't check treesitter on java
    -- },
    fast_wrap = {
      map = '<c-f>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
      offset = -1, -- Offset from pattern match
      end_key = 'l',
      keys = 'qwertyuiopzxcvbnmasdfghjk',
      check_comma = true,
      highlight = 'PmenuSel',
      highlight_grey='LineNr'
    },
})

-- press % => %% only while inside a comment or string
-- npairs.add_rules({
--   Rule("%", "%", "lua")
--     :with_pair(ts_conds.is_ts_node({'string','comment'})),
--   Rule("$", "$", "lua")
--     :with_pair(ts_conds.is_not_ts_node({'function'}))
-- })
end
