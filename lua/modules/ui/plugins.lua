-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('core.pack').conf_plugin('modules.ui')

plugin({ 'glepnir/zephyr-nvim', config = conf('zephyr-nvim') })

plugin({ 'glepnir/dashboard-nvim', config = conf('dashboard-nvim') })

plugin({
  'glepnir/galaxyline.nvim',
  branch = 'main',
  config = conf('galaxyline.nvim'),
  requires = 'kyazdani42/nvim-web-devicons',
})

plugin({
  'kyazdani42/nvim-tree.lua',
  cmd = 'NvimTreeToggle',
  config = conf('nvim-tree.lua'),
  requires = 'kyazdani42/nvim-web-devicons',
})

plugin({ 'akinsho/nvim-bufferline.lua', config = conf('nvim-bufferline.lua'), requires = 'kyazdani42/nvim-web-devicons' })
