
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

"edit like emacs
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>

cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-d> <del>

cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>

cnoremap <c-b> <left>

"----------------------------------------------------------------------
"                           save and quit
"----------------------------------------------------------------------

" close buffer/tab/dashboard
nnoremap <silent><expr> q
       \ len(getbufinfo({'buflisted':1})) == 1 ? ":q!<cr>" :
       \ len(win_findbuf(bufnr('%'))) > 1 ? ":q!<cr>" :
       \ &filetype == 'dashboard' ? ":q!<cr>" :
       \ ":bd!<cr>"

" write to file
nnoremap s :w<CR>

" quit nvim
nnoremap <C-q> :q!<cr>


"----------------------------------------------------------------------
"                          split windows
"----------------------------------------------------------------------

nnoremap S <nop>
nnoremap <silent> Sh        : set nosplitright<CR> : vsplit<CR> : set splitright<CR>
nnoremap <silent> Sl        : set splitright<CR>   : vsplit<CR>
nnoremap <silent> <c-left>  : set nosplitright<CR> : vsplit<CR> : set splitright<CR>
nnoremap <silent> <c-down>  : set splitbelow<CR>   : split<CR>
nnoremap <silent> <c-up>    : set nosplitbelow<CR> : split<CR>  : set splitbelow<CR>
nnoremap <silent> <c-right> : set splitright<CR>   : vsplit<CR>


" move around split windows
nnoremap <left> <C-w>h
nnoremap <down> <C-w>j
nnoremap <up> <C-w>k
nnoremap <right> <C-w>l
nnoremap <c-h> <C-w>h
nnoremap <c-l> <C-w>l

" nnoremap <leader>c <C-w>c

" resize split windows
nnoremap <silent> <S-left> :vertical resize+2<CR>
nnoremap <silent> <S-down> :res -2<CR>
nnoremap <silent> <S-up> :res +2<CR>
nnoremap <silent> <S-right> :vertical resize-2<CR>
nnoremap <leader>= <C-w>=


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
noremap <silent> <LEADER>i zf%
noremap <silent> <LEADER>o za


"----------------------------------------------------------------------
"                    build / source / markdown preview
"----------------------------------------------------------------------

nnoremap <silent><expr> <F1> 
       \ &filetype == 'vim' ? ":source $HOME/.config/nvim/init.vim<cr>" :
       \ &filetype == 'markdown' ? ":MarkdownPreview<cr>" :
       \ ":AsyncTask file-build<cr>"
