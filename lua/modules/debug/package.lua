local package = require('core.pack').package
local conf = require('core.pack'):config('modules.debug')

package({
    'mfussenegger/nvim-dap',
    config = conf('nvim-dap'),
    ft = { 'c', 'cpp', 'go', 'python' },
    dependencies = {
        {
            'theHamsta/nvim-dap-virtual-text',
            config = conf('nvim-dap-virtual-text'),
        },
        {
            'rcarriga/nvim-dap-ui',
            config = conf('nvim-dap-ui'),
        },
        {
            'nvim-telescope/telescope-dap.nvim',
            config = function()
                require('telescope').load_extension('dap')
            end,
        },
        { 'nvim-neotest/nvim-nio' },
    },
})

package({
    'sakhnik/nvim-gdb',
    ft = { 'c', 'cpp' },
    build = './install.sh',
    config = conf('nvim-gdb'),
})

-- package({
--     'michaelb/sniprun',
--     ft = { 'c', 'cpp', 'lua', 'go', 'python' },
--     build = 'bash ./install.sh',
--     config = conf('sniprun'),
-- })
