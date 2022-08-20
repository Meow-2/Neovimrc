return function()
    require('zephyr')
    -- vim.cmd('colorscheme zephyr')
    vim.cmd('highlight Comment cterm=italic gui=italic')
    -- vim.cmd('highlight Cursor gui=bold,italic')
    -- local function terminal_color()
    --     vim.g.terminal_color_0 = '#262a33'
    --     vim.g.terminal_color_1 = '#e95678'
    --     vim.g.terminal_color_2 = '#afd700'
    --     vim.g.terminal_color_3 = '#fac661'
    --     vim.g.terminal_color_4 = '#61afef'
    --     vim.g.terminal_color_5 = '#CBA6F7'
    --     vim.g.terminal_color_6 = '#36d0e0'
    --     vim.g.terminal_color_7 = '#e0e0e0'
    --     vim.g.terminal_color_8 = '#c78665'
    --     vim.g.terminal_color_9 = '#e95678'
    --     vim.g.terminal_color_10 = '#afd700'
    --     vim.g.terminal_color_11 = '#fac661'
    --     vim.g.terminal_color_12 = '#61afef'
    --     vim.g.terminal_color_13 = '#CBA6F7'
    --     vim.g.terminal_color_14 = '#36d0e0'
    --     vim.g.terminal_color_15 = '#bc2cf'
    -- end
    -- local async_load_plugin
    -- async_load_plugin = vim.loop.new_async(vim.schedule_wrap(function()
    --     terminal_color()
    --     vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#de841b' })
    --     vim.api.nvim_set_hl(0, 'CursorWord', { bg = '#3f444a', underline = false })
    --     async_load_plugin:close()
    -- end))
    -- async_load_plugin:send()
end
