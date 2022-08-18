return function()
    --  require('bufferline').setup({
    --    options = {
    --      modified_icon = '✥',
    --      buffer_close_icon = '',
    --      always_show_bufferline = false,
    --    },
    --  })
    --
    require('bufferline').setup({
        options = {
            --        numbers = function(opts)
            --                return string.format('%s.', opts.ordinal)
            --              end,
            --modified_icon = '✥',
            offsets = {
                { filetype = 'NvimTree', text = ' File Explorer', text_align = 'center' },
            },
            diagnostics = false,
            buffer_close_icon = '',
            separator_style = 'thin',
            always_show_bufferline = 'true',
            show_close_icon = false,
            right_mouse_command = 'vertical sbuffer %d',
        },
    })
    local pick = require('bufferline.pick')
    local vsplit_with_pick = function()
        pick.choose_then(function(id)
            vim.cmd('vertical sb' .. id)
        end)
    end
    vim.api.nvim_create_user_command('BufferLinePickVsplit', vsplit_with_pick, {})
end
