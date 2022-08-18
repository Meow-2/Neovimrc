local fn, uv, api = vim.fn, vim.loop, vim.api
-- User configuration directory. The init.lua is stored here.
local vim_path = vim.fn.stdpath('config')
-- User data directory. The shada-file is stored here.
local data_dir = string.format('%s/site/', vim.fn.stdpath('data'))

local modules_dir = vim_path .. '/lua/modules'
local packer_compiled = data_dir .. 'lua/packer_compiled.lua'
local packer = nil

local Packer = {}
Packer.__index = Packer

-- require("modules/completion/plugins")
-- require("modules/lang/plugins")
-- require("modules/tools/plugins")
-- require("modules/ui/plugins")
function Packer:load_plugins()
    self.repos = {}
    -- list = {"modules/completion/plugins", "modules/lang/plugins", "modules/tools/plugins", "modules/ui/plugins"}
    local get_plugins_list = function()
        local list = {}
        local tmp = vim.split(fn.globpath(modules_dir, '*/plugins.lua'), '\n')
        for _, f in ipairs(tmp) do
            list[#list + 1] = string.match(f, 'lua/(.+).lua$')
        end
        return list
    end

    local plugins_file = get_plugins_list()
    for _, m in ipairs(plugins_file) do
        require(m)
    end
end

-- load packer, must download packer.nvim before call this function
-- packer = require('packer')
-- load plugins
function Packer:load_packer()
    if not packer then
        api.nvim_command('packadd packer.nvim')
        packer = require('packer')
    end
    packer.init({
        compile_path = packer_compiled,
        git = { clone_timeout = 120 },
        disable_commands = true,
    })
    packer.reset()
    local use = packer.use
    self:load_plugins()
    use({ 'wbthomason/packer.nvim', opt = true })
    for _, repo in ipairs(self.repos) do
        use(repo)
    end
end

-- if don't have packer.nvim, download it, then load packer
function Packer:init_ensure_plugins()
    local packer_dir = data_dir .. 'pack/packer/opt/packer.nvim'
    local state = uv.fs_stat(packer_dir)
    if not state then
        local cmd = '!git clone https://github.com/wbthomason/packer.nvim ' .. packer_dir
        api.nvim_command(cmd)
        uv.fs_mkdir(data_dir .. 'lua', 511, function()
            assert('make compile path dir faield')
        end)
        self:load_packer()
        packer.sync()
    end
end

-- plugins[key] = packer[key]
local plugins = setmetatable({}, {
    __index = function(_, key)
        if not packer then
            Packer:load_packer()
        end
        return packer[key]
    end,
})

function plugins.ensure_plugins()
    Packer:init_ensure_plugins()
end

function plugins.register_plugin(repo)
    table.insert(Packer.repos, repo)
end

function plugins.conf_plugin(modules_path)
    return function(plugin)
        plugin = plugin:gsub('%.', '-')
        local vim_path = vim.fn.stdpath('config')
        local plugin_conf_path = vim_path
            .. '/lua/'
            .. modules_path:gsub('%.', '/')
            .. '/'
            .. plugin
            .. '.lua'
        if #vim.fn.glob(plugin_conf_path) == 0 then
            os.execute('echo "return function()\nend" > ' .. plugin_conf_path)
        end
        return require(modules_path .. '.' .. plugin)
    end
end
-- function plugins.compile_notify()
--   plugins.compile()
--   vim.notify('Compile Done!','info',{ title = 'Packer' })
-- end

function plugins.auto_compile()
    local file = vim.fn.expand('%:p')
    if not file:match(vim_path) then
        return
    end

    if file:match('plugins.lua') then
        plugins.clean()
    end
    plugins.compile()
    require('packer_compiled')
end

function plugins.load_compile()
    if vim.fn.filereadable(packer_compiled) == 1 then
        require('packer_compiled')
    else
        vim.notify('Run PackerSync or PackerCompile', 'info', { title = 'Packer' })
    end

    local cmds = {
        'Compile',
        'Install',
        'Update',
        'Sync',
        'Clean',
        'Status',
    }
    for _, cmd in ipairs(cmds) do
        api.nvim_create_user_command('Packer' .. cmd, function()
            require('core.pack')[fn.tolower(cmd)]()
        end, {})
    end

    local PackerHooks = vim.api.nvim_create_augroup('PackerHooks', {})
    vim.api.nvim_create_autocmd('User', {
        pattern = 'PackerCompileDone',
        callback = function()
            vim.notify('Compile Done!', vim.log.levels.INFO, { title = 'Packer' })
        end,
        group = PackerHooks,
    })

    -- vim.cmd [[command! PackerCompile lua require('core.pack').compile()]]
    -- vim.cmd [[command! PackerInstall lua require('core.pack').install()]]
    -- vim.cmd [[command! PackerUpdate lua require('core.pack').update()]]
    -- vim.cmd [[command! PackerSync lua require('core.pack').sync()]]
    -- vim.cmd [[command! PackerClean lua require('core.pack').clean()]]
    -- vim.cmd [[command! PackerStatus  lua require('packer').status()]]
end

return plugins
