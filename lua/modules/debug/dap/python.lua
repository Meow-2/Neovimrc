local dap = require('dap')

dap.adapters.python = {
    type = 'executable',
    command = 'debugpy-adapter',
}
dap.configurations.python = {
    -- launch exe
    {
        type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch',
        name = 'Launch file',
        program = '${file}', -- This configuration will launch the current file if used.
        justMyCode = false,
        args = function()
            local cmdargs_path = vim.fn.getcwd() .. '/cmdargs'
            local cmdargs_file = io.open(cmdargs_path, 'r')
            local input
            if cmdargs_file then
                input = cmdargs_file:read('*a')
            else
                input = vim.fn.input('Input args: ')
            end
            io.close(cmdargs_file)
            return require('modules.debug.dap-utils').str2argtable(input)
        end,
        pythonPath = function()
            local venv_path = vim.fn.system('which python')
            -- remove '\n'
            venv_path = string.sub(venv_path, 1, -2)
            return venv_path
        end,
    },
}
