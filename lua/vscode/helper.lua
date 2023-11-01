local helper = {}
helper.path_sep = package.config:sub(1, 1) == '\\' and '\\' or '/'

function helper.path_join(...)
    return table.concat({ ... }, helper.path_sep)
end

function helper.data_path()
    return vim.fn.stdpath('data')
end

function helper.config_path()
    return vim.fn.stdpath('config')
end

function helper.cache_path()
    return vim.fn.stdpath('cache')
end

function helper.cmd(str)
    return '<cmd>' .. str .. '<CR>'
end

return helper
