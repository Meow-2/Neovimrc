local dap = require('dap')
local dmap = require('core.keymap').dmap
local dap_utils = require('modules.debug.dap-utils')

local mason_path = vim.fn.stdpath('data') .. '/mason/packages'
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    -- command = mason_path .. "/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
    command = 'OpenDebugAD7',
}

dap.configurations.cpp = {
    -- launch exe
    {
        name = 'Launch file',
        type = 'cppdbg',
        request = 'launch',
        program = function()
            dmap({ 'c', '<Tab>' })
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
        end,
        args = function()
            local input = vim.fn.input('Input args: ')
            return dap_utils.str2argtable(input)
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        setupCommands = {
            {
                description = 'enable pretty printing',
                text = '-enable-pretty-printing',
                ignoreFailures = false,
            },
        },
    },
    -- attach process
    {
        name = 'Attach process',
        type = 'cppdbg',
        request = 'attach',
        processId = require('dap.utils').pick_process,
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
        end,
        cwd = '${workspaceFolder}',
        setupCommands = {
            {
                description = 'enable pretty printing',
                text = '-enable-pretty-printing',
                ignoreFailures = false,
            },
        },
    },
    -- attach server
    {
        name = 'Attach to gdbserver :1234',
        type = 'cppdbg',
        request = 'launch',
        MIMode = 'gdb',
        miDebuggerServerAddress = 'localhost:1234',
        miDebuggerPath = '/usr/bin/gdb',
        cwd = '${workspaceFolder}',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
        end,
        setupCommands = {
            {
                text = '-enable-pretty-printing',
                description = 'enable pretty printing',
                ignoreFailures = false,
            },
        },
    },
}

-- setup other language
dap.configurations.c = dap.configurations.cpp
