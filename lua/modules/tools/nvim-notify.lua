return function()
    vim.notify = require('notify')
    require('notify').setup({
        background_colour = '#262a33',
    })
end
