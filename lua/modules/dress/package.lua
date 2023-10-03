local package = require('core.pack').package
local conf = require('core.pack'):config('modules.dress')

package({ 'Meow-2/zephyr-nvim', config = conf('zephyr-nvim') })

package({
    'glepnir/galaxyline.nvim',
    config = conf('galaxyline.nvim'),
    branch = 'main',
    dependencies = 'kyazdani42/nvim-web-devicons',
})

package({
    'akinsho/bufferline.nvim',
    event = 'BufReadPost',
    config = conf('bufferline.nvim'),
    dependencies = 'kyazdani42/nvim-web-devicons',
})

package({
    'glepnir/dashboard-nvim',
    -- commit = 'f7d623457d6621b25a1292b24e366fae40cb79ab',
    event = 'VimEnter',
    config = conf('dashboard-nvim'),
})

package({
    'NvChad/nvim-colorizer.lua',
    -- event = { 'BufRead', 'BufNewFile' },
    event = { 'VeryLazy' },
    config = conf('nvim-colorizer.lua'),
})

package({
    'lewis6991/gitsigns.nvim',
    -- event = { 'BufRead', 'BufNewFile' },
    event = { 'VeryLazy' },
    config = conf('gitsigns.nvim'),
})

package({
    'folke/todo-comments.nvim',
    -- event = { 'BufNewFile', 'BufRead' },
    event = { 'VeryLazy' },
    config = conf('todo-comments-nvim'),
    dependencies = { 'plenary.nvim', 'nvim-telescope/telescope.nvim' },
})

package({
    'lukas-reineke/indent-blankline.nvim',
    -- event = { 'BufNewFile', 'BufRead' },
    event = { 'VeryLazy' },
    main = "ibl",
    dependencies = { 'nvim-treesitter' },
    config = conf('indent-blankline.nvim'),
})
