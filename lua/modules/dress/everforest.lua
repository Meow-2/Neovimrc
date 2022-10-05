return function()
    local plugin = require('core.pack').register_plugin

    vim.opt.background = 'light'
    vim.g.everforest_background = 'soft'
    vim.g.everforest_better_performance = 1
    vim.g.everforest_show_eob = 0
    vim.g.everforest_cursor = 'green'
    vim.cmd('colorscheme everforest')
    vim.api.nvim_set_hl(0, 'CursorWord', { bg = '#e3e8b0' })
    vim.api.nvim_set_hl(0, 'Visual', { fg = '#2b3339', bg = '#f57d26' })
    vim.api.nvim_set_hl(0, 'VisualNOS', { fg = '#2b3339', bg = '#f57d26' })
    vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#e69875' })
    vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#e69875' })
    vim.g.terminal_color_7 = '#323c41'
    vim.g.terminal_color_15 = '#323c41'

    plugin({
        'Meow-2/github-galaxyline',
        event = 'BufReadPost',
        after = { 'galaxyline.nvim' },
        config = function()
            require('github-galaxyline').setup({ style = 'warm' })
        end,
        requires = {
            {
                'glepnir/galaxyline.nvim',
                branch = 'main',
                requires = 'kyazdani42/nvim-web-devicons',
            },
        },
    })
end
