if exists('g:vscode')
    source $HOME/.config/nvim/init/basic.vim
    source $HOME/.config/nvim/init/keymap.vim
else
    source $HOME/.config/nvim/init/basic.vim
    source $HOME/.config/nvim/init/keymap.vim
    source $HOME/.config/nvim/init/plug.vim
endif
