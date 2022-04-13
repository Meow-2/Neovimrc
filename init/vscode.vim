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

nmap <c-h> <C-w>h
nmap <c-l> <C-w>l
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k

" move around split windows
nmap <left> <C-w>h
nmap <down> <C-w>j
nmap <up> <C-w>k
nmap <right> <C-w>l
" nnoremap <leader>c <C-w>c

" resize split windows
nmap <c-left>  :vertical resize+2<CR>
nmap <c-down>  :res -2<CR>
nmap <c-up>    :res +2<CR>
nmap <c-right> :vertical resize-2<CR>
nmap <leader>= <C-w>=


"----------------------------------------------------------------------
"                               search
"----------------------------------------------------------------------

" prev and next search result
nnoremap n nzz
nnoremap N Nzz

" cancel the highlight of search result
inoremap <silent> <esc> <esc>l:nohlsearch<cr>
noremap <silent> <esc> <esc>:nohlsearch<cr>

" find the placeholder
" nnoremap <LEADER><LEADER> <esc>/<++><CR>:nohlsearch<CR>c4l


"----------------------------------------------------------------------
"                      yank to system clipboard
"----------------------------------------------------------------------

noremap y "+y
nnoremap yy "+yy
nnoremap Y "+y$


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


" fold code
nmap <silent> <LEADER>i zf%
nmap <silent> <LEADER>o za

"----------------------------------------------------------------------
"                              change tab
"----------------------------------------------------------------------

nmap e :tabp<CR>
nmap r :tabn<CR>
nmap tc :tabclose<CR>
noremap tt <Cmd>call VSCodeNotify('workbench.view.explorer')<CR>
" nnoremap T <Cmd>call VSCodeNotify('workbench.action.terminal.focus')<CR>



call plug#begin('$HOME/.config/nvim/plugged')

Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'mg979/vim-visual-multi'
Plug 'tomtom/tcomment_vim'         " in <space>cn to comment a line
Plug 'theniceboy/antovim'          " gs to switch false and true
Plug 'tpope/vim-surround'          " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular'           " ga, or :Tabularize <regex> to align
" Plug 'lambdalisue/suda.vim'
Plug 'wellle/targets.vim'
Plug 'lilydjwg/fcitx.vim' " auto chinese to english
" Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
" Plug 'dkarter/bullets.vim'

call plug#end()


" ===
" === nvim-treesitter
" ===
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


" " ===
" " === vim-visual-multi
" " ===
" let g:VM_maps = {}
" let g:VM_maps['Find Under']='<C-l>'
" let g:VM_maps['Find Subword Under']='<C-l>'
" let g:VM_maps["Add Cursor Down"]='<C-j>'
" let g:VM_maps["Add Cursor Up"]='<C-k>'  


" ===
" === tcomment_vim
" ===
let g:tcomment_mapleader1=''
nmap <c-/> gcc
vmap <c-/> gc


" ===
" === tabular
" ===
vnoremap gt :Tabularize /


" ===
" === vim-table-mode
" ===
" noremap tm :TableModeToggle<CR>
" "let g:table_mode_disable_mappings = 1
" let g:table_mode_cell_text_object_i_map = 'k<Bar>'

" ===
" === vim-markdown-toc
" ===

"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'


" ===
" === bullets.vim
" ===
" let g:bullets_set_mappings = 0
" let g:bullets_enabled_file_types = [
" 			\ 'markdown',
" 			\ 'text',
" 			\ 'gitcommit',
" 			\ 'scratch'
" 			\]

" auto comment disabled
au BufNewFile,BufRead * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
au Filetype markdown vnoremap <buffer> <c-b> c****<esc>hhp
au Filetype markdown vnoremap <buffer> <c-i> c**<esc>hp
au Filetype markdown vnoremap <buffer> <c-s> c~~~~<esc>hhp
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                  " record cursor when exit
