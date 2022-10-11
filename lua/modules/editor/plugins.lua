local plugin = require('core.pack').register_plugin
local conf = require('core.pack').conf_plugin('modules.editor')

plugin({ 'mg979/vim-visual-multi', config = conf('vim-visual-multi') })

plugin({ 'wellle/targets.vim', event = { 'BufNewFile', 'BufReadPost' } })

plugin({
    'ggandor/lightspeed.nvim',
    config = conf('lightspeed.nvim'),
    event = { 'BufNewFile', 'BufReadPost' },
})

plugin({
    'andymass/vim-matchup',
    event = { 'BufNewFile', 'BufReadPost' },
    config = conf('vim-matchup'),
})

plugin({
    'ojroques/vim-oscyank',
    config = conf('vim-oscyank'),
})

plugin({
    'kylechui/nvim-surround',
    event = { 'BufNewFile', 'BufReadPost' },
    config = conf('nvim-surround'),
})

plugin({
    'numToStr/Comment.nvim',
    config = conf('Comment.nvim'),
    event = { 'BufNewFile', 'BufReadPost' },
})

plugin({ 'Meow-2/antovim', cmd = { 'Antovim' } })
plugin({ 'godlygeek/tabular', cmd = { 'Tabularize' } })

plugin({ 'lambdalisue/suda.vim', event = { 'TextChanged', 'TextChangedI' } })
plugin({ 'lilydjwg/fcitx.vim', event = 'InsertEnter', config = conf('fcitx.vim') })
plugin({ 'glepnir/mcc.nvim', event = 'InsertEnter', config = conf('mcc.nvim') })

plugin({
    'windwp/nvim-autopairs',
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = conf('nvim-autopairs'),
})

plugin({
    'dhruvasagar/vim-table-mode',
    ft = { 'markdown' },
    config = conf('vim-table-mode'),
})

plugin({
    'dkarter/bullets.vim',
    ft = { 'markdown' },
    config = conf('bullets.vim'),
})
