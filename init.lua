local filesize = vim.fn.getfsize(vim.fn.expand('%'))
if filesize > 750000 then
    vim.cmd([[luafile ~/.config/nvim/static/largefile.lua]])
elseif vim.g.vscode then
    vim.cmd([[source ~/.config/nvim/static/vscode.vim]])
else
    require('core')
end
