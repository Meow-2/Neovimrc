local g, opt = vim.g, vim.opt

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
g.loaded_matchit = 1
g.loaded_matchparen = 1
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
