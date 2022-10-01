return function()
    local saga = require('lspsaga')
    local kind = require('lspsaga.lspkind')

    kind[1][2] = ' ' -- File
    kind[2][2] = ' ' -- Variable
    kind[3][2] = ' ' -- Namespace
    kind[4][2] = ' ' -- Package
    kind[5][2] = 'ﴯ ' -- Class
    kind[6][2] = ' ' -- Method
    kind[7][2] = ' ' -- Property
    kind[8][2] = ' ' -- Field
    kind[9][2] = ' ' -- Constructor
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
    kind[252][2] = ' ' -- TypeAlias
    kind[253][2] = ' ' -- Parameter
    kind[254][2] = 'ﴂ ' -- StaticMethod
    kind[255][2] = ' ' -- Macro

    local settings = {
        --  symbol_in_winbar = {
        --   enable = true,
        -- },
        border_style = 'single',
        move_in_saga = { prev = '<S-Tab>', next = '<Tab>' },
        diagnostic_header = { '', '', '', '' },
        -- diagnostic_source_bracket = {},
        max_preview_lines = 10,
        code_action_icon = '',
        saga_winblend = 0,
        code_action_num_shortcut = true,
        code_action_lightbulb = {
            enable = true,
            sign = false,
            enable_in_insert = false,
            sign_priority = 10,
            virtual_text = true,
        },
        finder_icons = {
            def = '  ',
            ref = '諭 ',
            link = '  ',
        },
        finder_request_timeout = 1500,
        finder_action_keys = {
            open = '<Cr>',
            vsplit = 'v',
            split = 's',
            tabe = 't',
            quit = 'q',
            scroll_down = '<C-u>',
            scroll_up = '<C-d>', -- quit can be a table
        },
        code_action_keys = {
            quit = '<Esc>',
            exec = '<CR>',
        },
        rename_action_quit = '<Esc>',
        rename_in_select = false,
        -- definition_preview_icon = '  ',
        -- show symbols in winbar must nightly
        symbol_in_winbar = {
            in_custom = false,
            enable = true,
            separator = ' ',
            show_file = true,
            -- define how to customize filename, eg: %:., %
            -- if not set, use default value `%:t`
            -- more information see `vim.fn.expand` or `expand`
            -- ## only valid after set `show_file = true`
            file_formatter = '',
            click_support = function(node, clicks, button, modifiers)
                -- To see all avaiable details: vim.pretty_print(node)
                local st = node.range.start
                local en = node.range['end']
                if button == 'l' then
                    if clicks == 2 then
                    -- double left click to do nothing
                    else -- jump to node's starting line+char
                        vim.fn.cursor(st.line + 1, st.character + 1)
                    end
                elseif button == 'r' then
                    if modifiers == 's' then
                        print('lspsaga') -- shift right click to print "lspsaga"
                    end -- jump to node's ending line+char
                    vim.fn.cursor(en.line + 1, en.character + 1)
                elseif button == 'm' then
                    -- middle click to visual select node
                    vim.fn.cursor(st.line + 1, st.character + 1)
                    vim.cmd('normal v')
                    vim.fn.cursor(en.line + 1, en.character + 1)
                end
            end,
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
            jump_key = '<Cr>',
            -- auto refresh when change buffer
            auto_refresh = true,
        },
        -- if you don't use nvim-lspconfig you must pass your server name and
        -- the related filetypes into this table
        -- like server_filetype_map = { metals = { "sbt", "scala" } }
        -- server_filetype_map = {},
    }
    saga.init_lsp_saga(settings)
end
