local package = require('core.pack').package
local conf = require('core.pack').conf_package('modules.editor')

package({ 'mg979/vim-visual-multi', config = conf('vim-visual-multi') })

package({ 'wellle/targets.vim', event = { 'BufNewFile', 'BufReadPost' } })

package({
    'ggandor/lightspeed.nvim',
    config = conf('lightspeed.nvim'),
    event = { 'BufNewFile', 'BufReadPost' },
})

package({
    'andymass/vim-matchup',
    event = { 'BufNewFile', 'BufReadPost' },
    config = conf('vim-matchup'),
})

package({
    'ojroques/vim-oscyank',
    config = conf('vim-oscyank'),
})

package({
    'kylechui/nvim-surround',
    event = { 'BufNewFile', 'BufReadPost' },
    config = conf('nvim-surround'),
})

package({
    'numToStr/Comment.nvim',
    config = conf('Comment.nvim'),
    event = { 'BufNewFile', 'BufReadPost' },
})

package({ 'Meow-2/antovim', cmd = { 'Antovim' } })
package({ 'godlygeek/tabular', cmd = { 'Tabularize' } })

package({ 'lambdalisue/suda.vim', event = { 'TextChanged', 'TextChangedI' } })
package({ 'lilydjwg/fcitx.vim', event = 'InsertEnter', config = conf('fcitx.vim') })
package({ 'glepnir/mcc.nvim', event = 'InsertEnter', config = conf('mcc.nvim') })

package({
    'windwp/nvim-autopairs',
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = conf('nvim-autopairs'),
})

package({
    'dhruvasagar/vim-table-mode',
    ft = { 'markdown' },
    config = conf('vim-table-mode'),
})

package({
    'dkarter/bullets.vim',
    ft = { 'markdown' },
    config = conf('bullets.vim'),
})
