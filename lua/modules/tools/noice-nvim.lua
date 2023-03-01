return function()
    -- if packer_plugins['nui.nvim'] and not packer_plugins['nui.nvim'].loaded then
    --     vim.cmd([[packadd nui.nvim]])
    -- end
    -- if packer_plugins['nvim-notify'] and not packer_plugins['nvim-notify'].loaded then
    --     vim.cmd([[packadd nvim-notify]])
    -- end
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
            -- view_search = 'cmdline', -- view for rendering the cmdline for search
            opts = {}, -- enable syntax highlighting in the cmdline
            format = {
                -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
                -- view: (default is cmdline view)
                -- opts: any options passed to the view
                -- icon_hl_group: optional hl_group for the icon
                cmdline = { pattern = '^:', icon = '', lang = 'vim' },
                search_down = { kind = 'search', pattern = '^/', icon = ' ', lang = 'regex' },
                search_up = { kind = 'search', pattern = '^%?', icon = ' ', lang = 'regex' },
                filter = { pattern = '^:%s*!', icon = '$', ft = 'sh' },
                lua = { pattern = '^:%s*lua%s+', icon = '', ft = 'lua' },
                help = { pattern = '^:%s*h%s+', icon = '' },
                input = {}, -- Used by input()
            },
        },
        messages = {
            -- NOTE: If you enable messages, then the cmdline is enabled automatically.
            -- This is a current Neovim limitation.
            enabled = true, -- enables the Noice messages UI
            view = 'notify', -- default view for messages
            view_error = 'notify', -- view for errors
            view_warn = 'notify', -- view for warnings
            view_history = 'messages', -- view for :messages
            view_search = 'virtualtext', -- view for search count messages. Set to `false` to disable
        },
        popupmenu = {
            enabled = true, -- disable if you use something like cmp-cmdline
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
        notify = {
            -- Noice can be used as `vim.notify` so you can route any notification like other messages
            -- Notification messages have their level and other properties set.
            -- event is always "notify" and kind can be any log level as a string
            -- The default routes will forward notifications to nvim-notify
            enabled = true,
            view = 'notify',
        },
        health = {
            checker = false, -- Disable if you don't want health checks to run
        },
        lsp = {
            progress = {
                enabled = false,
                -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
                -- See the section on formatting for more details on how to customize.
                --- @type NoiceFormat|string
                format = 'lsp_progress',
                --- @type NoiceFormat|string
                format_done = 'lsp_progress_done',
                throttle = 1000 / 30, -- frequency to update lsp progress message
                view = 'mini',
            },
            override = {
                -- override the default lsp markdown formatter with Noice
                ['vim.lsp.util.convert_input_to_markdown_lines'] = false,
                -- override the lsp markdown formatter with Noice
                ['vim.lsp.util.stylize_markdown'] = false,
                -- override cmp documentation with Noice (needs the other options to work)
                ['cmp.entry.get_documentation'] = false,
            },
            hover = {
                enabled = false,
                view = nil, -- when nil, use defaults from documentation
                ---@type NoiceViewOptions
                opts = {}, -- merged with defaults from documentation
            },
            signature = {
                enabled = false,
                auto_open = {
                    enabled = true,
                    trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
                    luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
                    throttle = 50, -- Debounce lsp signature help request by 50ms
                },
                view = nil, -- when nil, use defaults from documentation
                ---@type NoiceViewOptions
                opts = {}, -- merged with defaults from documentation
            },
            message = {
                -- Messages shown by lsp servers
                enabled = true,
                view = 'notify',
                opts = {},
            },
            -- defaults for hover and signature help
            documentation = {
                view = 'hover',
                ---@type NoiceViewOptions
                opts = {
                    lang = 'markdown',
                    replace = true,
                    render = 'plain',
                    format = { '{message}' },
                    win_options = {
                        concealcursor = 'n',
                        conceallevel = 3,
                    },
                },
            },
        },
        throttle = 1000 / 120, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
        ---@type table<string, NoiceViewOptions>
        views = {}, -- @see the section on views below
        ---@type NoiceRouteConfig[]
        routes = {}, -- @see the section on routes below
        ---@type table<string, NoiceFilter>
        status = {}, --@see the section on statusline components below
    })
end
