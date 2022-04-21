let mapleader=" "
exec "nohlsearch"
exec "set splitbelow"
exec "set splitright"

set hlsearch
set incsearch
set ignorecase
set smartcase

set wildmenu 
set lazyredraw
set ttyfast
set backspace=indent,eol,start

set ttimeoutlen=0
set notimeout
set updatetime=100
set virtualedit=block
set showcmd

"+--------------------------------------------------------------------+
"|                                                                    |
"|                              KEYMAP                                |
"|                                                                    |
"+--------------------------------------------------------------------+

"----------------------------------------------------------------------
"                          cursor behaviors
"----------------------------------------------------------------------

" cursor move
noremap H b
noremap J 5j
noremap K 5k
noremap L e
noremap 9 ^
noremap 0 $

" visual-block
nnoremap <c-j> <c-v>
vnoremap <c-j> j
nnoremap <c-k> <c-v>
vnoremap <c-k> k


"----------------------------------------------------------------------
"                            text object
"----------------------------------------------------------------------

omap " i"
omap ' i'
"when you want to dw use de
omap w iw
omap / i/
omap ` i`
omap < i<
omap > i>
omap _ i_
omap [ i]
omap ] i[
omap ( i(
omap ) i)
omap { i{
omap } i}
omap + i+
omap - i-
omap : i:

xmap " i"
xmap ' i'
"when you want to dw use de
xmap w iw
xmap / i/
xmap ` i`
xmap < i<
xmap > i>
xmap _ i_
xmap [ i[
xmap ] i]
xmap ( i(
xmap ) i)
xmap { i{
xmap } i}
xmap + i+
xmap - i-
xmap : i:

"----------------------------------------------------------------------
"                           save and quit
"----------------------------------------------------------------------

map q <C-w>c
noremap Q q

" write to file
nmap s :w<CR>

" quit nvim
" nnoremap <C-q> :q!<cr>


"----------------------------------------------------------------------
"                          split windows
"----------------------------------------------------------------------

nmap S <nop>
nmap Sh        :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
nmap Sj        :set splitbelow<CR>:split<CR>
nmap Sk        :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
nmap Sl        :set splitright<CR>:vsplit<CR>
nmap <S-left>  :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
nmap <S-down>  :set splitbelow<CR>:split<CR>
nmap <S-up>    :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
nmap <S-right> :set splitright<CR>:vsplit<CR>

" nmap <c-h> <C-w>h
" nmap <c-l> <C-w>l
" nmap <leader>j <C-w>j
" nmap <leader>k <C-w>k
"
" " move around split windows
" nmap <left> <C-w>h
" nmap <down> <C-w>j
" nmap <up> <C-w>k
" nmap <right> <C-w>l
" " nnoremap <leader>c <C-w>c
"
" " resize split windows
" nmap <c-left>  :vertical resize+2<CR>
" nmap <c-down>  :res -2<CR>
" nmap <c-up>    :res +2<CR>
" nmap <c-right> :vertical resize-2<CR>
" nmap <leader>= <C-w>=
"
" move around split windows
nmap <left> <C-w>h
nmap <down> <C-w>j
nmap <up> <C-w>k
nmap <right> <C-w>l

nmap <leader>j <C-w>j
nmap <leader>k <C-w>k

" nnoremap <leader>c <C-w>c

" resize split windows
nmap <c-left>  <Cmd>call VSCodeNotify('workbench.action.increaseViewSize')<cr>
nmap <c-right> <Cmd>call VSCodeNotify('workbench.action.decreaseViewSize')<cr>
nmap <c-up> <Cmd>call VSCodeNotify('workbench.action.increaseViewSize')<cr>
nmap <c-down> <Cmd>call VSCodeNotify('workbench.action.decreaseViewSize')<cr>


"----------------------------------------------------------------------
"                               search
"----------------------------------------------------------------------

" prev and next search result
nnoremap n nzz
nnoremap N Nzz

" cancel the highlight of search result
noremap <silent> <esc> <esc>:nohlsearch<cr>

" find the placeholder
" nnoremap <LEADER><LEADER> <esc>/<++><CR>:nohlsearch<CR>c4l


"----------------------------------------------------------------------
"                      yank to system clipboard
"----------------------------------------------------------------------
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point [2]
if executable(s:clip)
    set clipboard=unnamedplus " default
    au TextYankPost * if v:event.operator is 'y' | call system(s:clip, @0) | endif
else
    noremap y "+y
    nnoremap yy "+yy
    nnoremap Y "+y$
endif

nnoremap \v v$h

"----------------------------------------------------------------------
"                                marco
"----------------------------------------------------------------------

nnoremap Q q1
nnoremap @ @1


"----------------------------------------------------------------------
"                             fold code
"----------------------------------------------------------------------

" indent code
vnoremap <tab> >gv
vnoremap <S-tab> <gv

"----------------------------------------------------------------------
"                              change tab
"----------------------------------------------------------------------

nmap e :tabp<CR>
nmap r :tabn<CR>
nmap tc :tabclose<CR>
noremap tt <Cmd>call VSCodeNotify('workbench.view.explorer')<CR>
" nnoremap T <Cmd>call VSCodeNotify('workbench.action.terminal.focus')<CR>

"----------------------------------------------------------------------
"                                 lsp
"----------------------------------------------------------------------

nmap gd <Cmd>call VSCodeNotify('editor.action.revealDefinition')<cr>
nmap gi <Cmd>call VSCodeNotify('editor.action.goToImplementation')<cr>
nmap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<cr>
nmap gl <Cmd>call VSCodeNotify('editor.action.revealDefinitionAside')<cr>
nmap <leader>rn <Cmd>call VSCodeNotify('editor.action.rename')<cr>
nmap <leader>. <Cmd>call VSCodeNotify('editor.action.quickFix')<cr>
nmap - <Cmd>call VSCodeNotify('editor.action.marker.prev')<cr>
nmap = <Cmd>call VSCodeNotify('editor.action.marker.next')<cr>

"----------------------------------------------------------------------
"                               file
"----------------------------------------------------------------------

nmap <leader>w <Cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>
nmap <leader>h <Cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>
" nmap <C-b> <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<cr>


call plug#begin('$HOME/.config/nvim/plugged')

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'mg979/vim-visual-multi'
Plug 'tomtom/tcomment_vim'         " in <space>cn to comment a line
Plug 'theniceboy/antovim'          " gs to switch false and true
Plug 'tpope/vim-surround'          " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular'           " ga, or :Tabularize <regex> to align
Plug 'itchyny/vim-cursorword'
" Plug 'abecodes/tabout.nvim'
" Plug 'mg979/vim-visual-multi'
" Plug 'lambdalisue/suda.vim'
Plug 'wellle/targets.vim'
Plug 'lilydjwg/fcitx.vim' " auto chinese to english
" Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
" Plug 'dkarter/bullets.vim'

call plug#end()

lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"javascript","cmake", "cpp","c_sharp", "python","bash","yaml","json","vim"},
    incremental_selection ={
    enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            scope_incremental = '<BS>',
            node_decremental = '<BS>',
        }
    }
}
EOF
source $HOME/.config/nvim/init/plugconf/vim-visual-multi.vim
source $HOME/.config/nvim/init/plugconf/tcomment_vim.vim
source $HOME/.config/nvim/init/plugconf/tabular.vim
source $HOME/.config/nvim/init/plugconf/vim-surround.vim
source $HOME/.config/nvim/init/plugconf/vim-cursorword.vim
" source $HOME/.config/nvim/init/plugconf/tabout-nvim.vim

silent !mkdir -p $HOME/.config/nvim/tmp/undo
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif


" auto comment disabled
au BufNewFile,BufRead * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" au Filetype markdown vnoremap <buffer> <c-b> c****<esc>hhp
" au Filetype markdown vnoremap <buffer> <c-i> c**<esc>hp
" au Filetype markdown vnoremap <buffer> <c-s> c~~~~<esc>hhp
" record cursor when exit
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                  " record cursor when exit
