" ===
" === dressing.nvim
" ===
lua<<EOF
require('dressing').setup({
    select = {
        backend = {"builtin"},
        nui = {
          position = "50%",
          size = nil,
          relative = "editor",
          border = {
            style = "rounded",
          },
          max_width = 180,
          max_height = 140,
        },
        builtin = {
         -- These are passed to nvim_open_win
         anchor = "NW",
         border = "rounded",
         -- 'editor' and 'win' will default to being centered
         relative = "editor",
         
         -- Window transparency (0-100)
         winblend = 10,
         -- Change default highlight groups (see :help winhl)
         winhighlight = "",
         
         -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
         -- the min_ and max_ options can be a list of mixed types.
         -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
         width = nil,
         max_width = { 140, 0.8 },
         min_width = { 80, 0.3 },
         height = nil,
         max_height = 0.9,
         min_height = { 25, 0.2 },
         
         override = function(conf)
           -- This is the config that will be passed to nvim_open_win.
           -- Change values here to customize the layout
           return conf
         end,
    },
    }
})
EOF
