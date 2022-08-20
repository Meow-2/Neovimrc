local plugin = require('core.pack').register_plugin
local conf = require('core.pack').conf_plugin('modules.dress')

plugin({ 'glepnir/zephyr-nvim', config = conf('zephyr-nvim') })
-- plugin({ 'navarasu/onedark.nvim', config = conf('onedark.nvim') })
-- plugin({
--     'projekt0n/github-nvim-theme',
--     config = conf('github-nvim-theme'),
-- })
-- plugin({ 'glepnir/zephyr-nvim' })
-- plugin({ 'navarasu/onedark.nvim' })
-- plugin({ 'projekt0n/github-nvim-theme' })
plugin({
    'akinsho/bufferline.nvim',
    -- setup = conf('zephyr-nvim'),
    -- setup = conf('onedark.nvim'),
    -- setup = conf('github-nvim-theme'),
    after = 'zephyr-nvim',
    config = conf('bufferline.nvim'),
    requires = 'kyazdani42/nvim-web-devicons',
})

plugin({ 'glepnir/dashboard-nvim', config = conf('dashboard-nvim') })

plugin({
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = conf('galaxyline.nvim'),
    requires = 'kyazdani42/nvim-web-devicons',
})

plugin({
    'kyazdani42/nvim-tree.lua',
    -- event = 'VimEnter',
    cmd = { 'SessionManager', 'NvimTreeToggle' },
    config = conf('nvim-tree.lua'),
    requires = 'kyazdani42/nvim-web-devicons',
    opt = true,
})

plugin({
    'lukas-reineke/indent-blankline.nvim',
    after = { 'nvim-treesitter' },
    config = conf('indent-blankline.nvim'),
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
-- plugin({ 'SmiteshP/nvim-navic', config = conf('nvim-navic'), requires = 'neovim/nvim-lspconfig' })
plugin({
    'folke/todo-comments.nvim',
    requires = 'plenary.nvim',
    event = { 'BufRead', 'BufNewFile' },
    config = conf('todo-comments-nvim'),
})
