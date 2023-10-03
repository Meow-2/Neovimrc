return function()
    -- vim.g.indent_blankline_char = "▏"
    -- vim.g.indent_blankline_context_char = "▏"
    require('ibl').setup({
        -- for example, context is off by default, use this to turn it on
        indent = { char = '│' },
        scope = { enabled = true, show_start = false, show_end = false },
        exclude = {
            buftypes = { 'terminal' },
            filetypes = {
                'lazy',
                'dashboard',
                'NvimTree',
                'mason',
                'lspsagaoutline',
                'lspsagafinder',
                'packer',
                'Outline',
                'startuptime',
                'dap-repl',
                'dapui_breakpoints',
                'dapui_watches',
                'dapui_stacks',
                'dapui_scopes',
                'noice',
                'nvimgdb',
                'qf',
            },
        },
    })
end
