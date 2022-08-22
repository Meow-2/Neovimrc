local plugin = require('core.pack').register_plugin
local conf = require('core.pack').conf_plugin('modules.dress')

plugin({ 'Meow-2/zephyr-nvim', config = conf('zephyr-nvim') })
-- plugin({ 'projekt0n/github-nvim-theme', config = conf('github-nvim-theme') })
-- plugin({ 'nvim-lualine/lualine.nvim' })

plugin({
    'akinsho/bufferline.nvim',
    after = 'zephyr-nvim',
    config = conf('bufferline.nvim'),
    requires = 'kyazdani42/nvim-web-devicons',
})

plugin({ 'glepnir/dashboard-nvim', config = conf('dashboard-nvim') })

plugin({
    'glepnir/galaxyline.nvim',
    branch = 'main',
    requires = 'kyazdani42/nvim-web-devicons',
})

plugin({
    'Meow-2/github-galaxyline',
    after = { 'galaxyline.nvim', 'zephyr-nvim' },
    config = conf('github-galaxyline.nvim'),
})

plugin({
    'NvChad/nvim-colorizer.lua',
    event = { 'BufRead', 'BufNewFile' },
    config = conf('nvim-colorizer.lua'),
})

plugin({
    'lewis6991/gitsigns.nvim',
    event = { 'BufRead', 'BufNewFile' },
    config = conf('gitsigns.nvim'),
    requires = { 'nvim-lua/plenary.nvim' },
})

plugin({
    'folke/todo-comments.nvim',
    event = { 'BufNewFile', 'BufReadPost' },
    config = conf('todo-comments-nvim'),
    requires = 'plenary.nvim',
})

plugin({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = { 'BufNewFile', 'BufReadPost' },
    config = conf('nvim-treesitter'),
    requires = {
        { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
    },
})

plugin({
    'lukas-reineke/indent-blankline.nvim',
    after = { 'nvim-treesitter' },
    config = conf('indent-blankline.nvim'),
})
