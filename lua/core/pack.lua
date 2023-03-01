local uv, api, fn = vim.loop, vim.api, vim.fn

local pack = {}
pack.__index = pack

function pack:load_modules_packages()
    local modules_dir = self.helper.path_join(self.config_path, 'lua', 'modules')
    self.repos = {}

    local list = vim.fs.find('package.lua', { path = modules_dir, type = 'file', limit = 10 })
    if #list == 0 then
        return
    end

    local disable_modules = {}

    if fn.exists('g:disable_modules') == 1 then
        disable_modules = vim.split(vim.g.disable_modules, ',', { trimempty = true })
    end

    for _, f in pairs(list) do
        local _, pos = f:find(modules_dir)
        f = f:sub(pos - 6, #f - 4)
        if not vim.tbl_contains(disable_modules, f) then
            require(f)
        end
    end
end

function pack:boot_strap()
    self.helper = require('core.helper')
    self.data_path = self.helper.data_path()
    self.config_path = self.helper.config_path()
    local lazy_path = self.helper.path_join(self.data_path, 'lazy', 'lazy.nvim')
    local state = uv.fs_stat(lazy_path)
    if not state then
        local cmd = '!git clone https://github.com/folke/lazy.nvim ' .. lazy_path
        api.nvim_command(cmd)
    end
    vim.opt.runtimepath:prepend(lazy_path)
    require('lazy.view.config').keys.hover = '<C-k>'
    local lazy = require('lazy')
    local opts = {
        lockfile = self.helper.path_join(self.data_path, 'lazy-lock.json'),
        ui = {
            -- a number <1 is a percentage., >1 is a fixed size
            -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
            border = 'single',
        },
    }
    self:load_modules_packages()
    lazy.setup(self.repos, opts)

    for k, v in pairs(self) do
        if type(v) ~= 'function' then
            self[k] = nil
        end
    end
end

function pack.package(repo)
    if not pack.repos then
        pack.repos = {}
    end
    table.insert(pack.repos, repo)
end

function pack:config(modules_path)
    return function(package)
        package = package:gsub('%.', '-')
        local package_config_path = self.helper.path_join(
            self.config_path,
            'lua',
            modules_path:gsub('%.', '/'),
            package .. '.lua'
        )
        local f = io.open(package_config_path)
        if not f then
            -- if #vim.fn.glob(package_config_path) == 0 then
            os.execute('echo "return function()\nend" > ' .. package_config_path)
        end
        return require(modules_path .. '.' .. package)
    end
end

return pack
