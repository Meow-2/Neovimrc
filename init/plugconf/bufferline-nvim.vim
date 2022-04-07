" ===
" === bufferline.nvim
" ===
set termguicolors
lua << EOF
require("bufferline").setup{
options = {
    numbers = function(opts)
                return string.format('%s.', opts.ordinal)
              end,
    diagnostics = "coc",
    separator_style = "thin", 
    always_show_bufferline = "true",
    }
}
EOF
nnoremap <silent>r :BufferLineCycleNext<CR>
nnoremap <silent>e :BufferLineCyclePrev<CR>
nnoremap <silent>tc :BufferLinePickClose<CR>
nnoremap <silent>gb :BufferLinePick<CR>
" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent>tl :BufferLineMoveNext<CR>
nnoremap <silent>th :BufferLineMovePrev<CR>

nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
