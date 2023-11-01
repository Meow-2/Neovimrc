local g, opt = vim.g, vim.opt

local helper = require('lite.helper')
local cache_dir = helper.path_join(vim.fn.stdpath('cache'))

--disable_distribution_plugins
g.loaded_gzip = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1

opt.splitbelow = true
opt.splitright = true
opt.incsearch = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true
opt.wildignorecase = true
opt.wildignore =
    '.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**'
opt.backspace = 'indent,eol,start'
opt.ttimeoutlen = 50
opt.updatetime = 100
opt.virtualedit = 'block'
opt.showcmd = true
opt.directory = cache_dir .. 'swap/'
opt.undodir = cache_dir .. 'undo/'
opt.backupdir = cache_dir .. 'backup/'
opt.viewdir = cache_dir .. 'view/'
opt.spellfile = cache_dir .. 'spell/en.uft-8.add'
opt.undofile = true
