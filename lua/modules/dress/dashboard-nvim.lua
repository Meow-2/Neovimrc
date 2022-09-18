return function()
    local home = os.getenv('HOME')
    local vim_conf_path = vim.fn.stdpath('config')
    local db = require('dashboard')
    db.session_directory = home .. '/.cache/nvim/sessions'

    -- if vim.g.nvui or vim.g.remoteSession then
    db.preview_command = 'cat | lolcat -F 0.3'
    if not vim.g.nvui then
        db.preview_file_path = vim_conf_path .. '/static/neovim.cat'
        db.preview_file_height = 13
        db.preview_file_width = 69
    else
        db.preview_file_path = vim_conf_path .. '/static/neovim.cat_'
        db.preview_file_height = 13
        db.preview_file_width = 115
    end
    -- else
    -- db.preview_command = 'ueberzug'
    -- db.preview_file_path = vim_conf_path .. '/static/logo.png'
    -- db.preview_file_height = 15
    -- db.preview_file_width = 46
    -- end
    -- db.preview_command = 'cat | lolcat -F 0.3'
    db.hide_statusline = true
    db.hide_tabline = true
    db.header_pad = 1
    db.center_pad = 1
    db.footer_pad = 5
    local plugin_count = #vim.tbl_keys(packer_plugins)
    db.custom_footer = { '  Neovim Loaded ' .. plugin_count .. ' plugins' }
    db.custom_center = {
        {
            icon = '  ',
            icon_hl = { fg = '#e95678' },
            desc = 'Update Plugins             ',
            action = 'PackerUpdate',
            shortcut = 'Leader u',
        },
        {
            icon = '  ',
            icon_hl = { fg = '#fac661' },
            desc = 'Recently opened files      ',
            action = 'Telescope oldfiles',
            shortcut = 'Search o',
        },
        {
            icon = '  ',
            icon_hl = { fg = '#de841b' },
            desc = 'Find  word                 ',
            action = 'TelescopeLiveGrep',
            shortcut = 'Search w',
        },
        {
            icon = '  ',
            icon_hl = { fg = '#36d0e0' },
            desc = 'Find  File                 ',
            action = 'Telescope find_files find_command=rg,--hidden,--files',
            shortcut = 'Search F',
        },
        {
            icon = '  ',
            icon_hl = { fg = '#61afef' },
            desc = 'File Browser               ',
            action = 'Telescope file_browser',
            shortcut = 'Search B',
        },
        {
            icon = '  ',
            icon_hl = { fg = '#d16d9e' },
            desc = 'Open Personal dotfiles     ',
            action = 'Telescope find_files find_command=rg,--hidden,--files,' .. home,
            shortcut = 'Search H',
        },
    }
end
