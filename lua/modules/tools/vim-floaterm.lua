return function()
    vim.g.floaterm_width = 0.9
    vim.g.floaterm_height = 0.9
    vim.g.floaterm_opener = 'edit '
    vim.g.floaterm_title = ''
    vim.g.floaterm_rootmarkers = { 'build/CMakeFiles', '.project', '.git', '.hg', '.svn', '.root' }
    local set_floaterm_mappings = function()
        local mappings = {
            -- tabedit = '<C-t>',
            -- edit = '<C-o>',
            vsplit = '<C-l>',
            -- split = '<C-s>',
        }
        for opener, key in pairs(mappings) do
            vim.keymap.set('t', key, function()
                vim.b.floaterm_opener = opener
                local termcodes = vim.api.nvim_replace_termcodes('<C-l>', true, false, true)
                vim.api.nvim_feedkeys(termcodes, 'n', true)
            end, { noremap = true, buffer = true })
        end
    end

    vim.api.nvim_create_autocmd('filetype', {
        pattern = 'floaterm',
        callback = function()
            set_floaterm_mappings()
        end,
    })
end
