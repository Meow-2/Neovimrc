
"+--------------------------------------------------------------------+
"|                                                                    |
"|                         BASIC SETTINGS                             |
"|                                                                    |
"+--------------------------------------------------------------------+


"----------------------------------------------------------------------
"                            start exec
"----------------------------------------------------------------------
" Auto load for first time uses
let g:nvim_plugins_installation_completed=1
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let g:nvim_plugins_installation_completed=0
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

exec "nohlsearch"
exec "set splitbelow"
exec "set splitright"


"----------------------------------------------------------------------
"                          machine setings
"----------------------------------------------------------------------
language en_US.utf-8
syntax on
let mapleader=" "
let &t_ut=''
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'
let g:barbaric_ime = 'fcitx5'
let g:remoteSession = ($SSH_TTY != "")
" let g:clipboard = {}

" let g:mkdp_browser = 'google-chrome-stable'
" let g:mkdp_browser = 'microsoft-edge-stable'


"----------------------------------------------------------------------
"                          basic settings
"----------------------------------------------------------------------
set hidden
set shortmess+=c
set number
" set relativenumber
set encoding=UTF-8
set showcmd
set lazyredraw
set ttyfast
set showtabline=2
set mouse=a
set timeoutlen=0
set ttimeoutlen=0
set notimeout
set updatetime=100
set virtualedit=block
set nowrap                     " show one line in two lines when out of range
set wildmenu                   " vicmd compelete
" set autochdir                  " exec vicmd in now path
set laststatus=2               " always show the statusbar
set scrolloff=4                " 4 line remain
set backspace=indent,eol,start " backspace to last line
set termguicolors
" set clipboard=unnamedplus
" set whichwrap+=<,>,[,],h,l   " alow h to last line
if exists('g:nvui')
  " Configure nvui
    set guifont=FiraCode\ Nerd\ Font\ Mono:h15
    hi Cursor gui=bold,italic
    inoremap <c-v> <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>mi`[=`]`ia
    cnoremap <c-v> <c-r>+
    nmap <c-/> gcc
    vmap <c-/> gc
endif


"----------------------------------------------------------------------
"                               tab set
"----------------------------------------------------------------------
set tw=0
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set softtabstop=0


"----------------------------------------------------------------------
"                             search set
"----------------------------------------------------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase

"----------------------------------------------------------------------
"                            save history
"----------------------------------------------------------------------

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

"----------------------------------------------------------------------
"                               autocmd
"----------------------------------------------------------------------
" markdown
au Filetype markdown vnoremap <buffer> <c-b> c****<esc>hhp
au Filetype markdown vnoremap <buffer> <c-i> c**<esc>hp
au Filetype markdown vnoremap <buffer> <c-s> c~~~~<esc>hhp
au Filetype markdown set wrap
au Filetype yaml set wrap
au Filetype json set wrap
" record cursor when exit
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au TermOpen * setlocal nonumber norelativenumber
" alacritty cursor to beam
au VimLeave * set guicursor=a:ver25-iCursor


" "----------------------------------------------------------------------
" "                     set function key in terminal
" "----------------------------------------------------------------------
" function! s:key_escape(name, code)
" 	if has('nvim') == 0 && has('gui_running') == 0
" 		exec "set ".a:name."=\e".a:code
" 	endif
" endfunc
"
" "----------------------------------------------------------------------
" "                function key code correct in terminal
" "----------------------------------------------------------------------
" call s:key_escape('<F1>', 'OP')
" call s:key_escape('<F2>', 'OQ')
" call s:key_escape('<F3>', 'OR')
" call s:key_escape('<F4>', 'OS')
" call s:key_escape('<S-F1>', '[1;2P')
" call s:key_escape('<S-F2>', '[1;2Q')
" call s:key_escape('<S-F3>', '[1;2R')
" call s:key_escape('<S-F4>', '[1;2S')
" call s:key_escape('<S-F5>', '[15;2~')
" call s:key_escape('<S-F6>', '[17;2~')
" call s:key_escape('<S-F7>', '[18;2~')
" call s:key_escape('<S-F8>', '[19;2~')
" call s:key_escape('<S-F9>', '[20;2~')
" call s:key_escape('<S-F10>', '[21;2~')
" call s:key_escape('<S-F11>', '[23;2~')
" call s:key_escape('<S-F12>', '[24;2~')
