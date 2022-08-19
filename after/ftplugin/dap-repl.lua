local dap_repl_bufid = vim.fn.bufnr('dap-repl')
require('dap.ext.autocompl').attach()

print('Dap Has Started!')
local dap_repl_group = vim.api.nvim_create_augroup('Dap_repl_complete', { clear = true })

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
        vim.api.nvim_del_augroup_by_name('Dap_repl_complete')
    end,
})
