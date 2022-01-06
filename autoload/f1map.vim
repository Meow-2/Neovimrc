func! f1map#source_vimrc_and_file_build()
	if &filetype == 'vim'
        :source $HOME/.config/nvim/init.vim
    else
        :AsyncTask file-build
	endif
endfunc

