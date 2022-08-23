return function()
    vim.opt.background = 'light'
    vim.g.everforest_background = 'soft'
    vim.g.everforest_better_performance = 1
    vim.g.everforest_show_eob = 0
    vim.g.everforest_cursor = 'green'
    vim.cmd('colorscheme everforest')
    vim.api.nvim_set_hl(0, 'CursorWord', { bg = '#edf0cd' })
    vim.api.nvim_set_hl(0, 'Visual', { fg = '#2b3339', bg = '#f85552' })
    vim.api.nvim_set_hl(0, 'VisualNOS', { fg = '#2b3339', bg = '#f85552' })
    vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = '#a7c080' })
    vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = '#7fbbb3' })
    vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = '#a7c080' })
    vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = '#e69875', bg = '#4e3e43', bold = true })
    vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = '#e69875' })
    vim.api.nvim_set_hl(0, 'TelescopeMultiSelection', { fg = '#a7c080' })
    vim.g.terminal_color_7 = '#323c41'
    vim.g.terminal_color_15 = '#323c41'
end
