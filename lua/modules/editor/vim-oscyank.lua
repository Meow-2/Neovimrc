return function()
    vim.g.oscyank_silent = true
    if vim.g.remoteSession then
        vim.g.clipboard = {}
        vim.g.oscyank_term = 'default'
    end
    vim.api.nvim_create_augroup('oscyank_post', { clear = true })
    vim.api.nvim_create_autocmd('TextYankPost', {
        group = 'oscyank_post',
        pattern = { '*' },
        callback = function()
            if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
                vim.cmd("execute 'OSCYankReg +'")
            end
        end,
    })
end
