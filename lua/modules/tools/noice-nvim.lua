return function()
    if packer_plugins['nui.nvim'] and not packer_plugins['nui.nvim'].loaded then
        vim.cmd([[packadd nui.nvim]])
    end
    if packer_plugins['nvim-notify'] and not packer_plugins['nvim-notify'].loaded then
        vim.cmd([[packadd nvim-notify]])
    end
    require('notify').setup({
        on_open = function(win)
            vim.api.nvim_win_set_config(win, {
                border = 'single',
            })
        end,
        background_colour = '#262a33',
        fps = 30,
        icons = {
            DEBUG = '',
            ERROR = '',
            INFO = '',
            TRACE = '✎',
            WARN = '',
        },
        level = 0,
        max_width = 70,
        minimum_width = 20,
        render = 'minimal',
        stages = 'fade_in_slide_out',
        timeout = 1000,
        top_down = false,
    })
    require('noice').setup({
        cmdline = {
            enable = true,
            view = 'cmdline', -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
            view_search = 'cmdline', -- view for rendering the cmdline for search
            opts = { buf_options = { filetype = 'vim' } }, -- enable syntax highlighting in the cmdline
            icons = {
                ['/'] = { icon = '', hl_group = 'NoiceCmdlineIconSearch' },
                ['?'] = { icon = '', hl_group = 'NoiceCmdlineIconSearch' },
                [':'] = { icon = '', hl_group = 'NoiceCmdlineIcon', firstc = false },
            },
        },
        messages = {
            enabled = true,
        },
        popupmenu = {
            enabled = false, -- disable if you use something like cmp-cmdline
            ---@type 'nui'|'cmp'
            backend = 'nui', -- backend to use to show regular cmdline completions
            -- You can specify options for nui under `config.views.popupmenu`
        },
        history = {
            -- options for the message history that you get with `:Noice`
            view = 'split',
            opts = { enter = true },
            filter = { event = 'msg_show', ['not'] = { kind = { 'search_count', 'echo' } } },
        },
        hacks = {
            skip_duplicate_messages = false,
        },
        notify = {
            -- Noice can be used as `vim.notify` so you can route any notification like other messages
            -- Notification messages have their level and other properties set.
            -- event is always "notify" and kind can be any log level as a string
            -- The default routes will forward notifications to nvim-notify
            enabled = true,
        },
        throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
        ---@type table<string, NoiceViewOptions>
        views = {}, -- @see the section on views below
        ---@type NoiceRouteConfig[]
        routes = {}, -- @see the section on routes below
        ---@type table<string, NoiceFilter>
        status = {}, --@see the section on statusline components below
    })
end
