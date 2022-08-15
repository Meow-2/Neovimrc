-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('core.pack').conf_plugin('modules.dap')

-- plugin({'Meow-2/DAPInstall.nvim'})
plugin({'mfussenegger/nvim-dap'})
plugin({'theHamsta/nvim-dap-virtual-text'})
plugin({'rcarriga/nvim-dap-ui'})
