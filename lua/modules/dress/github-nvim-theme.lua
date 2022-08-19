return function()
    -- Lua
    -- require('github-theme').setup()
    -- Example config in Lua
    require('github-theme').setup({
        -- dark/dimmed/dark_default/dark_colorblind/light/light_default/light_colorblind
        theme_style = 'light_colorblind',
        function_style = 'italic',
        sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' },

        -- Change the "hint" color to the "orange" color, and make the "error" color bright red
        colors = { hint = 'orange', error = '#ff0000' },

        -- Overwrite the highlight groups
        overrides = function(c)
            return {
                htmlTag = { fg = c.red, bg = '#282c34', sp = c.hint, style = 'underline' },
                DiagnosticHint = { link = 'LspDiagnosticsDefaultHint' },
                -- this will remove the highlight groups
                TSField = {},
            }
        end,
    })
end
