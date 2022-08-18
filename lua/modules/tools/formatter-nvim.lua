return function()
    -- Utilities for creating configurations
    local util = require('formatter.util')
    -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
    require('formatter').setup({
        -- Enable or disable logging
        logging = false,
        -- Set the log level
        log_level = vim.log.levels.WARN,
        -- All formatter configurations are opt-in
        filetype = {
            sh = {
                function()
                    return vim.b.disable_format and {}
                        or {
                            exe = 'shfmt',
                            args = { '-i', 4, '-ci', '-bn' },
                            stdin = true,
                        }
                end,
            },
            cpp = {
                function()
                    return vim.b.disable_format and {}
                        or {
                            exe = 'clang-format',
                            args = {
                                '-assume-filename',
                                util.escape_path(util.get_current_buffer_file_name()),
                            },
                            stdin = true,
                            try_node_modules = true,
                        }
                end,
            },
            python = {
                function()
                    return vim.b.disable_format and {}
                        or {
                            exe = 'autopep8',
                            args = { '-' },
                            stdin = 1,
                        }
                end,
            },
            json = {
                function()
                    return vim.b.disable_format and {}
                        or {
                            exe = 'clang-format',
                            args = {
                                '-assume-filename',
                                util.escape_path(util.get_current_buffer_file_name()),
                            },
                            stdin = true,
                            try_node_modules = true,
                        }
                end,
            },
            cmake = {
                function()
                    return vim.b.disable_format and {}
                        or {
                            exe = 'cmake-format',
                            args = { '-' },
                            stdin = true,
                        }
                end,
            },
            go = {
                function()
                    return vim.b.disable_format and {}
                        or {
                            exe = 'gofmt',
                            stdin = true,
                        }
                end,
            },
            lua = {
                function()
                    return vim.b.disable_format and {}
                        or {
                            exe = 'stylua',
                            args = {
                                '--search-parent-directories',
                                '--stdin-filepath',
                                util.escape_path(util.get_current_buffer_file_path()),
                                '--',
                                '-',
                            },
                            stdin = true,
                        }
                end,
            },

            -- Use the special "*" filetype for defining formatter configurations on
            -- any filetype
            ['*'] = {
                -- "formatter.filetypes.any" defines default configurations for any
                -- filetype
                function(parser)
                    if vim.b.disable_format then
                        return {}
                    end
                    if not parser then
                        return {
                            exe = 'prettier',
                            args = {
                                '--stdin-filepath',
                                util.escape_path(util.get_current_buffer_file_path()),
                            },
                            stdin = true,
                            try_node_modules = true,
                        }
                    end

                    return {
                        exe = 'prettier',
                        args = {
                            '--stdin-filepath',
                            util.escape_path(util.get_current_buffer_file_path()),
                            '--parser',
                            parser,
                        },
                        stdin = true,
                        try_node_modules = true,
                    }
                end,
            },
        },
    })
    vim.api.nvim_create_augroup('Format_on_write', { clear = true })
    vim.api.nvim_create_autocmd('BufWritePost', {
        group = 'Format_on_write',
        pattern = { '*' },
        callback = function()
            vim.api.nvim_command('FormatWrite')
        end,
    })
    function Toggle_Format()
        if vim.b.disable_format then
            print('Formatter.nvim Enabled in Buffer!')
            vim.b.disable_format = false
            return
        end
        print('Formatter.nvim Disabled in Buffer!')
        vim.b.disable_format = true
    end
end
