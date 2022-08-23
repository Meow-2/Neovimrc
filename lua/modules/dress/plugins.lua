local plugin = require('core.pack').register_plugin
local conf = require('core.pack').conf_plugin('modules.dress')

local dark_light = function(mode)
    local theme_plugin
    local conf_gg
    if mode == 'dark' then
        plugin({ 'Meow-2/zephyr-nvim', config = conf('zephyr-nvim') })
        theme_plugin = 'zephyr-nvim'
        conf_gg = function()
            require('github-galaxyline').setup({ style = 'dark' })
        end
    elseif mode == 'light' then
        plugin({ 'Th3Whit3Wolf/one-nvim', config = conf('one-nvim') })
        theme_plugin = 'one-nvim'
        conf_gg = function()
            require('github-galaxyline').setup({ style = 'light' })
        end
    elseif mode == 'warm' then
        plugin({ 'sainnhe/everforest', config = conf('everforest') })
        theme_plugin = 'everforest'
        conf_gg = function()
            require('github-galaxyline').setup({ style = 'warm' })
        end
    end
    plugin({
        'akinsho/bufferline.nvim',
        event = 'BufReadPost',
        after = theme_plugin,
        config = conf('bufferline.nvim'),
        requires = 'kyazdani42/nvim-web-devicons',
    })

    plugin({
        'Meow-2/github-galaxyline',
        event = 'BufReadPost',
        after = { 'galaxyline.nvim', theme_plugin },
        config = conf_gg,
        requires = {
            {
                'glepnir/galaxyline.nvim',
                branch = 'main',
                requires = 'kyazdani42/nvim-web-devicons',
            },
        },
    })
end

dark_light('light')

plugin({ 'glepnir/dashboard-nvim', config = conf('dashboard-nvim') })

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
