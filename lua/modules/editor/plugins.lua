-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('core.pack').conf_plugin('modules.editor')

plugin({ 'Meow-2/antovim'})
plugin({'lambdalisue/suda.vim'})
plugin({ 'godlygeek/tabular'})
plugin({'wellle/targets.vim'})
plugin({'andymass/vim-matchup', config = conf('vim-matchup')})
plugin({ 'lilydjwg/fcitx.vim' , config = conf('fcitx.vim')})
plugin({ 'ojroques/vim-oscyank', config = conf('vim-oscyank')})
plugin({ 'mg979/vim-visual-multi', config = conf('vim-visual-multi')})
plugin({ 'terrortylor/nvim-comment' , config = conf('nvim-comment')})
plugin({ 'windwp/nvim-autopairs', config = conf('nvim-autopairs')})
plugin({ 'kylechui/nvim-surround' , config = conf('nvim-surround')})
plugin({ 'ethanholz/nvim-lastplace' , config = conf('nvim-lastplace')})
plugin({'dhruvasagar/vim-table-mode'})

-- plugin({ 'abecodes/tabout.nvim', after = {'nvim-treesitter'}, config = conf('tabout.nvim'), requires = {'nvim-treesitter'}})
