return function()
  vim.g.asyncrun_open = 6
  vim.g.asynctasks_term_rows = '12'
  vim.g.asynctasks_term_pos = 'bottom'
  vim.g.asyncrun_rootmarks = { '.git', '.svn', '.root', '.project', '.hg' }
end
