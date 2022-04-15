" ===
" === coc.nvim
" ===
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-vimlsp',
    \ 'coc-prettier',
    \ 'coc-clangd',
    \ 'coc-clang-format-style-options',
    \ 'coc-cmake',
    \ 'coc-explorer',
    \ 'coc-yank',
    \ 'coc-pyright',
    \ 'coc-picgo',
    \ 'coc-snippets']

imap <silent> <expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ coc#jumpable() ? "<Plug>(coc-snippets-expand-jump)" :
    \ IsNextCharPair() && CanTabOut() ? "<esc>a" : 
    \ "\<Plug>(Tabout)"
"     " \ "\<TAB>"
"
func CanTabOut()
    if col('.') == 1
    \ || (col('.') ==2 && getline('.')[col('.')-2] == ' ')
    \ || (getline('.')[col('.')-2] == ' ' && getline('.')[col('.')-3] == ' ')
        return 0
    else 
        return 1
    endif
endfunc

func IsNextCharPair()  
    if getline('.')[col('.') - 1] == ')' 
    \ || getline('.')[col('.') - 1] == ']' 
    \ || getline('.')[col('.') - 1] == '"'   
    \ || getline('.')[col('.') - 1] == "'" 
    \ || getline('.')[col('.') - 1] == '}' 
    \ || getline('.')[col('.') - 1] == '>'
    \ || getline('.')[col('.') - 1] == '`'
        return 1  
    else              
        return 0
    endif  
endfunc

imap <silent> <expr> <S-TAB>
    \ pumvisible() ? "\<C-p>" :
    \ <SID>check_back_space() ? "\<bs>" :
    \ "\<Plug>(TaboutBack)"


inoremap <silent> <expr> <cr>
    \ pumvisible() ? coc#_select_confirm() :
    \ "\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> - <Plug>(coc-diagnostic-prev)
nmap <silent> = <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>.  <Plug>(coc-fix-current)

nnoremap <silent> <c-p> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" ===
" === coc-explorer
" ===
nmap tt :CocCommand explorer<CR>


" ===
" === coc-yank
" ===
nnoremap <silent> <C-y>  :<C-u>CocList -A --normal yank<cr>
inoremap <silent> <C-y>  <esc>:<C-u>CocList -A --normal yank<cr>

" ===
" === coc-snippets
" ===
" imap <C-l> <Plug>(coc-snippets-expand)
" vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
" imap <C-j> <Plug>(coc-snippets-expand-jump)
" let g:snips_author = 'David Chen'
" autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

" ===
" === coc-picgo
" ===
inoremap <silent> <c-u> <esc>:CocCommand picgo.uploadImageFromClipboard<CR>
