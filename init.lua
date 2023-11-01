local filesize = vim.fn.getfsize(vim.fn.expand('%'))
if filesize > 750000 then
    require('lite.largefile')
elseif vim.g.vscode then
    require('lite.vscode')
else
    require('core')
end
