local package = require('core.pack').package
local conf = require('core.pack'):config('modules.editor')

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
})
-- package({
--     'wellle/targets.vim',
--     -- event = { 'BufNewFile', 'BufRead' }
--     event = { 'VeryLazy' },
-- })

-- package({
--     'phaazon/hop.nvim',
--     branch = 'v2',
--     config = conf('hop.nvim'),
-- })

package({
    'folke/flash.nvim',
    event = 'VeryLazy',
    config = conf('flash.nvim'),
    -- stylua: ignore
    keys = {
        { "?", mode = "n", function() require("flash").remote() end, desc = "Remote Flash" },
    },
})
-- package({
--     'ggandor/lightspeed.nvim',
--     config = conf('lightspeed.nvim'),
--     -- event = { 'BufNewFile', 'BufRead' },
--     event = { 'VeryLazy' },
-- })

package({
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    -- event = { 'BufNewFile', 'BufRead' },
    event = { 'VeryLazy' },
    config = conf('nvim-treesitter'),
    dependencies = {
        { 'nvim-treesitter/nvim-treesitter-textobjects' },
        { 'windwp/nvim-ts-autotag' },
        -- { 'nvim-treesitter/nvim-treesitter-context', config = conf('nvim-treesitter-context') },
    },
})

package({ 'andymass/vim-matchup', config = conf('vim-matchup') })

package({
    'luckasRanarison/tree-sitter-hyprlang',
    -- config = conf('tree-sitter-hyprlang'),
    dependencies = {
        { 'nvim-treesitter/nvim-treesitter' },
    },
})

package({
    'HiPhish/rainbow-delimiters.nvim',
    event = { 'VeryLazy' },
    config = conf('rainbow-delimiters.nvim'),
})

-- package({
--     'ojroques/vim-oscyank',
--     config = conf('vim-oscyank'),
-- })

package({
    'kylechui/nvim-surround',
    -- event = { 'BufNewFile', 'BufRead' },
    event = { 'VeryLazy' },
    config = conf('nvim-surround'),
})

package({
    'numToStr/Comment.nvim',
    -- event = { 'BufNewFile', 'BufRead' },
    event = { 'VeryLazy' },
    config = conf('Comment.nvim'),
})

-- package({ 'Meow-2/antovim', cmd = { 'Antovim' } })
package({ 'godlygeek/tabular', cmd = { 'Tabularize' } })

package({ 'lambdalisue/suda.vim', event = { 'TextChanged', 'TextChangedI' } })
package({ 'lilydjwg/fcitx.vim', event = 'InsertEnter', config = conf('fcitx.vim') })
-- package({ 'glepnir/mcc.nvim', event = 'InsertEnter', config = conf('mcc.nvim') })
-- package({ 'glepnir/mutchar.nvim', config = conf('mutchar.nvim') })

package({
    'windwp/nvim-autopairs',
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = conf('nvim-autopairs'),
})

-- package({
--     'dhruvasagar/vim-table-mode',
--     ft = { 'markdown' },
--     config = conf('vim-table-mode'),
-- })
--
-- package({
--     'dkarter/bullets.vim',
--     ft = { 'markdown' },
--     config = conf('bullets.vim'),
-- })
