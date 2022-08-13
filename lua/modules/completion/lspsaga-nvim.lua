return function()
    local saga = require("lspsaga")
    local kind = require('lspsaga.lspkind')

    kind[1][2] = ' ' -- File
    kind[2][2] = ' ' -- Variable
    kind[3][2] =  ' ' -- Namespace
    kind[4][2] =  ' ' -- Package
    kind[5][2] =  'ﴯ ' -- Class
    kind[6][2] =  ' ' -- Method
    kind[7][2] =  ' ' -- Property
    kind[8][2] =  ' ' -- Field
    kind[9][2] =  ' ' -- Constructor
    kind[10][2] = '了' -- Enum
    kind[11][2] = ' ' -- Interface
    kind[12][2] = ' ' -- Function
    kind[13][2] = ' ' -- Variable
    kind[14][2] = ' ' -- Constant
    kind[15][2] = ' ' -- String
    kind[16][2] = ' ' -- Number
    kind[17][2] = '◩ ' -- Boolean
    kind[18][2] = ' ' -- Array
    kind[19][2] = ' ' -- Object
    kind[20][2] = 'ﰠ ' -- Key
    kind[21][2] = 'ﳠ ' -- Null
    kind[22][2] = ' ' -- EnumMember
    kind[23][2] = ' ' -- Struct
    kind[24][2] = ' ' -- Event
    kind[25][2] = ' ' -- Operator
    kind[26][2] = ' ' -- TypeParameter
    kind[252][2] =' ' -- TypeAlias
    kind[253][2] =' ' -- Parameter
    kind[254][2] ='ﴂ ' -- StaticMethod
    kind[255][2] =' ' -- Macro


    local settings = {
      --  symbol_in_winbar = {
      --   enable = true,
      -- },
    border_style = "single",
    move_in_saga = { prev = '<C-p>',next = '<C-n>'},
    diagnostic_header = { "", "", "", "" },
    diagnostic_source_bracket = {},
    max_preview_lines = 10,
    code_action_icon = "",
    saga_winblend = 0,
    code_action_num_shortcut = true,
    code_action_lightbulb = {
    enable = true,
    sign = true,
    enable_in_insert = true,
    sign_priority = 20,
    virtual_text = true,
    },
    finder_icons = {
    def = '  ',
    ref = '諭 ',
    link = '  ',
  },
  finder_request_timeout = 1500,
  finder_action_keys = {
      open = "o",
      vsplit = "s",
      split = "i",
      tabe = "t",
      quit = "q",
      scroll_down = "<C-f>",
      scroll_up = "<C-b>", -- quit can be a table
  },
  code_action_keys = {
      quit = "q",
      exec = "<CR>",
  },
  rename_action_quit = "<C-c>",
  rename_in_select = true,
  definition_preview_icon = "  ",
  -- show symbols in winbar must nightly
  symbol_in_winbar = {
      in_custom = false,
      enable = false,
      separator = ' ',
      show_file = true,
      click_support = false,
  },
  -- show outline
  show_outline = {
    win_position = 'right',
    --set special filetype win that outline window split.like NvimTree neotree
    -- defx, db_ui
    win_with = '',
    win_width = 30,
    auto_enter = true,
    auto_preview = true,
    virt_text = '┃',
    jump_key = 'o',
    -- auto refresh when change buffer
    auto_refresh = true,
  },
  -- if you don't use nvim-lspconfig you must pass your server name and
  -- the related filetypes into this table
  -- like server_filetype_map = { metals = { "sbt", "scala" } }
    server_filetype_map = {},
    }
    saga.init_lsp_saga(settings)
end
