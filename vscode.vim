set hlsearch
exec "nohlsearch"
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


let mapleader=" "
noremap n nzz
noremap N Nzz
noremap H 0
noremap J 5j
noremap K 5k
noremap L $
" nnoremap <c-h> 0
" nnoremap <c-l> $
inoremap <silent> <esc> <esc>l:nohlsearch<cr>
noremap <silent> <esc> <esc>:nohlsearch<cr>
noremap M m
noremap <silent> \v v$h
noremap y "+y
nnoremap yy "+yy
nnoremap Y "+y$
nnoremap <c-j> <c-v>j
nnoremap <c-k> <c-v>k
map <LEADER>rc :e $HOME/.config/nvim/vscode.vim<CR>
map <LEADER><LEADER> <esc>/<++><CR>:nohlsearch<CR>c4l
exec "set splitbelow"
map S <nop>
map Sh :set nosplitright<CR>:vsplit<CR>
map Sj :set splitbelow<CR>:split<CR>
map Sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map Sl :set splitright<CR>:vsplit<CR>
map tn :tabnew<CR>
map th :tabp<CR>
map tl :tabn<CR>
map tc :tabclose<CR>
nnoremap tt <Cmd>call VSCodeNotify('workbench.view.explorer')<CR>
" nnoremap T <Cmd>call VSCodeNotify('workbench.action.terminal.focus')<CR>

map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l
map <LEADER>c <C-w>c
map s :w<CR>
map q <C-w>c
noremap Q q

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
      init_selection = 'm',
      node_incremental = 'm',
      scope_incremental = '<CR>',
      node_decremental = ',',
    }
  }
}
EOF


" ===
" === vim-visual-multi
" ===
let g:VM_maps = {}
let g:VM_maps['Find Under']='<C-l>'
let g:VM_maps['Find Subword Under']='<C-l>'
let g:VM_maps["Add Cursor Down"]='<C-j>'
let g:VM_maps["Add Cursor Up"]='<C-k>'  


" ===
" === tcomment_vim
" ===
let g:tcomment_mapleader1=''
nmap <c-/> gcc
vmap <c-/> gc


" ===
" === tabular
" ===
vmap ga :Tabularize /


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
autocmd BufNewFile,BufRead * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                  " record cursor when exit
