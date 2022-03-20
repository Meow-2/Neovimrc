func! f1map#source_vimrc_and_file_build()
    if &filetype == 'python'
        :set splitbelow
        :split
        :term python %:p
    elseif &filetype == 'markdown'
        :MarkdownPreview
    elseif &filetype == 'vim'
        :source $HOME/.config/nvim/init.vim
    else
        :AsyncTask file-build
	endif
endfunc

