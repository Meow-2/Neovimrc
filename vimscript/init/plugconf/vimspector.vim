" ===
" === vimspector
" ===
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
nmap <F4> :VimspectorReset<CR><CR>
nmap <F17> <S-F5>
nmap <F21> <S-F9>
nmap <F23> <S-F11>
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" nnoremap <F3> :tabclose<CR>
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/init/vimspector/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/init/vimspector',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
noremap <leader>db :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad
