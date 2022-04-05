" ===
" === bufferline.nvim
" ===
set termguicolors
lua << EOF
require("bufferline").setup{
options = {
    diagnostics = "coc",
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
