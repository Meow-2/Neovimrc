" ===
" === md-img-paste.vim
" ===
let g:mdip_imgdir = 'pic' 
"设置默认图片名称。当图片名称没有给出时，使用默认图片名称
let g:mdip_imgname = 'image'
autocmd FileType markdown inoremap <silent> <C-p> <esc>:call mdip#MarkdownClipboardImage()<CR>
