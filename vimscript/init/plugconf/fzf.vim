" ===
" === FZF
" ===

" let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
"
" function! s:list_buffers()
"   redir => list
"   silent ls
"   redir END
"   return split(list, "\n")
" endfunction
"
" function! s:delete_buffers(lines)
"   execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
" endfunction
"
" command! BD call fzf#run(fzf#wrap({'source': s:list_buffers(), 'sink*': { lines -> s:delete_buffers(lines) }, 'options': '--multi --reverse --bind ctrl-a:select-all+accept'}))
"
" noremap <c-d> :BD<CR>
let $BAT_THEME='TwoDark'
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!build/**' --glob '!.dart_tool/**' --glob '!.idea' --glob '!node_modules'"
let $FZF_DEFAULT_OPTS = "--ansi --layout=reverse --inline-info --preview-window sharp --bind ctrl-p:toggle-preview --preview 'bat --color=always --style=header,grid --line-range :300 {}'" 
