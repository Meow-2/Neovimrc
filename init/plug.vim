
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
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-visual-multi'
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'theniceboy/antovim'
Plug 'tpope/vim-surround'
Plug 'lambdalisue/suda.vim'
Plug 'wellle/targets.vim'
Plug 'lilydjwg/fcitx.vim'
Plug 'itchyny/vim-cursorword'
Plug 'ojroques/vim-oscyank'
" Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align


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
Plug 'cpea2506/one_monokai.nvim'
" Plug 'theniceboy/nvim-deus'
" Plug 'glepnir/oceanic-material'

" ------------------------------------------
"              status line
" ------------------------------------------
Plug 'akinsho/bufferline.nvim'
Plug 'itchyny/lightline.vim'
" Plug 'mg979/vim-xtabline'
" Plug 'NTBBloodbath/galaxyline.nvim'
" Plug 'glepnir/spaceline.vim'


"+--------------------------------------------------------------------+
"|                                                                    |
"|                         DDEVELOPMENT TOOL                          |
"|                                                                    |
"+--------------------------------------------------------------------+
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
" Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
" Plug 'nvim-telescope/telescope.nvim'
Plug 'stevearc/dressing.nvim'       " select menu
" Plug 'nvim-telescope/telescope-ui-select.nvim'

" ------------------------------------------
"             run and debug
" ------------------------------------------
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-rust --enable-python '}

" ------------------------------------------
"             File navigation
" ------------------------------------------
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'junegunn/fzf.vim'
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" Plug 'theniceboy/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'kevinhwang91/rnvimr'
Plug 'voldikss/vim-floaterm'

call plug#end()

source $HOME/.config/nvim/init/plugconf/vim-table-mode.vim
source $HOME/.config/nvim/init/plugconf/asyncrun-vim.vim
source $HOME/.config/nvim/init/plugconf/asynctasks-vim.vim
source $HOME/.config/nvim/init/plugconf/bufferline-nvim.vim
source $HOME/.config/nvim/init/plugconf/bullets.vim
source $HOME/.config/nvim/init/plugconf/coc-nvim.vim
source $HOME/.config/nvim/init/plugconf/dashboard.vim
source $HOME/.config/nvim/init/plugconf/DoxygenToolkit.vim
source $HOME/.config/nvim/init/plugconf/dressing-nvim.vim
" source $HOME/.config/nvim/init/plugconf/telescope-nvim.vim
" source $HOME/.config/nvim/init/plugconf/telescope-ui-select-nvim.vim
" source $HOME/.config/nvim/init/plugconf/guihua-lua.vim
" source $HOME/.config/nvim/init/plugconf/fzf-gitignore.vim
" source $HOME/.config/nvim/init/plugconf/fzf.vim
source $HOME/.config/nvim/init/plugconf/fzf-lua.vim
" source $HOME/.config/nvim/init/plugconf/Leaderf.vim
source $HOME/.config/nvim/init/plugconf/lightline.vim
source $HOME/.config/nvim/init/plugconf/md-img-paste-vim.vim
source $HOME/.config/nvim/init/plugconf/neovim-session-manager.vim
source $HOME/.config/nvim/init/plugconf/nvim-treesitter.vim
source $HOME/.config/nvim/init/plugconf/onemonoka-nvim.vim
source $HOME/.config/nvim/init/plugconf/rnvimr.vim
source $HOME/.config/nvim/init/plugconf/tcomment_vim.vim
source $HOME/.config/nvim/init/plugconf/vim-cursorword.vim
source $HOME/.config/nvim/init/plugconf/vim-floaterm.vim
source $HOME/.config/nvim/init/plugconf/vim-markdown-toc.vim
source $HOME/.config/nvim/init/plugconf/vim-oscyank.vim
source $HOME/.config/nvim/init/plugconf/vim-visual-multi.vim
source $HOME/.config/nvim/init/plugconf/vimspector.vim
source $HOME/.config/nvim/init/plugconf/Vista-vim.vim

" auto comment disabled
au BufNewFile,BufRead * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
