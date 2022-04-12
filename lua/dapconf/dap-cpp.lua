-- `${file}`: Active filename
-- `${fileBasename}`: The current file's basename
-- `${fileBasenameNoExtension}`: The current file's basename without extension
-- `${fileDirname}`: The current file's dirname
-- `${fileExtname}`: The current file's extension
-- `${relativeFile}`: The current file relative to |getcwd()|
-- `${relativeFileDirname}`: The current file's dirname relative to |getcwd()|
-- `${workspaceFolder}`: The current working directory of Neovim
-- `${workspaceFolderBasename}`: The name of the folder opened in Neovim
local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed
  name = "lldb"
}
local dap = require('dap')
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    -- program = function()
    --   return vim.fn.input('Path to executable: ', vim.fn.expand('%:h') .. '/build/'.. vim.fn.expand('%:t:r'))
    -- end,
    program = '${workspaceFolder}/build/${fileBasenameNoExtension}',
    cwd = '${workspaceFolder}',
    -- stdio = {"input.txt", nil, nil},
    stopOnEntry = false,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html

    runInTerminal = false,

    -- 💀
    -- If you use `runInTerminal = true` and resize the terminal window,
    -- lldb-vscode will receive a `SIGWINCH` signal which can cause problems
    -- To avoid that uncomment the following option
    -- See https://github.com/mfussenegger/nvim-dap/issues/236#issuecomment-1066306073
    -- postRunCommands = {'process handle -p true -s false -n false SIGWINCH'},
    postRunCommands = {'break set -n main'},
    setupCommands = {
    {
        description =  'enable pretty printing',
        text = '-enable-pretty-printing',
        ignoreFailures = false
      },
    },
  },
}


-- If you want to use this for rust and c, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp


