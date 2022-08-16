return function()
    local luasnip = require("luasnip")
    local cmp = require('cmp')

    local insert_map = _CMP_MAP(cmp, luasnip)

    local win_style = {
        border = "single",
        winhighlight =  'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
        zindex = 1001,
        col_offset =  0,
        side_padding = 1,
    }
    cmp.setup({
        preselect = cmp.PreselectMode.Item,
        -- confirm_opts = {
            --    
            --     select = false,
            -- },
            window = {
                completion = win_style,
                documentation = win_style,
            },
            experimental = {
                ghost_text = false,
                native_menu = false,
            },
            formatting = {
                fields = { 'kind', 'abbr', 'menu' },
                format = function(entry, vim_item)
                    local lspkind_icons = {
                        Text = "",
                        Method = "",
                        Function = "",
                        Constructor = "",
                        Field = "",
                        Variable = "",
                        Class = "ﴯ",
                        Interface = "",
                        Module = "",
                        Property = "",
                        Unit = "",
                        Value = "",
                        Enum = "",
                        Keyword = "ﰠ",
                        Snippet = "",
                        Color = "",
                        File = "",
                        Reference = "",
                        Folder = "",
                        EnumMember = "",
                        Constant = "",
                        Struct = "",
                        Event = "",
                        Operator = "",
                        TypeParameter = ""
                    }
                    local meta_type = vim_item.kind
                    -- load lspkind icons
                    vim_item.menu = ({
                        buffer = ' [Buffer]',
                        nvim_lsp = ' ['.. meta_type ..']',
                        path = ' [Path]',
                        luasnip = ' [Snip]',
                        cmdline = ' [Cmd]',
                    })[entry.source.name]

                    vim_item.kind = lspkind_icons[vim_item.kind] .. ''

                    return vim_item
                end,
            },
            -- You can set mappings if you want
            mapping = insert_map,
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
                { name = 'buffer' },
                { name = 'cmdline' },
            },
        })
        cmp.setup.cmdline(':', {mapping = cmp.mapping.preset.cmdline(), sources = { { name = 'cmdline' },{ name = 'path' }}})
        cmp.setup.cmdline('/', {mapping = cmp.mapping.preset.cmdline(), sources = { { name = 'buffer' } ,{ name = 'path' }} })
        cmp.setup.cmdline('?', {mapping = cmp.mapping.preset.cmdline(), sources = { { name = 'buffer' } } })
    end



