local plugin = require('core.pack').register_plugin
local conf = require('core.pack').conf_plugin('modules.ui')

plugin({ 'glepnir/zephyr-nvim', config = conf('zephyr-nvim') })
plugin({ 'catppuccin/nvim', as = 'catppuccin' })
-- plugin({ 'rakr/vim-one', config = conf('vim-one') })

plugin({ 'glepnir/dashboard-nvim', config = conf('dashboard-nvim') })

plugin({
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = conf('galaxyline.nvim'),
    requires = 'kyazdani42/nvim-web-devicons',
})

plugin({
    'kyazdani42/nvim-tree.lua',
    -- cmd = 'NvimTreeToggle',
    config = conf('nvim-tree.lua'),
    requires = 'kyazdani42/nvim-web-devicons',
})

plugin({
    'akinsho/bufferline.nvim',
    config = conf('bufferline.nvim'),
    after = 'zephyr-nvim',
    requires = 'kyazdani42/nvim-web-devicons',
})

plugin({
    'lukas-reineke/indent-blankline.nvim',
    after = { 'nvim-treesitter' },
    config = conf('indent-blankline.nvim'),
})
plugin({ 'norcalli/nvim-colorizer.lua', config = conf('nvim-colorizer.lua') })

plugin({
    'lewis6991/gitsigns.nvim',
    event = { 'BufRead', 'BufNewFile' },
    config = conf('gitsigns.nvim'),
    requires = { 'nvim-lua/plenary.nvim' },
})
-- plugin({ 'SmiteshP/nvim-navic', config = conf('nvim-navic'), requires = 'neovim/nvim-lspconfig' })
plugin({
    'folke/todo-comments.nvim',
    requires = 'plenary.nvim',
    config = conf('todo-comments-nvim'),
})
