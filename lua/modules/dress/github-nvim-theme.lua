return function()
    require('github-theme').setup({
        theme_style = 'light',
        overrides = function()
            return {
                GitSignsChange = { fg = '#e36209' },
                NvimTreeSpecialFile = { bold = true, underline = false },
                DashboardHeader = { fg = '#22863a' },
                DashboardCenter = { fg = '#0366d6' },
                DashboardShortCut = { fg = '#d73a49' },
                DashboardFooter = { fg = '#959da5' },
            }
        end,
    })
    vim.api.nvim_set_hl(0, 'CursorWord', { bg = '#c1e9d5' })
    vim.api.nvim_set_hl(0, 'NvimTreeSpecialFile', { fg = '#0366d6' })
    vim.api.nvim_set_hl(0, 'NvimSurroundHighlight', { fg = '#ffffff', bg = '#d73a49' })
end
