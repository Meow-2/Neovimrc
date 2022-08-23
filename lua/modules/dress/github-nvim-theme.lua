return function()
    require('github-theme').setup({
        theme_style = 'light',
        overrides = function()
            return {
                GitSignsChange = { fg = '#fac661' },
                NvimTreeSpecialFile = { bold = true, underline = false },
                DashboardHeader = { fg = '#22863a', bold = true },
                DashboardCenter = { fg = '#0366d6', bold = true },
                DashboardShortCut = { fg = '#d73a49', bold = true },
                DashboardFooter = { fg = '#959da5', bold = true },
            }
        end,
    })
    vim.api.nvim_set_hl(0, 'CursorWord', { bg = '#c1e9d5' })
    vim.api.nvim_set_hl(0, 'NvimTreeSpecialFile', { fg = '#0366d6' })
    vim.api.nvim_set_hl(0, 'NvimSurroundHighlight', { fg = '#ffffff', bg = '#d73a49' })
end
