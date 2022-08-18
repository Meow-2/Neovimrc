-- vim.keymap.set('i', '<C-Space>', '<C-x><C-o>', { noremap = true, silent = true })
vim.api.nvim_create_augroup('Repl-Compeletion', { clear = true })
vim.api.nvim_create_autocmd('CursorMovedI', {
    group = 'Repl-Compeletion',
    pattern = '*',
    callback = function()
        vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes('<C-x><C-o>', true, false, true),
            'm',
            true
        )
    end,
})
