local MyGroup = vim.api.nvim_create_augroup('MyGroup', { clear = true })


-- highlight on_yank
vim.api.nvim_create_autocmd('TextYankPost', {
    group = MyGroup,
    pattern = { '*' },
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 400 })
    end
})

-- set highlight
vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter'}, {
    group = MyGroup,
    pattern = { '*' },
    callback = function()
        vim.cmd('highlight Comment cterm=italic gui=italic')
        vim.cmd('highlight Cursor cterm=bold,italic gui=bold,italic')
        vim.api.nvim_set_hl(0,'CursorWord',{bg ='#3f444a' ,underline=false})

        vim.g.terminal_color_0  = '#262a33'
        vim.g.terminal_color_1  = '#e95678'
        vim.g.terminal_color_2  = '#afd700'
        vim.g.terminal_color_3  = '#fac661'
        vim.g.terminal_color_4  = '#61afef'
        vim.g.terminal_color_5  = '#CBA6F7'
        vim.g.terminal_color_6  = '#36d0e0'
        vim.g.terminal_color_7  = '#e0e0e0'
        vim.g.terminal_color_8  = '#c78665'
        vim.g.terminal_color_9  = '#e95678'
        vim.g.terminal_color_10 = '#afd700'
        vim.g.terminal_color_11 = '#fac661'
        vim.g.terminal_color_12 = '#61afef'
        vim.g.terminal_color_13 = '#CBA6F7'
        vim.g.terminal_color_14 = '#36d0e0'
        vim.g.terminal_color_15 = '#bbc2cf'
    end
})


-- cursorline
vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter', 'InsertLeave' }, {
    group = MyGroup,
    pattern = '*',
    callback = function()
        if vim.bo.filetype ~= 'dashboard' and not vim.opt_local.cursorline:get() then
            vim.opt_local.cursorline = true
        end
    end,
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave', 'InsertEnter' }, {
    group = MyGroup,
    pattern = '*',
    callback = function()
        if vim.bo.filetype ~= 'dashboard' and vim.opt_local.cursorline:get() then
            vim.opt_local.cursorline = false
        end
    end,
})

-- cursorword

local function matchadd()--{{{
    local disable_ft = {
        ['NvimTree'] = true,
        ['lspsagafinder'] = true,
        ['dashboard'] = true,
        ['mason.nvim'] = true,
        ['lspsagaoutline'] = true,
    }
    if disable_ft[vim.bo.ft] then
        return
    end

    if vim.api.nvim_get_mode().mode == 'i' then
        return
    end

    local column = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    local cursorword = vim.fn.matchstr(line:sub(1, column + 1), [[\k*$]])
    .. vim.fn.matchstr(line:sub(column + 1), [[^\k*]]):sub(2)

    if cursorword == vim.w.cursorword then
        return
    end
    vim.w.cursorword = cursorword
    if vim.w.cursorword_match == 1 then
        vim.call('matchdelete', vim.w.cursorword_id)
    end
    vim.w.cursorword_match = 0
    if
        cursorword == ''
        or #cursorword > 100
        or #cursorword < 3
        or string.find(cursorword, '[\192-\255]+') ~= nil
        then
            return
        end
        local pattern = [[\<]] .. cursorword .. [[\>]]
        vim.w.cursorword_id = vim.fn.matchadd('CursorWord', pattern, -1)
        vim.w.cursorword_match = 1
end--}}}

    local function cursor_moved()--{{{
        if vim.api.nvim_get_mode().mode == 'n' then
            matchadd()
        end
    end--}}}

local function disable_cursorword()--{{{
local disable_ft = {
    ['NvimTree'] = true,
    ['lspsagafinder'] = true,
    ['dashboard'] = true,
    ['mason.nvim'] = true,
    ['lspsagaoutline'] = true,
}
if not disable_ft[vim.bo.ft] then
    return
end
if vim.w.cursorword_id ~= 0 and vim.w.cursorword_id ~= nil and vim.w.cursorword_match ~= 0 then
    vim.fn.matchdelete(vim.w.cursorword_id)
    vim.w.cursorword_id = nil
    vim.w.cursorword_match = nil
    vim.w.cursorword = nil
end
end--}}}

vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
    group = MyGroup,
    pattern = '*',
    callback = cursor_moved,
})

vim.api.nvim_create_autocmd({ 'InsertEnter', 'BufWinEnter' }, {
    group = MyGroup,
    pattern = '*',
    callback = disable_cursorword,
})
