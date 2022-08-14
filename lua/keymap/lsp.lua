local key = require('core.keymap')
local nore_silent = key.new_opts(key.noremap,key.silent)
function _LSP_MAP(buffnr)
    local nore_silent_buf = nore_silent
    nore_silent_buf.buffer = buffnr
    key.nmap({
        { '<Leader>e', vim.diagnostic.open_float, nore_silent },
        -- { '-', vim.diagnostic.goto_prev, nore_silent },
        -- { '=', vim.diagnostic.goto_next, nore_silent },
        -- { 'gD', vim.lsp.buf.declaration, nore_silent_buf },
        { 'gd', vim.lsp.buf.definition, nore_silent_buf },
        { 'gi', vim.lsp.buf.implementation, nore_silent_buf },
        { 'gr', vim.lsp.buf.references, nore_silent_buf },
        { '<Leader>a', vim.diagnostic.setloclist, nore_silent },
        { '<Leader>.', vim.lsp.buf.code_action, nore_silent_buf },
        { '<Leader>=', vim.lsp.buf.formatting, nore_silent_buf },
        { '<Leader>d', vim.lsp.buf.type_definition, nore_silent_buf },
        -- { '<C-k>', vim.lsp.buf.hover, nore_silent_buf },
        -- { '<Leader>rn', vim.lsp.buf.rename, nore_silent_buf },
        -- { '<Leader>wa', vim.lsp.buf.add_workspace_folder, nore_silent_buf },
        -- { '<Leader>wr', vim.lsp.buf.remove_workspace_folder, nore_silent_buf },
        -- { '<Leader>wl', function()print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, nore_silent_buf },
    })
    -- key.imap({ '<C-p>', vim.lsp.buf.signature_help, nore_silent_buf })
end

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local function super_tab(cmp,luasnip,select_behavior)
      return  function(fallback)
        if cmp.visible() then
            cmp.select_next_item(select_behavior)
        elseif luasnip.jumpable(1) then
            luasnip.jump(1)
        elseif has_words_before() then
            cmp.complete()
        else
            fallback()
        end
    end
end

  local function super_s_tab(cmp, luasnip, select_behavior)
      return function(fallback)
      if cmp.visible() then
            cmp.select_prev_item(select_behavior)
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end
end

function _CMP_MAP(cmp,luasnip,select_behavior)
 local insert_map = cmp.mapping.preset.insert()
  rawset(insert_map, '<C-d>', cmp.mapping.scroll_docs(4))
  rawset(insert_map, '<C-u>', cmp.mapping.scroll_docs(-4))
  rawset(insert_map, '<C-j>', cmp.mapping.select_next_item())
  rawset(insert_map, '<C-k>', cmp.mapping.select_prev_item())
  rawset(insert_map, '<CR>', cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true }))
  rawset(insert_map, '<Tab>', cmp.mapping(super_tab(cmp,luasnip,{behavior = select_behavior}),{'i','c'}))
  rawset(insert_map, '<S-Tab>', cmp.mapping(super_s_tab(cmp,luasnip,{behavior = select_behavior}),{'i','c'}))
  rawset(insert_map, '<C-Space>', cmp.mapping(cmp.mapping.complete(),{'i','c'}))
return insert_map
end
