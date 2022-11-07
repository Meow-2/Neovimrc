return function()
    require('telescope').load_extension('persisted') -- To load the telescope extension
    require('persisted').setup({
        save_dir = vim.fn.expand(os.getenv('HOME') .. '/.cache/nvim/sessions/'), -- directory where session files are saved
        command = 'VimLeavePre', -- the autocommand for which the session is saved
        silent = false, -- silent nvim message when sourcing session file
        use_git_branch = true, -- create session files based on the branch of the git enabled repository
        autosave = true, -- automatically save session files when exiting Neovim
        autoload = false, -- automatically load the session for the cwd on Neovim startup
        on_autoload_no_session = nil, -- function to run when `autoload = true` but there is no session to load
        follow_cwd = true, -- change session file name to match current working directory if it changes
        allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
        ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
        before_save = nil, -- function to run before the session is saved to disk
        after_save = nil, -- function to run after the session is saved to disk
        after_source = nil, -- function to run after the session is sourced
        telescope = { -- options for the telescope extension
            -- jump between session smoothly
            before_source = function()
                -- vim.api.nvim_command('FloatermKill!')
                vim.api.nvim_command('SessionSave')
                vim.api.nvim_command('%bd!')
            end,
            -- after_source = function(param) end,
            reset_prompt_after_deletion = true, -- whether to reset prompt after session deleted
        },
    })
end
