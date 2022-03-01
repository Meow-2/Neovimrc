if exists('g:vscode')
    source ~/.config/nvim/vscode.vim
else
" ===
" === Auto load for first time uses
" ===
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" if empty(glob($HOME.'/.config/nvim/plugged/wildfire.vim/autoload/wildfire.vim'))
"	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source $HOME/.config/nvim/_machine_specific.vim

" help remember
" gf                 go to cursor's file
" <C-o>              go last cursor
" <c-i>              cancel <c-o>
" :w !sudo tee %     save file with sudo, ! means using a shell command

" " machine specific
" let g:python_host_prog='/usr/bin/python'
" let g:python3_host_prog='/usr/bin/python'
" let g:mkdp_browser = 'microsoft-edge-stable'
" let g:mkdp_browserfunc = 'open '
" let g:barbaric_ime = 'fcitx5'


" base 
language en_US.utf-8
let mapleader=" "
let &t_ut=''
syntax on
set hidden
set shortmess+=c
" set clipboard=unnamedplus
set number
set relativenumber
set wrap                       " show one line in two lines when out of range
set showcmd
set wildmenu                   " vicmd compelete
set encoding=UTF-8
set backspace=indent,eol,start " backspace to last line
set autochdir                  " exec vicmd in now path
set laststatus=2               " always show the statusbar
set scrolloff=4                " 4 line remain
set lazyredraw
set ttyfast
set showtabline=2
set mouse=a
" set whichwrap+=<,>,[,],h,l   " alow h to last line
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                  " record cursor when exit
" save the history
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif
set ttimeoutlen=0
set notimeout
set updatetime=100
set virtualedit=block


" tab
set tw=0
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set softtabstop=0

" search
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

noremap n nzz
noremap N Nzz
" noremap <LEADER><CR> :nohlsearch<CR>

" move
noremap H 0
noremap J 5j
noremap K 5k
noremap L $
" noremap <C-h> 0
" noremap <C-l> $
" inoremap <C-h> <esc>I
" inoremap <C-l> <esc>A

" control
" inoremap <C-h> <esc>I
" inoremap <C-j> <down>
" inoremap <C-k> <up>
" inoremap <C-l> <esc>A
" inoremap <C-z> <esc>ua
" inoremap <C-y> <esc><C-r>a
" inoremap jj <esc>l
nnoremap <c-j> <c-v>
vnoremap <c-j> j            
nnoremap <c-k> <c-v>k       
vnoremap <c-k> k            
" inoremap <C-a> <esc>ggVG    
inoremap <silent> <esc> <esc>l:nohlsearch<cr>
noremap <silent> <esc> <esc>:nohlsearch<cr>

" fold code
noremap <silent> <LEADER>i zf%
noremap <silent> <LEADER>o za

" make mark
" noremap M m

" select from cursor to the end of line 
noremap <silent> \v v$h

" copy and paste
" copy to system clipboard ,it can avoid system polluted by ciw
noremap y "+y
nnoremap yy "+yy
nnoremap Y "+y$
" p in the font of cursor
" noremap ,p h"0p

" placeholde
map <LEADER><LEADER> <esc>/<++><CR>:nohlsearch<CR>c4l

" split
exec "set splitbelow"
map S <nop>
map Sh :set nosplitright<CR>:vsplit<CR>
map Sj :set splitbelow<CR>:split<CR>
map Sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map Sl :set splitright<CR>:vsplit<CR>

map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l
map <LEADER>c <C-w>c
 
map <LEADER><left> :vertical resize+5<CR>
map <LEADER><down> :res -5<CR>
map <LEADER><up> :res +5<CR>
map <LEADER><right> :vertical resize-5<CR>
map <LEADER>= <C-w>=
  
" " tag
" noremap tn :tabe<CR>
" noremap th :-tabnext<CR>
" noremap tl :+tabnext<CR>
" noremap tc :tabclose<CR>
" noremap tmh :-tabmove<CR>
" noremap tml :+tabmove<CR>
  
" save
" map s <nop>
map s :w<CR>
noremap Q q
noremap q :q!<CR>
" map R :source $HOME/.config/nvim/init.vim<CR>
map <LEADER>rc :e $HOME/.config/nvim/init.vim<CR>
 
" visual-block can use <C-q>
" noremap <LEADER>v <C-v>


" plug
call plug#begin('$HOME/.config/nvim/plugged')


" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

" Status line
" Plug 'theniceboy/eleline.vim'
" Plug 'ojroques/vim-scrollstatus'
" Plug 'mg979/vim-xtabline'
Plug 'glepnir/spaceline.vim'
Plug 'akinsho/bufferline.nvim'

" themes
" Plug 'glepnir/oceanic-material'
" Plug 'theniceboy/nvim-deus'
Plug 'cpea2506/one_monokai.nvim'
Plug 'luochen1990/rainbow'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
" Plug 'glepnir/dashboard-nvim'
Plug 'kyazdani42/nvim-web-devicons'


" Editor Enhancement
Plug 'mg979/vim-visual-multi'
Plug 'jiangmiao/auto-pairs'        " auto ( [ { <
Plug 'tomtom/tcomment_vim'         " in <space>cn to comment a line
Plug 'theniceboy/antovim'          " gs to switch false and true
Plug 'tpope/vim-surround'          " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular'           " ga, or :Tabularize <regex> to align
Plug 'lambdalisue/suda.vim'
" Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} .p
Plug 'wellle/targets.vim'
Plug 'lilydjwg/fcitx.vim' " auto chinese to english

" File navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'theniceboy/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'kevinhwang91/rnvimr'
Plug 'voldikss/vim-floaterm'


" taglist
Plug 'liuchengxu/vista.vim'        

" find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'OmniSharp/omnisharp-vim'

" run 
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-rust --enable-python '}

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'
" Plug 'ferrine/md-img-paste.vim'

call plug#end()

" ===
" === nvim-treesitter
" ===
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"javascript","cmake", "cpp","c_sharp", "python","bash","yaml","json","vim"},
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
  },
  incremental_selection ={
  enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
    }
  }
}
EOF

" ===
" === spaceline
" ===
let g:spaceline_seperate_style = 'none'


" ===
" === bufferline.nvim
" ===
set termguicolors
lua << EOF
require("bufferline").setup{
options = {
    diagnostics = "coc",
    -- separator_style = "slant" 
    separator_style = "thin" 
    }
}
EOF
nnoremap <silent>tl :BufferLineCycleNext<CR>
nnoremap <silent>th :BufferLineCyclePrev<CR>
nnoremap <silent>tc :BufferLinePickClose<CR>
nnoremap <silent>gb :BufferLinePick<CR>
" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent>tml :BufferLineMoveNext<CR>
nnoremap <silent>tmh :BufferLineMovePrev<CR>


" " ===
" " === xtabline
" " ===
" let g:xtabline_settings = {}
" let g:xtabline_settings.enable_mappings = 0
" let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
" let g:xtabline_settings.enable_persistance = 0
" let g:xtabline_settings.last_open_first = 1
" let g:xtabline_settings.theme = 'codedark'
" let g:xtabline_settings.indicators = {
"         \ 'modified': '[+]',
"         \ 'pinned': '[📌]',
"         \}
" let g:xtabline_settings.icons = {
"         \'pin': '📌',
"         \'star': '★',
"         \'book': '📖',
"         \'lock': '🔒',
"         \'hammer': '🔨',
"         \'tick': '✔',
"         \'cross': '✖',
"         \'warning': '⚠',
"         \'menu': '☰',
"         \'apple': '🍎',
"         \'linux': '🐧',
"         \'windows': '⌘',
"         \'git': '',
"         \'palette': '🎨',
"         \'lens': '🔍',
"         \'flag': '',
"         \}
" noremap to :XTabMode<CR>
" noremap \p :echo expand('%:p')<CR>

" ===
" === eleline.vim
" ===
" let g:airline_powerline_fonts = 0


" ===

" " ===
" " === oceanic-material
" " ===
" set background=dark
" colorscheme oceanic_material

" ===
" === onemonoka.nvim
" ===
colorscheme one_monokai


" " ===
" " === deus 
" " ===
" set cursorline 
" set termguicolors " enable true colors support
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" color deus
" hi NonText ctermfg=gray guifg=grey10
" " Transparent and Gaussian blur for bg
" " autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg

" ===
" === vim-startify
" ===
let g:startify_custom_header = startify#pad(split(system('figlet -f slant -w 100 N E O V I M '), '\n'))
" redir => test
"   " silent echo 'one'
"   " silent echo 'two'
"   " silent echo 'three'
" redir END
"
" let g:startify_custom_header =
"     \ map(split(test), 'repeat(" ", 10) . v:val')

" ===
" === vim-visual-multi
" ===
let g:VM_maps = {}
let g:VM_maps['Find Under']='<C-l>'
let g:VM_maps['Find Subword Under']='<C-l>'
" let g:VM_maps["Add Cursor Down"]='<C-j>'
" let g:VM_maps["Add Cursor Up"]='<C-k>'  

" ===
" === tcomment_vim
" ===
" nnoremap ci cl
" let g:tcomment_textobject_inlinecomment = ''
let g:tcomment_mapleader1=''
nmap  gcc
vmap  gc
" vmap <LEADER>/ g>
" nmap <LEADER>. g<c
" vmap <LEADER>. g<

" ===
" === tabular
" ===
vmap ga :Tabularize /


" ===
" === targets.vim
" ===


" ===
" === FZF
" ===
nnoremap <c-p> :Leaderf file<CR>
" noremap <silent> <C-p> :Files<CR>
noremap <silent> <C-f> :Rg<CR>
noremap <silent> <C-h> :History<CR>
" noremap <C-t> :BTags<CR>
" noremap <silent> <C-l> :Lines<CR>
noremap <silent> <C-b> :Buffers<CR>
noremap <leader>; :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({'source': s:list_buffers(), 'sink*': { lines -> s:delete_buffers(lines) }, 'options': '--multi --reverse --bind ctrl-a:select-all+accept'}))

noremap <c-d> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }



" ===
" === Leaderf
" ===
" let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
let g:Lf_CommandMap = {
\   '<C-]>': ['<C-v>'],
\   '<C-p>': ['<C-n>'],
\}
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
        \ 'dir': ['.git', 'vendor', 'node_modules'],
        \ 'file': ['__vim_project_root', 'class']
        \}
let g:Lf_UseMemoryCache = 0
let g:Lf_UseCache = 0


" ===
" === fzf-gitignore
" ===
noremap <LEADER>gi :FzfGitignore<CR>


" ===
" === rnvimr
" ===
" let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 1
let g:rnvimr_enable_bw = 0
highlight link RnvimrNormal CursorLine
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
" let g:rnvimr_layout = { 'relative': 'editor',
"             \ 'width': float2nr(round(0.5*&columns)),
"             \ 'height': float2nr(round(0.5*&lines)),
"             \ 'col': 0,
"             \ 'row': 0,
"             \ 'style': 'minimal' }
" let g:rnvimr_layout = {
"             \ 'relative': 'editor',
"             \ 'width': float2nr(round(0.7 * &columns)),
"             \ 'height': float2nr(round(0.7 * &lines)),
"             \ 'col': float2nr(round(0.15 * &columns)),
"             \ 'row': float2nr(round(0.15 * &lines)),
"             \ 'style': 'minimal'
"             \ }
let g:rnvimr_presets = [{'width': 0.7, 'height': 0.7}]

" ===
" === vim-floaterm
" ===
" terminal behaviors
let g:neoterm_autoscroll = 1
" autocmd TermOpen term://* startinsert
" noremap T :set splitbelow<CR>:split<CR>:res -10<CR>:term<CR>i
nnoremap T :FloatermNew --height=0.75 --width=0.7<cr>
tnoremap <esc> <C-\><C-N>:q!<cr>
" tnoremap <C-O> <C-\><C-N><C-O>

" ===
" === Vista.vim
" ===
noremap <LEADER>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
" function! NearestMethodOrFunction() abort
" 	return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:scrollstatus_size = 15

" ===
" === Far.vim
" ===
" noremap <LEADER>f :F  **/*<left><left><left><left><left>
" let g:far#mapping = {
" 		\ "replace_undo" : ["l"],
" 		\ }

" ===
" === coc.nvim
" ===
let g:coc_global_extensions = [
        \ 'coc-json',
        \ 'coc-vimlsp',
        \ 'coc-prettier',
        \ 'coc-clangd',
        \ 'coc-clang-format-style-options',
        \ 'coc-cmake',
        \ 'coc-explorer',
        \ 'coc-yank',
        \ 'coc-omnisharp',
        \ 'coc-picgo',
        \ 'coc-snippets']

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>f  <Plug>(coc-fix-current)

nnoremap <silent> <LEADER>p :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" ===
" === coc-explorer
" ===
nmap tt :CocCommand explorer<CR>


" ===
" === coc-yank
" ===
nnoremap <silent> <C-y>  :<C-u>CocList -A --normal yank<cr>
inoremap <silent> <C-y>  <esc>:<C-u>CocList -A --normal yank<cr>

" ===
" === coc-snippets
" ===
imap <C-l> <Plug>(coc-snippets-expand)
" vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'David Chen'
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

" ===
" === coc-picgo
" ===
inoremap <silent> <c-u> <esc>:CocCommand picgo.uploadImageFromClipboard<CR>

" ===
" === omnisharp-vim
" ===
" let g:OmniSharp_typeLookupInPreview = 1
" let g:omnicomplete_fetch_full_documentation = 1
"
" let g:OmniSharp_server_use_mono = 1
" let g:OmniSharp_server_stdio = 1
" let g:OmniSharp_highlight_types = 2
" let g:OmniSharp_selector_ui = 'fzf'
"
" autocmd Filetype cs nnoremap <buffer> gd :OmniSharpPreviewDefinition<CR>
" autocmd Filetype cs nnoremap <buffer> gr :OmniSharpFindUsages<CR>
" autocmd Filetype cs nnoremap <buffer> gy :OmniSharpTypeLookup<CR>
" autocmd Filetype cs nnoremap <buffer> ga :OmniSharpGetCodeActions<CR>
" autocmd Filetype cs nnoremap <buffer> <LEADER>rn :OmniSharpRename<CR><C-N>:res +5<CR>
"
" sign define OmniSharpCodeActions text=💡
"
" " let g:coc_sources_disable_map = { 'cs': ['cs', 'cs-1', 'cs-2', 'cs-3'] }

" ===
" === asyncrun.vim
" ===
let g:asyncrun_open = 12
let g:asyncrun_bell = 1
" nnoremap <F1> :call compile#CompileRunGcc()<CR>
" nnoremap <F2> :call asyncrun#quickfix_toggle(6)<cr>
" nnoremap <leader><F1> :call compile#CompileGcc()<CR> 

" ===
" === asynctasks.vim
" ===
nnoremap <silent><F1> :call f1map#source_vimrc_and_file_build()<cr>
nnoremap <silent><F2> :AsyncTask file-run<cr>
nnoremap <silent><F3> :call asyncrun#quickfix_toggle(6)<cr>
nnoremap <silent><F4> :tabclose<cr>

" ===
" === vimspector
" ===
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" nnoremap <F3> :tabclose<CR>
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
noremap <leader>db :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad

" ===
" === Markdown Settings
" ===
" Snippets
source $HOME/.config/nvim/md-snippets.vim

" ===
" === markdown-preview.nvim
" ===

" ===
" === vim-table-mode
" ===
noremap tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'

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
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]

" " ===
" " === md-img-paste.vim
" " ===
" let g:mdip_imgdir = 'pic' 
" "设置默认图片名称。当图片名称没有给出时，使用默认图片名称
" let g:mdip_imgname = 'image'

" auto comment disabled
autocmd BufNewFile,BufRead * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif


" alacritty cursor to beam

autocmd VimLeave * set guicursor=a:ver25-iCursor

endif
