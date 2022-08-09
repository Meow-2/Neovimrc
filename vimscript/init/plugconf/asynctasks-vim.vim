" ===
" === asynctasks.vim
" ===
let g:asynctasks_term_rows = '12'
let g:asynctasks_term_pos = 'bottom'
nnoremap <silent><S-F1> :AsyncTask file-buildrun<cr>
nnoremap <silent><F2> :call asyncrun#quickfix_toggle(6)<cr>
nnoremap <silent><F3> :AsyncTask file-run<cr>
