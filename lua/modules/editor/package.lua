local package = require('core.pack').package
local conf = require('core.pack'):config('modules.editor')

package({ 'mg979/vim-visual-multi', init = conf('vim-visual-multi') })

-- package({
--     'wellle/targets.vim',
--     -- event = { 'BufNewFile', 'BufRead' }
--     event = { 'VeryLazy' },
-- })

package({
    'ggandor/lightspeed.nvim',
    config = conf('lightspeed.nvim'),
    -- event = { 'BufNewFile', 'BufRead' },
    event = { 'VeryLazy' },
})

-- package({
--     'andymass/vim-matchup',
--     -- event = { 'BufNewFile', 'BufRead' },
--     event = { 'VeryLazy' },
--     config = conf('vim-matchup'),
-- })

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

package({ 'Meow-2/antovim', cmd = { 'Antovim' } })
package({ 'godlygeek/tabular', cmd = { 'Tabularize' } })

package({ 'lambdalisue/suda.vim', event = { 'TextChanged', 'TextChangedI' } })
package({ 'lilydjwg/fcitx.vim', event = 'InsertEnter', config = conf('fcitx.vim') })
-- package({ 'glepnir/mcc.nvim', event = 'InsertEnter', config = conf('mcc.nvim') })
package({ 'glepnir/mutchar.nvim', event = 'InsertEnter', config = conf('mutchar.nvim') })

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
