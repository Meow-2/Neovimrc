return function()
    vim.api.nvim_create_autocmd('TextYankPost',{
        pattern = {'*'},
        callback = function()
            if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
                vim.cmd("execute 'OSCYankReg +'")
            end
        end
    })
end
