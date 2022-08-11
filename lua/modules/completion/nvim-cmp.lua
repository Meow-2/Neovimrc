return function()
  local cmp = require('cmp')

  local map = cmp.mapping
  local insert_map = cmp.mapping.preset.insert()
  rawset(insert_map, '<C-d>', map.scroll_docs(4))
  rawset(insert_map, '<C-u>', map.scroll_docs(-4))
  rawset(insert_map, '<C-j>', map.select_next_item())
  rawset(insert_map, '<C-k>', map.select_prev_item())
  rawset(insert_map, '<CR>', map(map.confirm({ select = true }), {'i','c'}))
  rawset(insert_map, '<Tab>', map(map.select_next_item(),{'i','c'}))
  rawset(insert_map, '<S-Tab>', map(map.select_prev_item(),{'i','c'}))
  rawset(insert_map, '<C-Space>', map(map.complete(),{'i','c'}))

  cmp.setup({
    preselect = cmp.PreselectMode.Item,
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
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
  cmp.setup.cmdline(':', { sources = { { name = 'cmdline' } } })
  cmp.setup.cmdline('/', { sources = { { name = 'buffer' } } })
  cmp.setup.cmdline('?', { sources = { { name = 'buffer' } } })
end



