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
        args = function()
            local input = vim.fn.input('Input args: ')
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
