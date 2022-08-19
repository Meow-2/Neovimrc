local plugin = require('core.pack').register_plugin
local conf = require('core.pack').conf_plugin('modules.completion')

local enable_lsp_filetype = {
    'c',
    'cpp',
    'cmake',
    'go',
    'json',
    'lua',
    'markdown',
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
    requires = {
        { 'williamboman/mason.nvim', after = { 'nvim-lspconfig' }, config = conf('mason.nvim') },
        {
            'williamboman/mason-lspconfig.nvim',
            after = { 'nvim-lspconfig', 'mason.nvim' },
            config = conf('mason-lspconfig.nvim'),
        },
        {
            'glepnir/lspsaga.nvim',
            after = { 'nvim-lspconfig' },
            branch = 'main',
            config = conf('lspsaga.nvim'),
        },
        {
            'ray-x/lsp_signature.nvim',
            after = { 'nvim-lspconfig' },
            config = conf('lsp_signature.nvim'),
        },
    },
})
-- plugin({ 'williamboman/mason.nvim', config = conf('mason.nvim') })
-- plugin({
--     'williamboman/mason-lspconfig.nvim',
--     after = { 'nvim-lspconfig' },
--     config = conf('mason-lspconfig.nvim'),
-- })
-- plugin({ 'glepnir/lspsaga.nvim', branch = 'main', config = conf('lspsaga.nvim') })
--
-- plugin({ 'ray-x/lsp_signature.nvim', config = conf('lsp_signature.nvim') })

plugin({
    'L3MON4D3/LuaSnip',
    event = { 'InsertEnter', 'CmdwinEnter' },
    config = conf('LuaSnip'),
})

plugin({
    'hrsh7th/nvim-cmp',
    after = 'LuaSnip',
    config = conf('nvim-cmp'),
    requires = {
        { 'hrsh7th/cmp-nvim-lsp', after = { 'nvim-cmp', 'nvim-lspconfig' } },
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
        { 'saadparwaiz1/cmp_luasnip', after = { 'nvim-cmp', 'LuaSnip' } },
    },
})
