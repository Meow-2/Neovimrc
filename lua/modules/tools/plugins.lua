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
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-live-grep-args.nvim' },
    -- {'nvim-telescope/telescope-dap.nvim'},
  },
})

plugin({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
plugin({ 'nvim-telescope/telescope-ui-select.nvim' })
plugin({ 'nvim-telescope/telescope-file-browser.nvim' })
-- plugin({'nvim-telescope/telescope-ui-select.nvim'})
-- plugin({'nvim-telescope/telescope-fzf-native.nvim', run = 'make'})
-- plugin({'nvim-telescope/telescope-dap.nvim'})
plugin({
  'nvim-treesitter/nvim-treesitter',
  -- event = 'BufRead',
  run = ':TSUpdate',
  -- after = {'telescope.nvim'},
  config = conf('nvim-treesitter'),
})

plugin({ 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' })

plugin({
  'Shatur/neovim-session-manager',
  -- cmd = 'SessionManager',
  config = conf('neovim-session-manager'),
})
plugin({ 'mhartington/formatter.nvim', config = conf('formatter.nvim') })
plugin({ 'voldikss/vim-floaterm', config = conf('vim-floaterm') })
plugin({ 'folke/which-key.nvim', config = conf('which-key.nvim') })
plugin({ 'skywind3000/asyncrun.vim' })
plugin({ 'skywind3000/asynctasks.vim', config = conf('asynctasks.vim') })

plugin({
  'iamcco/markdown-preview.nvim',
  run = 'cd app && npm install',
  setup = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  ft = { 'markdown' },
  config = conf('markdown-preview.nvim'),
})

plugin({ 'askfiy/nvim-picgo', ft = { 'markdown' }, config = conf('nvim-picgo') })
