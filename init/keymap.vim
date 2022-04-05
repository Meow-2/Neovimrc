" ==========================================
" ========== MY KEYMAP IN NEOVIM ===========
" ==========================================

" ------------------------------------------
"            cursor behaviors
" ------------------------------------------

" cursor move
nnoremap H b
nnoremap J 5j
nnoremap K 5k
nnoremap L e
nnoremap 9 ^
nnoremap 0 $

" visual-block
nnoremap <c-j> <c-v>
vnoremap <c-j> j
nnoremap <c-k> <c-v>
vnoremap <c-k> k


" ------------------------------------------
"              save and quit
" ------------------------------------------

" close buffer/tab/dashboard
nnoremap <silent><expr> q
       \ &filetype == 'dashboard' ? ":q!<cr>" :
       \ len(getbufinfo({'buflisted':1})) == 1 ? ":q!<cr>" :
       \ ":bd!<cr>"

" write to file
nnoremap s :w<CR>

" quit nvim
nnoremap <C-q> :q!<cr>


" ------------------------------------------
"              split windows
" ------------------------------------------

nnoremap S <nop>
nnoremap Sh :set nosplitright<CR>:vsplit<CR>
nnoremap Sj :set splitbelow<CR>:split<CR>
nnoremap Sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
nnoremap Sl :set splitright<CR>:vsplit<CR>

" move around split windows
nnoremap <LEADER>h <C-w>h
nnoremap <LEADER>j <C-w>j
nnoremap <LEADER>k <C-w>k
nnoremap <LEADER>l <C-w>l
nnoremap <LEADER>c <C-w>c

" resize split windows
nnoremap <LEADER><left> :vertical resize+5<CR>
nnoremap <LEADER><down> :res -5<CR>
nnoremap <LEADER><up> :res +5<CR>
nnoremap <LEADER><right> :vertical resize-5<CR>
nnoremap <LEADER>= <C-w>=


" ------------------------------------------
"                 search
" ------------------------------------------

" prev and next search result
nnoremap n nzz
nnoremap N Nzz

" cancel the highlight of search result
inoremap <silent> <esc> <esc>l:nohlsearch<cr>
noremap <silent> <esc> <esc>:nohlsearch<cr>

" find the placeholder
nnoremap <LEADER><LEADER> <esc>/<++><CR>:nohlsearch<CR>c4l


" ------------------------------------------
"        yank to system clipboard
" ------------------------------------------

noremap y "+y
nnoremap yy "+yy
nnoremap Y "+y$


" ------------------------------------------
"                  marco
" ------------------------------------------

nnoremap Q q1
nnoremap @ @1


" ------------------------------------------
"                fold code
" ------------------------------------------

nnoremap <silent> <LEADER>i zf%
nnoremap <silent> <LEADER>o za
