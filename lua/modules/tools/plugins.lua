-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('core.pack').conf_plugin('modules.tools')

plugin({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf('telescope.nvim'),
  requires = {
    { 'nvim-lua/popup.nvim', opt = true },
    { 'nvim-lua/plenary.nvim'},
    { 'nvim-telescope/telescope-fzy-native.nvim', opt = true },
  },
})

plugin({'Shatur/neovim-session-manager', config= conf('neovim-session-manager'), requires={'plenary.nvim'}})

