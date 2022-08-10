-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('core.pack').conf_plugin('modules.editor')


-- plugin({
--   'glepnir/galaxyline.nvim',
--   branch = 'main',
--   config = conf('galaxyline.nvim'),
--   requires = 'kyazdani42/nvim-web-devicons',
-- })
-- 
-- plugin({
--   'kyazdani42/nvim-tree.lua',
--   cmd = 'NvimTreeToggle',
--   config = conf('nvim-tree.lua'),
--   requires = 'kyazdani42/nvim-web-devicons',
-- })

plugin({ 'Meow-2/antovim'})
plugin({'lambdalisue/suda.vim'})
plugin({ 'lilydjwg/fcitx.vim' })
plugin({ 'godlygeek/tabular'})
plugin({ 'ojroques/vim-oscyank', config = conf('vim-oscyank')})
plugin({ 'mg979/vim-visual-multi', config = conf('vim-visual-multi')})
plugin({ 'terrortylor/nvim-comment' , config = conf('nvim-comment')})
plugin({ 'windwp/nvim-autopairs', config = conf('nvim-autopairs')})
plugin({ 'kylechui/nvim-surround' , config = conf('nvim-surround')}) -- map
-- plugin({ 'abecodes/tabout.nvim', after = {'nvim-treesitter'}, config = conf('tabout.nvim'), requires = {'nvim-treesitter'}})
