return function()
    -- config debuggers
    local vim_path = vim.fn.stdpath('config')
    local dap_list = {}
    local temp = vim.split(vim.fn.globpath(vim_path .. '/lua/modules/debug/dap', '*.lua'), '\n')
    for _, i in ipairs(temp) do
        dap_list[#dap_list + 1] = string.match(i, 'dap/(.+).lua$')
    end
    for _, i in ipairs(dap_list) do
        require('modules.debug.dap.' .. i)
    end
    require('modules.debug.dap-utils').load_breakpoints()
end
