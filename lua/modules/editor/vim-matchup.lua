return function()
    -- vim.g.matchup_motion_enabled = 0
    -- vim.g.matchup_text_obj_enabled = 0
    vim.g.matchup_matchparen_offscreen = {}
    vim.g.matchup_delim_stopline = 400
    vim.g.matchup_matchparen_stopline = 400

    vim.api.nvim_create_autocmd({ 'FileType' }, {
        pattern = 'html',
        callback = function()
            vim.g.matchup_matchparen_enabled = 0
            -- vim.g.matchup_matchparen_fallback = 0
        end,
    })
end
