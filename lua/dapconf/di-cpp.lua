local dap_install = require("dap-install")
-- dap_install.config("ccppr_vsc",{})
local dbg_path = require("dap-install.config.settings").options["installation_path"] .. "ccppr_vsc/"
dap_install.config("ccppr_vsc",{
	adapters = {
		type = "executable",
		command = dbg_path .. "extension/debugAdapters/bin/OpenDebugAD7",
	},
	configurations = {
		{
			name = "Launch file",
			type = "cppdbg",
			request = "launch",
			miDebuggerPath = "/usr/bin/gdb",
            program = '${workspaceFolder}/build/${fileBasenameNoExtension}',
            -- TODO : rewrite config in lua
			-- program = function()
			-- 	return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			-- end,
            -- args = function()
            --     local input = vim.fn.input("Input args: ")
            --     return require("dapconf.dap-util").str2argtable(input)
            -- end,
			cwd = "${workspaceFolder}",
			stopOnEntry = true,
            setupCommands = {
                {
                description =  'enable pretty printing',
                text = '-enable-pretty-printing',
                ignoreFailures = false
                },
            },
		},
        {
            name = "Attach process",
            type = "cppdbg",
            request = "attach",
            processId = require('dap.utils').pick_process,
            program = '${workspaceFolder}/build/${fileBasenameNoExtension}',
            -- program = function()
            --   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            -- end,
            cwd = "${workspaceFolder}",
            setupCommands = {
                {
                description =  'enable pretty printing',
                text = '-enable-pretty-printing',
                ignoreFailures = false
                },
            },
        },
		{
			name = "Attach to gdbserver :1234",
			type = "cppdbg",
			request = "launch",
			MIMode = "gdb",
			miDebuggerServerAddress = "localhost:1234",
   			miDebuggerPath = "/usr/bin/gdb",
			cwd = "${workspaceFolder}",
            program = '${workspaceFolder}/build/${fileBasenameNoExtension}',
			-- program = function()
			-- 	return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			-- end,
            setupCommands = {
                {
                description =  'enable pretty printing',
                text = '-enable-pretty-printing',
                ignoreFailures = false
                },
            },
		},
	},
})

-- setup other language
local dap = require('dap')
dap.configurations.c = dap.configurations.cpp
