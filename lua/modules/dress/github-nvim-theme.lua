return function()
    require('github-theme').setup({
        theme_style = 'light',
        overrides = function()
            return {
                GitSignsChange = { fg = '#fac661' },
                NvimTreeSpecialFile = { bold = true, underline = false },
                DashboardHeader = { fg = '#22863a' },
                DashboardCenter = { fg = '#0366d6' },
                DashboardShortCut = { fg = '#d73a49' },
                DashboardFooter = { fg = '#959da5', bold = true },
            }
        end,
    })
    vim.api.nvim_set_hl(0, 'CursorWord', { bg = '#c1e9d5' })
    vim.api.nvim_set_hl(0, 'NvimTreeSpecialFile', { fg = '#0366d6' })
    vim.api.nvim_set_hl(0, 'NvimSurroundHighlight', { fg = '#ffffff', bg = '#d73a49' })
    vim.api.nvim_set_hl(0, 'LspDiagnosticsSignError', { fg = '#d73a49' })
    vim.api.nvim_set_hl(0, 'LspDiagnosticsSignHint', { fg = '#36d0e0' })
    vim.api.nvim_set_hl(0, 'LspDiagnosticsSignWarning', { fg = '#fac661' })
    vim.api.nvim_set_hl(0, 'LspDiagnosticsSignInformation', { fg = '#0366d6' })
    vim.g.terminal_color_7 = '#323c41'
    vim.g.terminal_color_15 = '#323c41'
end
