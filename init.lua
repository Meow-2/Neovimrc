local filesize = vim.fn.getfsize(vim.fn.expand('%'))
if filesize > 750000 then
    vim.cmd([[luafile ~/.config/nvim/static/largefile.lua]])
elseif vim.g.vscode then
    require('vscode')
else
    require('core')
end