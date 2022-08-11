-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('core.pack').conf_plugin('modules.tools')


plugin({
  'nvim-telescope/telescope.nvim',
  -- cmd = 'Telescope',
  tag = '0.1.0',
  config = conf('telescope.nvim'),
  requires = {
    { 'nvim-lua/popup.nvim',},
    { 'nvim-lua/plenary.nvim'},
    { 'nvim-telescope/telescope-live-grep-args.nvim' },
    -- {'nvim-telescope/telescope-dap.nvim'},
  },
})

plugin({'nvim-telescope/telescope-fzf-native.nvim', run = 'make'})
plugin({'nvim-telescope/telescope-ui-select.nvim'})
plugin({'nvim-telescope/telescope-file-browser.nvim'})
-- plugin({'nvim-telescope/telescope-ui-select.nvim'})
-- plugin({'nvim-telescope/telescope-fzf-native.nvim', run = 'make'})
-- plugin({'nvim-telescope/telescope-dap.nvim'})

plugin({
    'Shatur/neovim-session-manager', 
    -- cmd = 'SessionManager',
    config= conf('neovim-session-manager'),
    requires={'plenary.nvim'},
})

