call plug#begin('$HOME/.config/nvim/plugged')
Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'mg979/vim-visual-multi'
Plug 'tomtom/tcomment_vim'         " in <space>cn to comment a line
Plug 'theniceboy/antovim'          " gs to switch false and true
Plug 'tpope/vim-surround'          " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
" Plug 'godlygeek/tabular'           " ga, or :Tabularize <regex> to align
" Plug 'lambdalisue/suda.vim'
Plug 'wellle/targets.vim'
Plug 'lilydjwg/fcitx.vim' " auto chinese to english
" Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
" Plug 'dkarter/bullets.vim'
call plug#end()

source $HOME/.config/nvim/init/plugconf/nvim-treesitter.vim
source $HOME/.config/nvim/init/plugconf/tcomment_vim.vim
" source $HOME/.config/nvim/init/plugconf/antovim.vim
source $HOME/.config/nvim/init/plugconf/vim-markdown-toc.vim

autocmd BufNewFile,BufRead * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
