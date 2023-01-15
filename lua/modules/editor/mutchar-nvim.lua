return function()
    local filters = require('mutchar.filters')
    require('mutchar').setup({
        -- ['c'] = {
        --     rules = { '-', '->' },
        --     filter = filters.non_space_before,
        -- },
        ['cpp'] = {
            rules = {
                { '-', '->' },
                { ',', ', ' },
            },
            filter = filters.has_space_before,
            -- one_to_one = true,
        },
        -- ['rust'] = {
        --     rules = {
        --         { ';', ': ' },
        --         { '-', '->' },
        --         { ',', '<!>' },
        --     },
        --     filter = {
        --         filters.semicolon_in_rust,
        --         filters.minus_in_rust,
        --         filters.generic_in_rust,
        --     },
        --     one_to_one = true,
        -- },
        -- ['lua'] = {
        --     rules = { ';', ':' },
        --     filter = filters.semicolon_in_lua,
        -- },
        ['go'] = {
            rules = {
                { ';', ' :=' },
                { ',', ' <-' },
            },
            filter = {
                filters.find_diagnostic_msg({ 'initial', 'undeclare' }),
                filters.go_arrow_symbol,
            },
            one_to_one = true,
        },
    })
end
