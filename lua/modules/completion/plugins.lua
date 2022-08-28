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
}

plugin({
    'neovim/nvim-lspconfig',
    ft = enable_lsp_filetype,
    config = conf('nvim-lspconfig'),
    requires = {
        { 'williamboman/mason.nvim', after = { 'nvim-lspconfig' }, config = conf('mason.nvim') },
        {
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            after = { 'nvim-lspconfig', 'mason.nvim' },
            config = conf('mason-tool-installer.nvim'),
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

plugin({
    'L3MON4D3/LuaSnip',
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = conf('LuaSnip'),
})

plugin({
    'hrsh7th/nvim-cmp',
    after = { 'nvim-autopairs', 'LuaSnip' },
    config = conf('nvim-cmp'),
    requires = {
        { 'hrsh7th/cmp-nvim-lsp', after = { 'nvim-cmp', 'nvim-lspconfig' } },
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
        { 'saadparwaiz1/cmp_luasnip', after = { 'nvim-cmp', 'LuaSnip' } },
    },
})
