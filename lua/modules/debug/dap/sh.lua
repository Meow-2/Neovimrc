local dap = require('dap')

dap.adapters.sh = {
    type = 'executable',
    command = 'bash-debug-adapter',
}
