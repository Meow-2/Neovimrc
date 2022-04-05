call plug#begin('$HOME/.config/nvim/plugged')
" ==========================================
"                  lsp
" ==========================================
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'OmniSharp/omnisharp-vim'


" ==========================================
"                markdown
" ==========================================
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'Meow-2/bullets.vim', { 'branch': 'solve_CR_conflict_with_coc' }
Plug 'ferrine/md-img-paste.vim'


" ==========================================
"           editor enhancement
" ==========================================
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


" ==========================================
"               dressing up
" ==========================================

" ------------------------------------------
" start buffer
" ------------------------------------------
Plug 'glepnir/dashboard-nvim'
" Plug 'mhinz/vim-startify'

" ------------------------------------------
" icons
" ------------------------------------------
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" ------------------------------------------
" color themes
" ------------------------------------------
Plug 'cpea2506/one_monokai.nvim'
" Plug 'theniceboy/nvim-deus'
" Plug 'glepnir/oceanic-material'

" ------------------------------------------
" status line
" ------------------------------------------
Plug 'akinsho/bufferline.nvim'
Plug 'itchyny/lightline.vim'
" Plug 'mg979/vim-xtabline'
" Plug 'NTBBloodbath/galaxyline.nvim'
" Plug 'glepnir/spaceline.vim'


" ==========================================
"          development tools
" ==========================================

" ------------------------------------------
"              taglist
" ------------------------------------------
Plug 'liuchengxu/vista.vim'        

" ------------------------------------------
"         comment to document
" ------------------------------------------
Plug 'babaybus/DoxygenToolkit.vim'

" ------------------------------------------
"              treesitter
" ------------------------------------------
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
" Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} .p

" ------------------------------------------
"            session-manager
" ------------------------------------------
Plug 'nvim-lua/plenary.nvim'        " dependency of neovim-session-manager
Plug 'Shatur/neovim-session-manager'
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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'theniceboy/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'kevinhwang91/rnvimr'
Plug 'voldikss/vim-floaterm'
call plug#end()
