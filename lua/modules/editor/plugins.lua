local plugin = require('core.pack').register_plugin
local conf = require('core.pack').conf_plugin('modules.editor')

plugin({ 'mg979/vim-visual-multi', config = conf('vim-visual-multi') })
plugin({ 'lambdalisue/suda.vim', event = 'InsertEnter' })
plugin({ 'lilydjwg/fcitx.vim', event = 'InsertEnter', config = conf('fcitx.vim') })
plugin({ 'glepnir/mcc.nvim', event = { 'InsertEnter' }, config = conf('mcc.nvim') })
plugin({ 'Meow-2/antovim', event = 'BufReadPost' })
plugin({ 'godlygeek/tabular', event = 'BufReadPost' })
plugin({ 'wellle/targets.vim', event = 'BufReadPost' })
plugin({ 'andymass/vim-matchup', event = 'BufReadPost', config = conf('vim-matchup') })
plugin({ 'ojroques/vim-oscyank', event = 'BufReadPost', config = conf('vim-oscyank') })
plugin({ 'terrortylor/nvim-comment', event = 'BufReadPost', config = conf('nvim-comment') })
plugin({ 'kylechui/nvim-surround', event = 'BufReadPost', config = conf('nvim-surround') })

plugin({
    'windwp/nvim-autopairs',
    event = { 'InsertEnter', 'CmdwinEnter' },
    config = conf('nvim-autopairs'),
})
plugin({
    'dhruvasagar/vim-table-mode',
    event = 'BufReadPost',
    ft = { 'markdown' },
    config = conf('vim-table-mode'),
})
plugin({
    'dkarter/bullets.vim',
    event = { 'InsertEnter' },
    ft = { 'markdown' },
    config = conf('bullets.vim'),
})
