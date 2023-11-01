local filesize = vim.fn.getfsize(vim.fn.expand('%'))
if filesize > 750000 or vim.g.vscode then
    require('vscode')
else
    require('core')
end
