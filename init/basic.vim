" ==========================================
" ============ BASIC SETTINGS ==============
" ==========================================


" ------------------------------------------
"               start exec
" ------------------------------------------
exec "nohlsearch"
exec "set splitbelow"
exec "set splitright"


" ------------------------------------------
"               basic set
" ------------------------------------------
language en_US.utf-8
syntax on
let mapleader=" "
let &t_ut=''
set hidden
set shortmess+=c
set number
set relativenumber
set encoding=UTF-8
set showcmd
set lazyredraw
set ttyfast
set showtabline=2
set mouse=a
set ttimeoutlen=0
set notimeout
set updatetime=100
set virtualedit=block
set wrap                       " show one line in two lines when out of range
set wildmenu                   " vicmd compelete
set autochdir                  " exec vicmd in now path
set laststatus=2               " always show the statusbar
set scrolloff=4                " 4 line remain
set backspace=indent,eol,start " backspace to last line
" set clipboard=unnamedplus
" set whichwrap+=<,>,[,],h,l   " alow h to last line


" ------------------------------------------
"                tab set
" ------------------------------------------
set tw=0
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set softtabstop=0


" ------------------------------------------
"               search set
" ------------------------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase

" ------------------------------------------
"              save history
" ------------------------------------------

" save the history
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.

" make u and C-r premanent
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif

" record cursor when exit
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
