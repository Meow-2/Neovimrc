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
            \ '<C-l>': 'NvimEdit vsplit',
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
