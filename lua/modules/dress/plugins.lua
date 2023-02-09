local package = require('core.pack').package
local conf = require('core.pack').conf_package('modules.dress')

package({ 'Meow-2/zephyr-nvim', config = conf('zephyr-nvim') })
-- plugin({ 'projekt0n/github-nvim-theme', config = conf('github-nvim-theme') })

-- plugin({
--     'Meow-2/github-galaxyline',
--     event = 'BufReadPost',
--     after = { 'galaxyline.nvim' },
--     config = function()
--         require('github-galaxyline').setup({ style = 'dark' })
--     end,
--     requires = {
--         {
--             'glepnir/galaxyline.nvim',
--             branch = 'main',
--             requires = 'kyazdani42/nvim-web-devicons',
--         },
--     },
-- })
--
package({
    'glepnir/galaxyline.nvim',
    config = conf('galaxyline.nvim'),
    branch = 'main',
    requires = 'kyazdani42/nvim-web-devicons',
})

package({
    'akinsho/bufferline.nvim',
    event = 'BufReadPost',
    config = conf('bufferline.nvim'),
    requires = 'kyazdani42/nvim-web-devicons',
})

package({
    'glepnir/dashboard-nvim',
    commit = 'f7d623457d6621b25a1292b24e366fae40cb79ab',
    event = 'VimEnter',
    config = conf('dashboard-nvim'),
})

package({
    'NvChad/nvim-colorizer.lua',
    event = { 'BufRead', 'BufNewFile' },
    config = conf('nvim-colorizer.lua'),
})

package({
    'lewis6991/gitsigns.nvim',
    event = { 'BufRead', 'BufNewFile' },
    config = conf('gitsigns.nvim'),
    requires = { 'nvim-lua/plenary.nvim' },
})

package({
    'folke/todo-comments.nvim',
    event = { 'BufNewFile', 'BufReadPost' },
    config = conf('todo-comments-nvim'),
    requires = 'plenary.nvim',
})

package({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = { 'BufNewFile', 'BufReadPost' },
    config = conf('nvim-treesitter'),
    requires = {
        { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
    },
})

package({
    'lukas-reineke/indent-blankline.nvim',
    after = { 'nvim-treesitter' },
    config = conf('indent-blankline.nvim'),
})
