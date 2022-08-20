local dap_repl_bufid = vim.fn.bufnr('dap-repl')
require('dap.ext.autocompl').attach()

print('Dap Has Started!')
local dap_repl_group = vim.api.nvim_create_augroup('Dap_repl_complete', { clear = true })
vim.keymap.set(
    'i',
    '<Tab>',
    '<C-n>',
    { noremap = true, silent = true, nowait = true, buffer = dap_repl_bufid }
)
vim.keymap.set(
    'i',
    '<S-Tab>',
    '<C-p>',
    { noremap = true, silent = true, nowait = true, buffer = dap_repl_bufid }
)
vim.keymap.set(
    'i',
    '<Cr>',
    [[<Cmd>silent! s/``/`/g<Cr><Cr>]],
    { silent = true, nowait = true, buffer = dap_repl_bufid }
)
vim.api.nvim_create_autocmd('CursorMovedI', {
    group = dap_repl_group,
    buffer = dap_repl_bufid,
    callback = function()
        vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes('<C-x><C-o>', true, false, true),
            'm',
            true
        )
    end,
})

vim.api.nvim_create_autocmd({ 'BufWinLeave' }, {
    group = dap_repl_group,
    buffer = dap_repl_bufid,
    callback = function()
        print('Dap Has Exited!')
        vim.keymap.del('i', '<Tab>', { buffer = dap_repl_bufid })
        vim.keymap.del('i', '<S-Tab>', { buffer = dap_repl_bufid })
        vim.keymap.del('i', '<Cr>', { buffer = dap_repl_bufid })
        vim.api.nvim_del_augroup_by_name('Dap_repl_complete')
    end,
})
