local package = require('lite.pack').package
local conf = require('lite.pack'):config('modules.editor')
local cmd = require('lite.helper').cmd

package({
    'mg979/vim-visual-multi',
    keys = {
        { '<C-l>', mode = 'n' },
        { '<C-l>', mode = 'v' },
        { '<C-n>', mode = 'n' },
        { '<C-n>', mode = 'v' },
        { '<C-S-a>', mode = 'n' },
        { '<C-S-a>', mode = 'v' },
    },
    init = conf('vim-visual-multi'),
})

package({
    'AndrewRadev/switch.vim',
    cmd = { 'Switch' },
    config = conf('switch.vim'),
    keys = {
        { 'gs', cmd('Switch'), mode = 'n', desc = 'Switch Word', { noremap = true } },
    },
})

package({
    'folke/flash.nvim',
    event = 'VeryLazy',
    config = conf('flash.nvim'),
    -- stylua: ignore
    keys = {
        { "?", mode = "n", function() require("flash").remote() end, desc = "Remote Flash" },
    },
})

package({
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    -- event = { 'BufNewFile', 'BufRead' },
    event = { 'VeryLazy' },
    config = conf('nvim-treesitter'),
    dependencies = {
        { 'nvim-treesitter/nvim-treesitter-textobjects' },
        -- { 'windwp/nvim-ts-autotag' },
        -- { 'nvim-treesitter/nvim-treesitter-context', config = conf('nvim-treesitter-context') },
    },
})

package({
    'luckasRanarison/tree-sitter-hyprlang',
    -- config = conf('tree-sitter-hyprlang'),
    dependencies = {
        { 'nvim-treesitter/nvim-treesitter' },
    },
})

package({
    'kylechui/nvim-surround',
    -- event = { 'BufNewFile', 'BufRead' },
    event = { 'VeryLazy' },
    config = conf('nvim-surround'),
})

package({
    'godlygeek/tabular',
    cmd = { 'Tabularize' },
    keys = {
        { '=', [[:Tabularize /]], mode = 'v', { noremap = true } },
    },
})

package({ 'lilydjwg/fcitx.vim', event = 'InsertEnter', config = conf('fcitx.vim') })
