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

nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
