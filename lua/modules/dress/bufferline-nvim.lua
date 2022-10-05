---@diagnostic disable: assign-type-mismatch
return function()
    require('bufferline').setup({
        options = {
            offsets = {
                {
                    filetype = 'NvimTree',
                    text = ' File Explorer',
                    text_align = 'center',
                    highlight = 'NvimTreeSpecialFile',
                    separator = true,
                },
            },
            diagnostics = false,
            indicator = {
                icon = '┃', -- this should be omitted if indicator style is not 'icon'
            },
            buffer_close_icon = '',
            separator_style = { ' ', ' ' },
            always_show_bufferline = true,
            show_close_icon = false,
            right_mouse_command = 'vertical sbuffer %d',
            hover = {
                enabled = true,
                delay = 50,
                reveal = { 'close' },
            },
        },
        highlights = {
            close_button_selected = {
                fg = {
                    attribute = 'bg',
                    highlight = 'DiffDelete',
                },
            },
            -- separator = {
            --     fg = {
            --         attribute = 'bg',
            --         highlight = 'TabLineSel',
            --     },
            -- },
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
