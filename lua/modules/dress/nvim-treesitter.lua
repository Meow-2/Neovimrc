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
            move = {
                enable = true,
                set_jumps = true,
            },
            include_surrounding_whitespace = false,
        },
        matchup = {
            enable = true,
            disable = {},
        },
        rainbow = {
            enable = true,
            -- list of languages you want to disable the plugin for
            -- disable = { 'jsx', 'cpp' },
            -- Which query to use for finding delimiters
            query = 'rainbow-parens',
            -- Highlight the entire buffer all at once
            strategy = require('ts-rainbow.strategy.global'),
            hlgroups = {
                -- 'TSRainbowRed',
                'TSRainbowYellow',
                'TSRainbowBlue',
                -- 'TSRainbowOrange',
                'TSRainbowGreen',
                -- 'TSRainbowViolet',
                -- 'TSRainbowCyan',
            },
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
