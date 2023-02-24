return function()
    -- local kind = require('lspsaga.lspkind')
    -- local colors = {
    --     bg = '#ffffff',
    --     -- bg2 = '#f6f8fa',
    --     bg2 = '#f4f7fa',
    --     fg = '#24292e',
    --     red = '#d73a49',
    --     blue = '#0366d6',
    --     green = '#22863a',
    --     orange = '#d18616',
    --     yellow = '#f9c513',
    --     cyan = '#1b7c83',
    --     bright_magenta = '#8a63d2',
    --     bright_blue = '#218bff',
    --     error = '#cb2431',
    --     warning = '#bf8803',
    --     info = '#2188ff',
    --     hint = '#1b7c83',
    --     gitadd = '#22863a',
    --     gitchange = '#e36209',
    --     gitdelete = '#d73a49',
    -- } --}}}
    --
    -- kind[1] = { 'File', ' ', colors.fg }
    -- kind[2] = { 'Module', ' ', colors.blue }
    -- kind[3] = { 'Namespace', ' ', colors.orange }
    -- kind[4] = { 'Package', ' ', colors.bright_magenta }
    -- kind[5] = { 'Class', ' ', colors.bright_magenta }
    -- kind[6] = { 'Method', ' ', colors.bright_magenta }
    -- kind[7] = { 'Property', ' ', colors.cyan }
    -- kind[8] = { 'Field', ' ', colors.cyan }
    -- kind[9] = { 'Constructor', ' ', colors.blue }
    -- kind[10] = { 'Enum', ' ', colors.green }
    -- kind[11] = { 'Interface', ' ', colors.orange }
    -- kind[12] = { 'Function', ' ', colors.bright_magenta }
    -- kind[13] = { 'Variable', ' ', colors.blue }
    -- kind[14] = { 'Constant', ' ', colors.cyan }
    -- kind[15] = { 'String', ' ', colors.green }
    -- kind[16] = { 'Number', ' ', colors.green }
    -- kind[17] = { 'Boolean', ' ', colors.orange }
    -- kind[18] = { 'Array', ' ', colors.blue }
    -- kind[19] = { 'Object', ' ', colors.orange }
    -- kind[20] = { 'Key', ' ', colors.red }
    -- kind[21] = { 'Null', ' ', colors.red }
    -- kind[22] = { 'EnumMember', ' ', colors.green }
    -- kind[23] = { 'Struct', ' ', colors.bright_magenta }
    -- kind[24] = { 'Event', ' ', colors.bright_magenta }
    -- kind[25] = { 'Operator', ' ', colors.green }
    -- kind[26] = { 'TypeParameter', ' ', colors.green }
    -- kind[252] = { 'TypeAlias', ' ', colors.green }
    -- kind[253] = { 'Parameter', ' ', colors.blue }
    -- kind[254] = { 'StaticMethod', ' ', colors.orange }
    -- kind[255] = { 'Macro', ' ', colors.red }
    --
    local settings = {
        preview = {
            lines_above = 0,
            lines_below = 10,
        },
        scroll_preview = {
            scroll_down = '<C-u>',
            scroll_up = '<C-d>',
        },
        request_timeout = 2000,
        -- finder_request_timeout = 1500,
        finder = {
            edit = { '<CR>' },
            vsplit = 'v',
            split = 's',
            tabe = 't',
            quit = { 'q', '<ESC>' },
        },
        definition = {
            edit = '<C-c>o',
            vsplit = '<C-c>v',
            split = '<C-c>s',
            tabe = '<C-c>t',
            quit = 'q',
            close = '<Esc>',
        },
        code_action = {
            num_shortcut = true,
            keys = {
                quit = '<Esc>',
                exec = '<CR>',
            },
        },
        rename = {
            quit = '<Esc>',
            exec = '<CR>',
            mark = 'x',
            confirm = '<CR>',
            in_select = false,
            whole_project = true,
        },
        symbol_in_winbar = {
            enable = true,
            separator = '  ',
            hide_keyword = true,
            show_file = true,
            folder_level = 2,
            respect_root = false,
            color_mode = true,
        },
        outline = {
            win_position = 'right',
            win_with = '',
            win_width = 30,
            show_detail = true,
            auto_preview = true,
            auto_refresh = true,
            auto_close = true,
            custom_sort = nil,
            keys = {
                jump = '<Cr>',
                expand_collapse = 'o',
                quit = 'q',
            },
        },
        diagnostic = {
            on_insert = false,
            on_insert_follow = false,
            insert_winblend = 0,
            show_code_action = true,
            show_source = true,
            jump_num_shortcut = true,
            --1 is max
            max_width = 0.7,
            custom_fix = nil,
            custom_msg = nil,
            text_hl_follow = false,
            border_follow = true,
            keys = {
                exec_action = 'o',
                quit = 'q',
                go_action = 'g',
            },
        },
        ui = {
            -- currently only round theme
            theme = 'round',
            -- border type can be single,double,rounded,solid,shadow.
            border = 'single',
            winblend = 0,
            expand = '',
            collapse = '',
            preview = ' ',
            code_action = '',
            diagnostic = '',
            -- diagnostic_header = { '', '', '', '' },
            incoming = ' ',
            outgoing = ' ',
            colors = {
                --float window normal bakcground color
                -- normal_bg = '#1d1536',
                normal_bg = 'NONE',
                --title background color
                title_bg = '#afd700',
                red = '#e95678',
                magenta = '#b33076',
                orange = '#FF8700',
                yellow = '#f7bb3b',
                green = '#afd700',
                cyan = '#36d0e0',
                blue = '#61afef',
                purple = '#CBA6F7',
                white = '#d1d4cf',
                black = '#1c1c19',
            },
            kind = {},
        },
    }
    require('lspsaga').setup(settings)
    -- vim.api.nvim_set_hl(0, 'LspSagaWinbarFile', { fg = '#abadad', bg = 'NONE', italic = true })
end
