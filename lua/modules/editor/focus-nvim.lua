return function()
    require('focus').setup({
        signcolumn = false,
        excluded_filetypes = { 'NvimTree', 'NvimTree_1', 'NvimTree_2', 'startuptime' },
    })
end
