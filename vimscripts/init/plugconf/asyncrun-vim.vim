" ===
" === asyncrun.vim
" ===
let g:asyncrun_open = 12
let g:asyncrun_bell = 1

function! s:my_runner(opts)
    if !executable('alacritty')
        return asyncrun#utils#errmsg('alacritty executable not find !')
    endif
	let cmds = []
	let cmds += ['cd ' . shellescape(getcwd()) ]
	let cmds += [a:opts.cmd]
	let cmds += ['echo ""']
	let cmds += ['read -n1 -rsp "press any key to continue ..."']
	let text = shellescape(join(cmds, ";"))
	let command = 'alacritty -e zsh -c ' . text
	call system(command . ' &')
endfunction

let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
let g:asyncrun_runner.alacritty = function('s:my_runner')
" nnoremap <F1> :call compile#CompileRunGcc()<CR>
" nnoremap <F2> :call asyncrun#quickfix_toggle(6)<cr>
" nnoremap <leader><F1> :call compile#CompileGcc()<CR> 
