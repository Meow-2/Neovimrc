-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('core.pack').conf_plugin('modules.completion')

local enable_lsp_filetype = {
  'c',
  'cpp',
  'cmake',
  'go',
  'json',
  'lua',
  'python',
  'sh',
  -- 'rust',
  -- 'typescript',
  -- 'typescriptreact',
}


plugin({
  'neovim/nvim-lspconfig',
  -- used filetype to lazyload lsp
  -- config your language filetype in here
  ft = enable_lsp_filetype,
  config = conf('nvim-lspconfig'),
})
plugin({ 'williamboman/mason.nvim' , config = conf('mason.nvim')})
plugin({ 'williamboman/mason-lspconfig.nvim',after = {'nvim-lspconfig'}, config = conf('mason-lspconfig.nvim') })
plugin({'glepnir/lspsaga.nvim',branch = 'main',config = conf('lspsaga.nvim')})

-- plugin({'williamboman/nvim-lsp-installer', after = 'nvim-lspconfig',config = conf('nvim-lsp-installer')})

-- plugin({'kosayoda/nvim-lightbulb'})
-- plugin({'ray-x/lsp_signature.nvim'})

plugin({
  'hrsh7th/nvim-cmp',
  -- event = 'BufReadPre',
  config = conf('nvim-cmp'),
  requires = {
    { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-lspconfig' },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
    { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' },
  },
})

plugin({
    'L3MON4D3/LuaSnip',
    -- event = 'InsertEnter',
    config = conf('LuaSnip')
})
