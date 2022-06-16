
"+--------------------------------------------------------------------+
"|                                                                    |
"|                              KEYMAP                                |
"|                                                                    |
"+--------------------------------------------------------------------+

" the help of binding ctrl shift f1-12 key
" https://www.reddit.com/r/neovim/comments/mbj8m5/how_to_setup_ctrlshiftkey_mappings_in_neovim_and/
" `showkey -a` to show the keycode you push

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

"edit like emacs
inoremap <c-a> <esc>^i
inoremap <c-e> <end>
inoremap <c-d> <del>
inoremap <c-b> <left>

inoremap <c-h> <bs>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>

inoremap <c-s-h> <c-left>
inoremap <c-s-l> <c-right>

cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-d> <del>
cnoremap <c-b> <left>

cnoremap <c-h> <bs>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>

cnoremap <c-s-h> <c-left>
cnoremap <c-s-l> <c-right>

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
" matchit is a standard plugin, it will map [% ]%, disable it
let g:loaded_{'matchit'} = 1
omap [ i[
omap ] i]
omap ( i(
omap ) i)
omap { i{
omap } i}
omap + i+
omap - i-

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
nnoremap s :w!<cr>

" quit nvim
nnoremap <C-q> :qa!<cr>


"----------------------------------------------------------------------
"                          split windows
"----------------------------------------------------------------------

nnoremap S <nop>
nnoremap <silent> Sh        : set nosplitright<CR> : vsplit<CR> : set splitright<CR>
nnoremap <silent> Sj        : set splitbelow<CR>   : split<CR>
nnoremap <silent> Sk        : set nosplitbelow<CR> : split<CR>  : set splitbelow<CR>
nnoremap <silent> Sl        : set splitright<CR>   : vsplit<CR>
nnoremap <silent> <S-left>  : set nosplitright<CR> : vsplit<CR> : set splitright<CR>
nnoremap <silent> <S-down>  : set splitbelow<CR>   : split<CR>
nnoremap <silent> <S-up>    : set nosplitbelow<CR> : split<CR>  : set splitbelow<CR>
nnoremap <silent> <S-right> : set splitright<CR>   : vsplit<CR>


" move around split windows
nnoremap <left> <C-w>h
nnoremap <down> <C-w>j
nnoremap <up> <C-w>k
nnoremap <right> <C-w>l

nnoremap <c-s-h> <C-w>h
nnoremap <c-s-j> <C-w>j
nnoremap <c-s-k> <C-w>k
nnoremap <c-s-l> <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k

tnoremap <expr> <c-s-h> 
    \ &filetype == 'floaterm' ?
    \ "\x1b[72;6u" :
    \ &filetype == 'rnvimr' ?
    \ "<c-s-h>" :
    \ "<c-\><c-n><c-w>h"

tnoremap <expr> <c-s-j> 
    \ &filetype == 'floaterm' ?
    \ "<c-s-j>" :
    \ &filetype == 'rnvimr' ?
    \ "<c-s-j>" :
    \ "<c-\><c-n><c-w>j"

tnoremap <expr> <c-s-k> 
    \ &filetype == 'floaterm' ?
    \ "<c-s-k>" :
    \ &filetype == 'rnvimr' ?
    \ "<c-s-k>" :
    \ "<c-\><c-n><c-w>k"

tnoremap <expr> <c-s-l> 
    \ &filetype == 'floaterm' ?
    \ "\x1b[76;6u" :
    \ &filetype == 'rnvimr' ?
    \ "<c-s-l>" :
    \ "<c-\><c-n><c-w>l"

" nnoremap <leader>c <C-w>c

" resize split windows
nnoremap <silent> <c-left>  :vertical resize+2<CR>
nnoremap <silent> <c-down>  :res -2<CR>
nnoremap <silent> <c-up>    :res +2<CR>
nnoremap <silent> <c-right> :vertical resize-2<CR>
nnoremap <silent> <leader>= <C-w>=

tnoremap <silent> <c-left>  <c-\><c-n>:vertical resize+2<CR>i
tnoremap <silent> <c-down>  <c-\><c-n>:res -2<CR>i
tnoremap <silent> <c-up>    <c-\><c-n>:res +2<CR>i
tnoremap <silent> <c-right> <c-\><c-n>:vertical resize-2<CR>i


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


" fold code
noremap <silent> zi zf%
noremap <silent> zo za


"----------------------------------------------------------------------
"                    build / source / markdown preview
"----------------------------------------------------------------------

nnoremap <silent><expr> <F1> 
       \ &filetype == 'vim' ? ":source $HOME/.config/nvim/init.vim<cr>" :
       \ &filetype == 'markdown' ? ":MarkdownPreview<cr>" :
       \ ":AsyncTask file-build<cr>"
