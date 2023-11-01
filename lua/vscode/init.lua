local fn = vim.fn
local helper = require('vscode.helper')
-- remove check is windows because I only use mac or linux
local cache_dir = helper.path_join(vim.fn.stdpath('cache'))

-- Create cache dir and subs dir
local createdir = function()
    local data_dir = {
        cache_dir .. '/backup',
        cache_dir .. '/sessions',
        cache_dir .. '/swap',
        cache_dir .. '/tags',
        cache_dir .. '/undo',
        cache_dir .. '/formatter',
    }
    -- There only check once that If cache_dir exists
    -- Then I don't want to check subs dir exists
    if fn.isdirectory(cache_dir) == 0 then
        os.execute('mkdir -p ' .. cache_dir)
        for _, v in pairs(data_dir) do
            if fn.isdirectory(v) == 0 then
                os.execute('mkdir -p ' .. v)
            end
        end
    end
end

createdir()

local filesize = vim.fn.getfsize(vim.fn.expand('%'))
if filesize > 750000 then
    require('vscode.largefile.options')
    require('vscode.largefile.keymap')
    require('vscode.pack'):boot_strap()
else
    require('vscode.options')
    require('vscode.keymap')
    require('vscode.pack'):boot_strap()
    require('vscode.event')
end
