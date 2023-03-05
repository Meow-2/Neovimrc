return function()
    vim.g.switch_custom_definitions = {
        {
            ['\\<[a-z0-9]\\+_\\k\\+\\>'] = {
                ['_\\(.\\)'] = '\\U\\1',
            },
        },
        {
            ['\\<[a-z0-9]\\+[A-Z]\\k\\+\\>'] = {
                ['\\([A-Z]\\)'] = '_\\l\\1',
            },
        },
    }
end
