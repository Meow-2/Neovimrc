if vim.g.vscode then
    vim.cmd([[source ~/.config/nvim/static/vscode.vim]])
else
    require('core')
end
