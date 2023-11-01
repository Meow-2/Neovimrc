local opt = vim.opt
local helper = require('vscode.helper')
-- remove check is windows because I only use mac or linux
local cache_dir = helper.path_join(vim.fn.stdpath('cache'))

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
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.directory = cache_dir .. 'swap/'
opt.undodir = cache_dir .. 'undo/'
opt.backupdir = cache_dir .. 'backup/'
opt.viewdir = cache_dir .. 'view/'
opt.spellfile = cache_dir .. 'spell/en.uft-8.add'
opt.history = 2000
opt.backupskip = '/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim'
opt.undofile = true
