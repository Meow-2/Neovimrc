let g:nvim_plugins_installation_completed=1
if empty(glob($HOME.'/.local/share/nvim/vscode/plug.vim'))
	silent !curl -fLo $HOME/.local/share/nvim/vscode/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let g:nvim_plugins_installation_completed=0
    source $HOME/.local/share/nvim/vscode/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
else
    source $HOME/.local/share/nvim/vscode/plug.vim
endif

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
" noremap 9 ^
" noremap 0 $

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
let g:loaded_{'matchit'} = 1
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
nmap <c-s> :w<CR>

" quit nvim
" nnoremap <C-q> :q!<cr>


"----------------------------------------------------------------------
"                          split windows
"----------------------------------------------------------------------

nmap s <nop>
nmap sh        :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
nmap sj        :set splitbelow<CR>:split<CR>
nmap sk        :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
nmap sl        :set splitright<CR>:vsplit<CR>
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
" let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point [2]
" if executable(s:clip)
"     set clipboard=unnamedplus " default
"     au TextYankPost * if v:event.operator is 'y' | call system(s:clip, @0) | endif
" else
"     noremap y "+y
"     nnoremap yy "+yy
"     nnoremap Y "+y$
"     vnoremap y "+y`]
" endif

noremap y "+y
nnoremap yy "+yy
nnoremap Y "+y$
vnoremap y "+y`]
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

nmap sw <Cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>
nmap sf <Cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>
" nmap <C-b> <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<cr>


call plug#begin('$HOME/.local/share/nvim/vscode/plugged')

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
Plug 'lewis6991/gitsigns.nvim'
" Plug 'nvim-lua/plenary.nvim'        " dependency of neovim-session-manager and telescope
" Plug 'folke/todo-comments.nvim'
" Plug 'dkarter/bullets.vim'

call plug#end()

let g:cursorword_highlight = 0
let g:cursorword_delay = 0

hi! CursorWord0 guibg=#3f444a
hi! CursorWord1 guibg=#3f444a

lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"javascript","cmake", "cpp","c_sharp", "python","bash","yaml","json","vim"},
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<Cr>',
            node_incremental = '<Cr>',
            node_decremental = '<Bs>',
            -- scope_incremental = "grc",
        },
    },
}
EOF
" ===
" === vim-visual-multi
" ===
let g:VM_maps = {}
let g:VM_maps["Find Under"]='<c-l>'
let g:VM_maps["Find Subword Under"]='<c-l>'
let g:VM_leader = '<S-\>'
let g:VM_maps["Visual All"]='<c-s-a>'
let g:VM_maps["Select All"]='<c-s-a>'
let g:VM_maps["Select h"]=''
let g:VM_maps["Select l"]=''
let g:VM_maps["Remove Last Region"]='<c-h>'
let g:VM_maps["Remove Region"]='\'
let g:VM_maps["Add Cursor Down"]=''
let g:VM_maps["Add Cursor Up"]=''

" ===
" === tcomment_vim
" ===
let g:tcomment_mapleader1=''
nmap  gcc
vmap  gc
" nmap <c-_> gcc
" vmap <c-_> gc
"===
"=== tabular
"===
vnoremap = :Tabularize /

""----------------------------------------------------------------------
"vim-surround
"----------------------------------------------------------------------
nmap ys" ysiW"
nmap ys' ysiW'
nmap ys[ ysiW[
nmap ys] ysiW]
nmap ys( ysiW(
nmap ys) ysiW)
nmap ys{ ysiW{
nmap ys} ysiW}
"
"
"----------------------------------------------------------------------
"gitsigns.nvim
"----------------------------------------------------------------------

lua<<EOF
local status_ok, gitsigns = pcall(require, "gitsigns")
gitsigns.setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '┃', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '┃', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000, follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 100,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false,
  },
  -- keymapping
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Navigation
    map('n', '<leader>gn',':Gitsigns next_hunk<CR>')
    map('n', '<leader>gN',':Gitsigns prev_hunk<CR>')

    -- Actions
    map('n', '<leader>gs', ':Gitsigns stage_hunk<CR>')
    map('n', '<leader>gr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>gu', '<cmd>Gitsigns undo_stage_hunk<CR>')
    map('n', '<leader>gS', '<cmd>Gitsigns stage_buffer<CR>')
    map('n', '<leader>gR', '<cmd>Gitsigns reset_buffer<CR>')
    map('n', '<leader>gp', '<cmd>Gitsigns preview_hunk<CR>')
    map('n', '<leader>gb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
    -- map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
    map('n', '<leader>gd', '<cmd>Gitsigns diffthis<CR>')
    map('n', '<leader>gD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    -- map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')
    --
    -- Text object
    map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
EOF

silent !mkdir -p $HOME/.cache/nvim/undo/
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.cache/nvim/undo/
endif

au BufNewFile,BufRead * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                  " record cursor when exit
