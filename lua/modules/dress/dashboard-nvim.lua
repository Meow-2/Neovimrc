return function()
    local home = os.getenv('HOME')
    local db = require('dashboard')
    db.setup({
        theme = 'hyper',
        shortcut_type = 'number',
        config = {
            week_header = {
                enable = true,
            },
            shortcut = {
                {
                    icon = ' ',
                    icon_hl = '@variable',
                    desc = 'Update',
                    group = '@property',
                    action = 'Lazy',
                    key = 'u',
                },
                {
                    icon = ' ',
                    icon_hl = 'Label',
                    desc = 'Files',
                    group = '@property',
                    action = 'Telescope find_files',
                    key = 'f',
                },
                {
                    icon = ' ',
                    icon_hl = 'DiagnosticSignHint',
                    desc = 'Words',
                    group = '@property',
                    action = 'TelescopeLiveGrep',
                    key = 'a',
                },
                {
                    icon = ' ',
                    icon_hl = 'Number',
                    desc = 'Dotfiles',
                    group = '@property',
                    action = 'Telescope find_files find_command=rg,--hidden,--files,' .. home,
                    key = 'd',
                },
            },
            project = {
                limit = 4,
                -- action = 'Telescope find_files find_command=rg,--hidden,--files cwd=',
            },
            mru = { limit = 10 },
        },
    })
    -- db.session_directory = home .. '/.cache/nvim/sessions'
    -- db.preview_command = 'cat | lolcat -F 0.3'
    -- db.preview_file_path = vim_conf_path .. '/static/neovim.cat'
    -- db.preview_file_height = 13
    -- db.preview_file_width = 69
    -- db.hide_statusline = true
    -- db.hide_tabline = true
    -- db.header_pad = 1
    -- db.center_pad = 1
    -- db.footer_pad = 5
    -- local plugin_count = #vim.tbl_keys(packer_plugins)
    -- db.custom_footer = { '  Neovim Loaded ' .. plugin_count .. ' plugins' }
    -- db.custom_center = {
    --     {
    --         icon = '  ',
    --         icon_hl = { fg = '#e95678' },
    --         desc = 'Update Plugins             ',
    --         action = 'PackerUpdate',
    --         shortcut = 'Leader u',
    --     },
    --     {
    --         icon = '  ',
    --         icon_hl = { fg = '#fac661' },
    --         desc = 'Recently opened files      ',
    --         action = 'Telescope oldfiles',
    --         shortcut = 'Search o',
    --     },
    --     {
    --         icon = '  ',
    --         icon_hl = { fg = '#de841b' },
    --         desc = 'Find  word                 ',
    --         action = 'TelescopeLiveGrep',
    --         shortcut = 'Search w',
    --     },
    --     {
    --         icon = '  ',
    --         icon_hl = { fg = '#36d0e0' },
    --         desc = 'Find  File                 ',
    --         action = 'Telescope find_files find_command=rg,--hidden,--files',
    --         shortcut = 'Search F',
    --     },
    --     {
    --         icon = '  ',
    --         icon_hl = { fg = '#61afef' },
    --         desc = 'File Browser               ',
    --         action = 'Telescope file_browser',
    --         shortcut = 'Search B',
    --     },
    --     {
    --         icon = '  ',
    --         icon_hl = { fg = '#d16d9e' },
    --         desc = 'Open Personal dotfiles     ',
    --         action = 'Telescope find_files find_command=rg,--hidden,--files,' .. home,
    --         shortcut = 'Search H',
    --     },
    -- }
end
