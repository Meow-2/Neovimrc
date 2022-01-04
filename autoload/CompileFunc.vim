func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
        exec "silent !rm -rf build;mkdir build;"
        :AsyncRun -cwd=$(VIM_FILEDIR)/build clang++ -std=c++17 -g -Wall -pthread  -o "$(VIM_FILEDIR)/build/$(VIM_FILENOEXT)" "$(VIM_FILEPATH)" && ./$(VIM_FILENOEXT) 
		" set splitbelow
        " :sp
        " :res -5
        " :term rm -rf build > /dev/null && mkdir -p build && cd build && clang++ -std=c++17 -g -Wall -pthread  -o ./%< ../% && ./%< 
	elseif &filetype == 'cs'
		set splitbelow
		silent! exec "!mcs %"
		:sp
		:res -5
		:term mono %<.exe
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		:term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	elseif &filetype == 'vim'
        :source $HOME/.config/nvim/init.vim
	endif
endfunc

