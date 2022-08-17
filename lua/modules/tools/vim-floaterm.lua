return function()
  vim.g.floaterm_width = 0.9
  vim.g.floaterm_height = 0.9
  vim.g.floaterm_opener = 'edit '
  vim.g.floaterm_title = ''
  vim.g.floaterm_rootmarkers = { 'build/CMakeFiles', '.project', '.git', '.hg', '.svn', '.root' }
end
