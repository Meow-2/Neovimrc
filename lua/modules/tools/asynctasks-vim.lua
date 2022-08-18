return function()
    vim.g.asyncrun_open = 15
    vim.g.asynctasks_term_rows = '12'
    vim.g.asynctasks_term_pos = 'bottom'
    vim.g.asyncrun_rootmarks = { '.git', '.svn', '.root', '.project', '.hg' }
end
