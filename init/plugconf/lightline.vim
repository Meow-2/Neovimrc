" ===
" === lightline
" ===
if !has('gui_running')
  set t_Co=256
endif
set noshowmode
let g:lightline = {
      \ 'enable': {
      \   'tabline': 0
      \ },
      \ 'colorscheme': 'selenized_black',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch','readonly', 'filename' , 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineTruncatedFileName',
      \   'readonly': 'LightlineReadonly',
      \ },
      \ }

function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

function! LightlineTruncatedFileName()
let l:filePath = substitute(expand("%:p"),$HOME,'~',"")
    if winwidth(0) > 100
        return l:filePath
    else
        return pathshorten(l:filePath)
    endif
endfunction

