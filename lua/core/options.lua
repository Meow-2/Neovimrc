local opt = vim.opt
local helper = require('core.helper')
-- remove check is windows because I only use mac or linux
local cache_dir = helper.path_join(vim.fn.stdpath('cache'))

opt.termguicolors = true
opt.mouse = 'a'
opt.selectmode = 'mouse'
opt.mousemoveevent = true
opt.errorbells = true
opt.visualbell = true
opt.hidden = true
opt.fileformats = 'unix,mac,dos'
opt.magic = true
opt.virtualedit = 'block'
opt.encoding = 'utf-8'
-- opt.viewoptions = 'folds,cursor,curdir,slash,unix'
vim.o.sessionoptions = 'buffers,curdir,folds,winpos,winsize'
opt.wildignorecase = true
opt.wildignore =
    '.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**'
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.directory = cache_dir .. 'swap/'
opt.undodir = cache_dir .. 'undo/'
opt.backupdir = cache_dir .. 'backup/'
opt.viewdir = cache_dir .. 'view/'
opt.spellfile = cache_dir .. 'spell/en.uft-8.add'
opt.history = 2000
opt.shada = "!,'300,<50,@100,s10,h"
opt.backupskip = '/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim'
opt.smarttab = true
opt.shiftround = true
opt.timeout = true
opt.ttimeout = true
opt.timeoutlen = 500
opt.ttimeoutlen = 50
opt.updatetime = 100
opt.lazyredraw = false
opt.redrawtime = 2000
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true
opt.incsearch = true
opt.wrapscan = true
opt.complete = '.,w,b,k'
opt.inccommand = 'nosplit'
opt.grepformat = '%f:%l:%c:%m'
opt.grepprg = 'rg --hidden --vimgrep --smart-case --'
opt.breakat = [[\ \	;:,!?]]
opt.startofline = false
opt.whichwrap = '<,>,[,],~'
opt.splitbelow = true
opt.splitright = true
opt.switchbuf = 'useopen'
opt.backspace = 'indent,eol,start'
opt.diffopt = 'filler,iwhite,internal,algorithm:patience'
opt.completeopt = 'menu,menuone,noselect'
opt.jumpoptions = 'stack'
opt.showmode = false
opt.shortmess = 'aoOTIcF'
opt.scrolloff = 2
opt.sidescrolloff = 5
opt.ruler = false
opt.list = true
opt.showtabline = 2
opt.winwidth = 30
opt.winminwidth = 10
opt.pumheight = 15
opt.helpheight = 12
opt.previewheight = 12
opt.showcmd = true
-- opt.cmdheight = 0
opt.cmdwinheight = 5
opt.equalalways = false
opt.laststatus = 3
opt.display = 'lastline'
opt.showbreak = '↳  '
opt.listchars = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←'
opt.fillchars = 'eob: '
opt.pumblend = 0
opt.winblend = 0
opt.undofile = true
opt.synmaxcol = 2500
opt.formatoptions = '1jql'
opt.textwidth = 80
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = -1
opt.breakindentopt = 'shift:4,min:20'
opt.wrap = false
opt.linebreak = true
opt.number = true
opt.signcolumn = 'yes'
opt.cursorlineopt = 'number'
-- opt.conceallevel = 2
-- opt.concealcursor = 'niv'
-- opt.guifont = [[FiraCode Nerd Font Mono:h15]]

opt.foldenable = true
opt.foldmethod = 'marker'
opt.foldmarker = '{{{,}}}'
opt.foldminlines = 1

vim.g.remoteSession = os.getenv('SSH_TTY') and true or false
vim.g.python_host_prog = '/usr/bin/python'
vim.g.python3_host_prog = '/usr/bin/python3'

vim.g.barbaric_ime = 'fcitx5'
