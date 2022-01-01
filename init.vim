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

" terminal behaviors
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
noremap <LEADER>t :set splitbelow<CR>:split<CR>:res -10<CR>:term<CR>
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>

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
noremap <LEADER><CR> :nohlsearch<CR>

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
inoremap <C-h> <esc>I
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <esc>A
inoremap <C-z> <esc>ua
inoremap <C-y> <esc><C-r>a
inoremap jj <esc>l
inoremap <esc> <esc>l


" fold code
noremap <silent> <LEADER>o za

" select from cursor to the end of line 
noremap <silent> \v v$h


" copy and paste
" visual copy to system clipboard ,it can avoid system polluted by ciw
vnoremap y "+y
nnoremap Y y$
" p in the font of cursor
" noremap p hp


" placeholde
map <LEADER><LEADER> <esc>/<ZK><CR>:nohlsearch<CR>c4l

" split
exec "set splitbelow"
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map sl :set splitright<CR>:vsplit<CR>

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
  
" tag
noremap tn :tabe<CR>
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
noremap tc :tabclose<CR>
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>
  
" save
map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $HOME/.config/nvim/init.vim<CR>
map <LEADER>rc :e $HOME/.config/nvim/init.vim<CR>
 
" visual-block can use <C-q>
" noremap <LEADER>v <C-v>

" run
noremap <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
        exec "silent !rm -rf build;mkdir build;"
        :AsyncRun -cwd=$(VIM_FILEDIR)/build clang++ -std=c++17 -g -Wall -pthread  -o "$(VIM_FILEDIR)/build/$(VIM_FILENOEXT)" "$(VIM_FILEPATH)" && ./$(VIM_FILENOEXT) 
		" set splitbelow
        " :sp
        " :res -5
        " :term rm -rf build > /dev/null && mkdir -p build && cd build && clang++ -std=c++17 -g -Wall -pthread  -o ./%< ../% && ./%< 
	elseif &filetype == 'cs'
		set splitbelow
		silent! exec "!mcs %"
		:sp
		:res -5
		:term mono %<.exe
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		:term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

" plug
call plug#begin('$HOME/.config/nvim/plugged')


" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

" Status line
Plug 'theniceboy/eleline.vim'
Plug 'ojroques/vim-scrollstatus'
Plug 'mg979/vim-xtabline'

" themes
Plug 'theniceboy/nvim-deus'
Plug 'luochen1990/rainbow'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'

" Editor Enhancement
Plug 'mg979/vim-visual-multi'
Plug 'jiangmiao/auto-pairs'        " auto ( [ { <
Plug 'tomtom/tcomment_vim'         " in <space>cn to comment a line
Plug 'theniceboy/antovim'          " gs to switch false and true
Plug 'tpope/vim-surround'          " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular'           " ga, or :Tabularize <regex> to align
Plug 'lambdalisue/suda.vim'
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} .p

" File navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'theniceboy/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'kevinhwang91/rnvimr'

" taglist
Plug 'liuchengxu/vista.vim'        

" find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" run 
Plug 'skywind3000/asyncrun.vim'

call plug#end()

" ===
" === nvim-treesitter
" ===
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"javascript","cmake", "cpp", "python","bash","yaml","json"},
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
  },
}
EOF

" ===
" === xtabline
" ===
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
noremap to :XTabMode<CR>
noremap \p :echo expand('%:p')<CR>

" ===
" === eleline.vim
" ===
let g:airline_powerline_fonts = 0


" ===
" === deus 
" ===
set cursorline 
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
color deus
hi NonText ctermfg=gray guifg=grey10
" hi CursorLine guibg=#444444

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
let g:VM_maps["Add Cursor Down"]='<C-j>'
let g:VM_maps["Add Cursor Up"]='<C-k>'  

" ===
" === tcomment_vim
" ===
" nnoremap ci cl
" let g:tcomment_textobject_inlinecomment = ''
let g:tcomment_mapleader1=''
nmap  gcc
vmap  gcc
" vmap <LEADER>/ g>
" nmap <LEADER>. g<c
" vmap <LEADER>. g<

" ===
" === tabular
" ===
vmap ga :Tabularize /


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
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 1
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> <leader>e :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
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
noremap <LEADER>f :F  **/*<left><left><left><left><left>
let g:far#mapping = {
		\ "replace_undo" : ["l"],
		\ }


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
        \ 'coc-snippets']

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
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
nmap <leader>q  <Plug>(coc-fix-current)

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
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>

" ===
" === coc-snippets
" ===
" imap <C-l> <Plug>(coc-snippets-expand)
" vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
" imap <C-j> <Plug>(coc-snippets-expand-jump)
" let g:snips_author = 'David Chen'
" autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc


" ===
" === asyncrun.vim
" ===
let g:asyncrun_open = 12
let g:asyncrun_bell = 1
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

" auto comment disabled
autocmd BufNewFile,BufRead * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif

