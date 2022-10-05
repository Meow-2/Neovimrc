return function()
    require('colorizer').setup({
        filetypes = {
            '*',
            '!mason',
        },
    })
    vim.api.nvim_create_augroup('Recolor_on_write', { clear = true })
    vim.api.nvim_create_autocmd('BufWritePost', {
        group = 'Recolor_on_write',
        pattern = { '*' },
        callback = function()
            vim.cmd('ColorizerAttachToBuffer')
        end,
    })
end
