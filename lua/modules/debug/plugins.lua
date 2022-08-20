local plugin = require('core.pack').register_plugin
local conf = require('core.pack').conf_plugin('modules.debug')

-- plugin({'Meow-2/DAPInstall.nvim'})
plugin({
    'mfussenegger/nvim-dap',
    config = conf('nvim-dap'),
    -- after = 'telescope.nvim',
    ft = { 'c', 'cpp', 'go', 'python', 'lua' },
    requires = {
        {
            'theHamsta/nvim-dap-virtual-text',
            config = conf('nvim-dap-virtual-text'),
            after = { 'nvim-dap' },
        },
        {
            'rcarriga/nvim-dap-ui',
            config = conf('nvim-dap-ui'),
            after = { 'nvim-dap' },
        },
    },
})

-- plugin({
--     'theHamsta/nvim-dap-virtual-text',
--     config = conf('nvim-dap-virtual-text'),
--     requires = { 'mfussenegger/nvim-dap' },
-- })
-- plugin({
--     'rcarriga/nvim-dap-ui',
--     config = conf('nvim-dap-ui'),
--     requires = { 'mfussenegger/nvim-dap' },
-- })

plugin({
    'sakhnik/nvim-gdb',
    ft = { 'c', 'cpp' },
    run = './install.sh',
    config = conf('nvim-gdb'),
})
plugin({
    'michaelb/sniprun',
    ft = { 'c', 'cpp', 'lua', 'go', 'python' },
    run = 'bash ./install.sh',
    config = conf('sniprun'),
})
