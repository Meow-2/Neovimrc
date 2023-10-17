return function()
    require('flash.config').setup({
        modes = {
            -- options used when flash is activated through
            -- a regular search with `/` or `?`
            search = {
                enabled = false,
            },
        },
    })
end
