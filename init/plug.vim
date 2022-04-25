
call plug#begin('$HOME/.config/nvim/plugged')
"+--------------------------------------------------------------------+
"|                                                                    |
"|                                LSP                                 |
"|                                                                    |
"+--------------------------------------------------------------------+
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'OmniSharp/omnisharp-vim'


"+--------------------------------------------------------------------+
"|                                                                    |
"|                              MARKDOWM                              |
"|                                                                    |
"+--------------------------------------------------------------------+
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'Meow-2/bullets.vim', { 'branch': 'solve_CR_conflict_with_coc' }
Plug 'ferrine/md-img-paste.vim'
 

"+--------------------------------------------------------------------+
"|                                                                    |
"|                        EDITOR ENHANCEMENT                          |
"|                                                                    |
"+--------------------------------------------------------------------+
" Plug 'glepnir/indent-guides.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-visual-multi'
Plug 'windwp/nvim-autopairs'
Plug 'tomtom/tcomment_vim'
Plug 'Meow-2/antovim'
Plug 'tpope/vim-surround'
Plug 'lambdalisue/suda.vim'
Plug 'wellle/targets.vim'
Plug 'lilydjwg/fcitx.vim'
Plug 'itchyny/vim-cursorword'
Plug 'ojroques/vim-oscyank'
Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
Plug 'abecodes/tabout.nvim'
" Plug 'unblevable/quick-scope'


"+--------------------------------------------------------------------+
"|                                                                    |
"|                            DRESSING UP                             |
"|                                                                    |
"+--------------------------------------------------------------------+
" ------------------------------------------
"               start buffer
" ------------------------------------------
Plug 'glepnir/dashboard-nvim'
" Plug 'mhinz/vim-startify'

" ------------------------------------------
"                 icons
" ------------------------------------------
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" ------------------------------------------
"              color themes
" ------------------------------------------
" Plug 'Meow-2/one_monokai.nvim'
" Plug 'glepnir/zephyr-nvim'
" Plug 'PHSix/nvim-hybrid'
" Plug 'theniceboy/nvim-deus'
" Plug 'glepnir/oceanic-material'
Plug 'rakr/vim-one'
" Plug 'olimorris/onedarkpro.nvim'
" Plug 'projekt0n/github-nvim-theme'
" Plug 'navarasu/onedark.nvim'

" ------------------------------------------
"              status line
" ------------------------------------------
Plug 'akinsho/bufferline.nvim'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
" Plug 'feline-nvim/feline.nvim'
" Plug 'nvim-lualine/lualine.nvim'
" Plug 'mg979/vim-xtabline'
" Plug 'NTBBloodbath/galaxyline.nvim'
" Plug 'glepnir/spaceline.vim'


"+--------------------------------------------------------------------+
"|                                                                    |
"|                         DEVELOPMENT TOOL                          |
"|                                                                    |
"+--------------------------------------------------------------------+
"-------------------------------------------
"             useful tool
"-------------------------------------------
Plug 'sindrets/winshift.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'folke/which-key.nvim'

" ------------------------------------------
"              taglist
" ------------------------------------------
Plug 'liuchengxu/vista.vim'        

" ------------------------------------------
"         comment to document
" ------------------------------------------
Plug 'babaybus/DoxygenToolkit.vim'

" ------------------------------------------
"             treesitter
" ------------------------------------------
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
" Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} .p

" ------------------------------------------
"            session-manager
" ------------------------------------------
Plug 'nvim-lua/plenary.nvim'        " dependency of neovim-session-manager and telescope
Plug 'Shatur/neovim-session-manager'
Plug 'stevearc/dressing.nvim'       " select menu
" Plug 'lewis6991/impatient.nvim'
" Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-ui-select.nvim'

" ------------------------------------------
"             run and debug
" ------------------------------------------
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'
" Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-rust --enable-python '}
Plug 'Meow-2/DAPInstall.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/nvim-dap-ui'

" ------------------------------------------
"             File navigation
" ------------------------------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'junegunn/fzf.vim'
Plug 'kevinhwang91/rnvimr'
Plug 'lewis6991/gitsigns.nvim'
" Plug 'airblade/vim-gitgutter'
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" Plug 'theniceboy/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }

call plug#end()

if g:nvim_plugins_installation_completed == 1

" lua require('impatient')
" lua require'impatient'.enable_profile()
"lsp
source $HOME/.config/nvim/init/plugconf/coc-nvim.vim
" source $HOME/.config/nvim/init/plugconf/omnisharp-vim.vim

"markdown
source $HOME/.config/nvim/init/plugconf/vim-table-mode.vim
source $HOME/.config/nvim/init/plugconf/vim-markdown-toc.vim
source $HOME/.config/nvim/init/plugconf/bullets.vim
source $HOME/.config/nvim/init/plugconf/md-img-paste-vim.vim

"editor enhancement
source $HOME/.config/nvim/init/plugconf/indent-blankline-nvim.vim
source $HOME/.config/nvim/init/plugconf/vim-visual-multi.vim
source $HOME/.config/nvim/init/plugconf/nvim-autopairs.vim
source $HOME/.config/nvim/init/plugconf/tcomment_vim.vim
source $HOME/.config/nvim/init/plugconf/vim-surround.vim
source $HOME/.config/nvim/init/plugconf/vim-cursorword.vim
source $HOME/.config/nvim/init/plugconf/vim-oscyank.vim
source $HOME/.config/nvim/init/plugconf/tabular.vim
source $HOME/.config/nvim/init/plugconf/tabout-nvim.vim

"dressing up
source $HOME/.config/nvim/init/plugconf/dashboard.vim
source $HOME/.config/nvim/init/plugconf/colorscheme.vim
source $HOME/.config/nvim/init/plugconf/bufferline-nvim.vim
source $HOME/.config/nvim/init/plugconf/lightline.vim
" source $HOME/.config/nvim/init/plugconf/feline-nvim.vim

"development tool
source $HOME/.config/nvim/init/plugconf/winshift-nvim.vim
source $HOME/.config/nvim/init/plugconf/vim-floaterm.vim
"to be configured
source $HOME/.config/nvim/init/plugconf/which-key-nvim.vim
source $HOME/.config/nvim/init/plugconf/Vista-vim.vim
source $HOME/.config/nvim/init/plugconf/DoxygenToolkit.vim
source $HOME/.config/nvim/init/plugconf/nvim-treesitter.vim
source $HOME/.config/nvim/init/plugconf/neovim-session-manager.vim
source $HOME/.config/nvim/init/plugconf/dressing-nvim.vim
source $HOME/.config/nvim/init/plugconf/asyncrun-vim.vim
source $HOME/.config/nvim/init/plugconf/asynctasks-vim.vim
" source $HOME/.config/nvim/init/plugconf/vimspector.vim

source $HOME/.config/nvim/lua/dapconf/nvim-dap.vim

source $HOME/.config/nvim/init/plugconf/fzf.vim
source $HOME/.config/nvim/init/plugconf/fzf-lua.vim
source $HOME/.config/nvim/init/plugconf/rnvimr.vim
source $HOME/.config/nvim/init/plugconf/gitsigns-nvim.vim
" source $HOME/.config/nvim/init/plugconf/vim-gitgutter.vim

" source $HOME/.config/nvim/init/plugconf/telescope-nvim.vim
" source $HOME/.config/nvim/init/plugconf/telescope-ui-select-nvim.vim
" source $HOME/.config/nvim/init/plugconf/guihua-lua.vim
" source $HOME/.config/nvim/init/plugconf/fzf-gitignore.vim
" source $HOME/.config/nvim/init/plugconf/Leaderf.vim
" source $HOME/.config/nvim/init/plugconf/lualine-nvim.vim

endif

" auto comment disabled
au BufNewFile,BufRead * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
