return function()
    -- vim.api.nvim_command('set foldmethod=marker')
    -- vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
    require('nvim-treesitter.configs').setup({
        ensure_installed = {
            'c',
            'cpp',
            'lua',
            'python',
            'go',
            'bash',
            'json',
            'cmake',
            'markdown',
            'markdown_inline',
            'vim',
            'regex',
        },
        -- ignore_install = { 'phpdoc' },
        highlight = {
            enable = true,
        },
        textobjects = {
            select = {
                enable = true,
                keymaps = {
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['ac'] = '@class.outer',
                    ['ic'] = '@class.inner',
                    ['ap'] = '@parameter.outer',
                    ['ip'] = '@parameter.inner',
                },
            },
            include_surrounding_whitespace = false,
        },
        matchup = {
            enable = true,
            disable = {},
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<Cr>',
                node_incremental = '<Cr>',
                node_decremental = '<Bs>',
                -- scope_incremental = "grc",
            },
        },
    })
end
