return function()
    local saga = require('lspsaga')
    local kind = require('lspsaga.lspkind')
    local colors = {
        bg = '#ffffff',
        -- bg2 = '#f6f8fa',
        bg2 = '#f4f7fa',
        fg = '#24292e',
        red = '#d73a49',
        blue = '#0366d6',
        green = '#22863a',
        orange = '#d18616',
        yellow = '#f9c513',
        cyan = '#1b7c83',
        bright_magenta = '#8a63d2',
        bright_blue = '#218bff',
        error = '#cb2431',
        warning = '#bf8803',
        info = '#2188ff',
        hint = '#1b7c83',
        gitadd = '#22863a',
        gitchange = '#e36209',
        gitdelete = '#d73a49',
    } --}}}

    kind[1] = { 'File', ' ', colors.fg }
    kind[2] = { 'Module', ' ', colors.blue }
    kind[3] = { 'Namespace', ' ', colors.orange }
    kind[4] = { 'Package', ' ', colors.bright_magenta }
    kind[5] = { 'Class', 'ﴯ ', colors.bright_magenta }
    kind[6] = { 'Method', ' ', colors.bright_magenta }
    kind[7] = { 'Property', ' ', colors.cyan }
    kind[8] = { 'Field', ' ', colors.cyan }
    kind[9] = { 'Constructor', ' ', colors.blue }
    kind[10] = { 'Enum', '了', colors.green }
    kind[11] = { 'Interface', ' ', colors.orange }
    kind[12] = { 'Function', ' ', colors.bright_magenta }
    kind[13] = { 'Variable', ' ', colors.blue }
    kind[14] = { 'Constant', ' ', colors.cyan }
    kind[15] = { 'String', ' ', colors.green }
    kind[16] = { 'Number', ' ', colors.green }
    kind[17] = { 'Boolean', '◩ ', colors.orange }
    kind[18] = { 'Array', ' ', colors.blue }
    kind[19] = { 'Object', ' ', colors.orange }
    kind[20] = { 'Key', 'ﰠ ', colors.red }
    kind[21] = { 'Null', 'ﳠ ', colors.red }
    kind[22] = { 'EnumMember', ' ', colors.green }
    kind[23] = { 'Struct', ' ', colors.bright_magenta }
    kind[24] = { 'Event', ' ', colors.bright_magenta }
    kind[25] = { 'Operator', ' ', colors.green }
    kind[26] = { 'TypeParameter', ' ', colors.green }
    kind[252] = { 'TypeAlias', ' ', colors.green }
    kind[253] = { 'Parameter', ' ', colors.blue }
    kind[254] = { 'StaticMethod', 'ﴂ ', colors.orange }
    kind[255] = { 'Macro', ' ', colors.red }

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
            separator = '  ',
            show_file = true,
            -- define how to customize filename, eg: %:., %
            -- if not set, use default value `%:t`
            -- more information see `vim.fn.expand` or `expand`
            -- ## only valid after set `show_file = true`
            file_formatter = '%:t',
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
    vim.api.nvim_set_hl(0, 'LspSagaWinbarFile', { fg = '#abadad', bg = 'NONE', italic = true })
end
