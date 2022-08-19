local MyGroup = vim.api.nvim_create_augroup('MyGroup', { clear = true })

-- highlight on_yank
vim.api.nvim_create_autocmd('TextYankPost', {
    group = MyGroup,
    pattern = { '*' },
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 400 })
    end,
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

local function matchadd() --{{{
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
end --}}}

local function cursor_moved() --{{{
    if vim.api.nvim_get_mode().mode == 'n' then
        matchadd()
    end
end --}}}

local function disable_cursorword() --{{{
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
end --}}}

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

vim.api.nvim_create_autocmd('FileType', {
    group = MyGroup,
    pattern = 'c,cpp,python,go,python,lua',
    callback = function()
        require('modules.debug.dap-utils').load_breakpoints()
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    group = MyGroup,
    pattern = 'dap-repl',
    callback = function()
        require('dap.ext.autocompl').attach()
    end,
})
