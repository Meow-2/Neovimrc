local package = require('core.pack').package
local conf = require('core.pack'):config('modules.completion')

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

package({
    'neovim/nvim-lspconfig',
    ft = enable_lsp_filetype,
    config = conf('nvim-lspconfig'),
    dependencies = {
        {
            'glepnir/lspsaga.nvim',
            branch = 'main',
            config = conf('lspsaga.nvim'),
        },
        {
            'ray-x/lsp_signature.nvim',
            config = conf('lsp_signature.nvim'),
        },
        {
            'williamboman/mason.nvim',
            config = conf('mason.nvim'),
            dependencies = {
                {
                    'WhoIsSethDaniel/mason-tool-installer.nvim',
                    config = conf('mason-tool-installer.nvim'),
                },
            },
        },
    },
})

package({
    'L3MON4D3/LuaSnip',
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = conf('LuaSnip'),
})

package({
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = conf('nvim-cmp'),
    dependencies = {
        { 'windwp/nvim-autopairs' },
        { 'hrsh7th/cmp-nvim-lsp', dependencies = 'nvim-lspconfig' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-cmdline' },
        { 'rcarriga/cmp-dap', dependencies = 'nvim-dap' },
        { 'saadparwaiz1/cmp_luasnip', dependencies = 'LuaSnip' },
        -- { 'hrsh7th/cmp-nvim-lsp-signature-help', dependencies = 'nvim-cmp' },
    },
})
