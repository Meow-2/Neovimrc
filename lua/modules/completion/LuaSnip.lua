return function()
    local ls = require('luasnip')
    local types = require('luasnip.util.types')
    ls.config.set_config({
        history = false,
        enable_autosnippets = true,
        region_check_events = 'CursorMoved',
        update_events = 'InsertLeave',
        ext_opts = {
            [types.choiceNode] = {
                active = {
                    virt_text = { { '<- choiceNode', 'Comment' } },
                },
            },
        },
    })
    -- require('luasnip.loaders.from_lua').lazy_load({
    --     paths = vim.fn.stdpath('config') .. '/snippets',
    -- })
    -- require('luasnip.loaders.from_vscode').lazy_load({
    --     paths = { './snippets/' },
    -- })
    require('luasnip.loaders.from_snipmate').lazy_load({
        paths = { './snippets/' },
    })
end
