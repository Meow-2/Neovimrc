return function()
--  require('bufferline').setup({
--    options = {
--      modified_icon = '✥',
--      buffer_close_icon = '',
--      always_show_bufferline = false,
--    },
--  })
  require("bufferline").setup{
    options = {
--        numbers = function(opts)
--                return string.format('%s.', opts.ordinal)
--              end,
        --modified_icon = '✥',
        diagnostics = false,
        buffer_close_icon = '',
        separator_style = "thin", 
        always_show_bufferline = "true",
        show_close_icon = false,
        right_mouse_command = "vertical sbuffer %d",
    }
}

end
