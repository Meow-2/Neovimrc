local plugin = require('core.pack').register_plugin
local conf = require('core.pack').conf_plugin('modules.debug')

-- plugin({'Meow-2/DAPInstall.nvim'})
plugin({ 'mfussenegger/nvim-dap', config = conf('nvim-dap') })
plugin({
    'theHamsta/nvim-dap-virtual-text',
    config = conf('nvim-dap-virtual-text'),
    requires = { 'mfussenegger/nvim-dap' },
})
plugin({
    'rcarriga/nvim-dap-ui',
    config = conf('nvim-dap-ui'),
    requires = { 'mfussenegger/nvim-dap' },
})

plugin({ 'sakhnik/nvim-gdb', run = './install.sh', config = conf('nvim-gdb') })
