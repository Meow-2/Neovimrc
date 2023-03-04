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
                goto_next_start = {
                    [']m'] = '@function.outer',
                    [']]'] = { query = '@class.outer', desc = 'Next class start' },
                    --
                    -- You can use regex matching and/or pass a list in a "query" key to group multiple queires.
                    [']o'] = '@loop.*',
                    -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
                    --
                    -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                    -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                    [']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
                    [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
                },
                goto_next_end = {
                    [']M'] = '@function.outer',
                    [']['] = '@class.outer',
                },
                goto_previous_start = {
                    ['[m'] = '@function.outer',
                    ['[['] = '@class.outer',
                },
                goto_previous_end = {
                    ['[M'] = '@function.outer',
                    ['[]'] = '@class.outer',
                },
                -- Below will go to either the start or the end, whichever is closer.
                -- Use if you want more granular movements
                -- Make it even more gradual by adding multiple queries and regex.
                goto_next = {
                    [']d'] = '@conditional.outer',
                },
                goto_previous = {
                    ['[d'] = '@conditional.outer',
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ['<leader>n'] = '@parameter.inner',
                },
                swap_previous = {
                    ['<leader>p'] = '@parameter.inner',
                },
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
