return function()
    local gl = require('galaxyline')
    local condition = require('galaxyline.condition')
    local gls = gl.section

    gl.short_line_list = { -- {{{
        'dap-repl',
        'dapui_breakpoints',
        'dapui_watches',
        'dapui_stacks',
        'dapui_scopes',
        'nvimgdb',
        'NvimTree',
        'vista',
        'packer',
        'lspsagaoutline',
        'dashboard',
    } -- }}}

    local colors = { -- {{{
        bg = 'NONE',
        fg = '#656a6c',
        yellow = '#ECBE7B',
        cyan = '#008080',
        darkblue = '#081633',
        green = '#98be65',
        orange = '#FF8800',
        violet = '#a9a1e1',
        magenta = '#c678dd',
        blue = '#51afef',
        red = '#ec5f67',
        grey = '#656a6c',
        light_grey = '#abadad',
    } -- }}}

    local mode_str = { -- {{{
        n = 'NORMAL',
        no = 'NORMAL',
        i = 'INSERT',
        ic = 'INSERT',
        c = 'COMMAND',
        ce = 'COMMAND',
        cv = 'Ex',
        V = 'V-LINE',
        [''] = 'V-BLOCK',
        v = 'VISUAL',
        ['r?'] = ':CONFIRM',
        rm = 'MORE',
        R = 'REPLACE',
        Rv = 'V-REPLACE',
        s = 'SELECT',
        S = 'S-LINE',
        r = 'H-ENTER',
        [''] = 'S-BLOCK',
        t = 'TERMINAL',
        ['!'] = 'SHELL',
    } -- }}}
    --
    -- local mode_color = { --{{{
    --     ['!'] = colors.red,
    --     [''] = colors.orange,
    --     [''] = colors.yellow,
    --     ['r?'] = colors.red,
    --     c = colors.magenta,
    --     ce = colors.magenta,
    --     cv = colors.magenta,
    --     i = colors.green,
    --     ic = colors.green,
    --     n = colors.blue,
    --     no = colors.blue,
    --     r = colors.magenta,
    --     R = colors.magenta,
    --     rm = colors.magenta,
    --     Rv = colors.magenta,
    --     s = colors.yellow,
    --     S = colors.yellow,
    --     t = colors.orange,
    --     v = colors.orange,
    --     V = colors.orange,
    -- } --}}}
    --
    -- local set_hl = function(group, _fg, _bg) --{{{
    --     vim.api.nvim_set_hl(0, 'Galaxy' .. group, { fg = _fg, bg = _bg })
    -- end --}}}

    local buffer_is_readonly = function() --{{{
        return vim.bo.readonly or not vim.bo.modifiable
    end --}}}

    local file_with_icons = function(file, modified_icon, readonly_icon) --{{{
        if vim.fn.empty(file) == 1 then
            return ''
        end

        modified_icon = modified_icon or ''
        readonly_icon = readonly_icon or ''

        if buffer_is_readonly() then
            file = file .. readonly_icon
        end

        if vim.bo.modifiable and vim.bo.modified then
            file = file .. modified_icon
        end

        return ' ' .. file .. ' '
    end --}}}

    local left_separator = ''
    local right_separator = ''

    gls.left[1] = {
        RainbowRed = {
            provider = function()
                -- set_hl('RainbowRed', mode_color[vim.fn.mode()], colors.bg)
                return '▊'
            end,
            highlight = { colors.fg, colors.bg },
        },
    }

    gls.left[2] = {
        ViMode = {
            provider = function()
                -- set_hl('ViMode', mode_color[vim.fn.mode()], colors.bg)
                return '  ' .. mode_str[vim.fn.mode()] .. ' '
            end,
            highlight = { colors.light_grey, colors.bg },
            separator = left_separator,
            separator_highlight = { colors.grey, colors.bg },
        },
    }

    gls.left[3] = {
        GitIcon = {
            condition = condition.check_git_workspace,
            provider = function()
                return '  '
            end,
            highlight = { colors.fg, colors.bg },
        },
    }

    gls.left[4] = {
        GitBranch = {
            condition = condition.check_git_workspace,
            provider = 'GitBranch',
            highlight = { colors.fg, colors.bg },
            separator = ' ' .. left_separator,
            separator_highlight = { colors.grey, colors.bg },
        },
    }

    gls.left[5] = {
        FileName_Custom = {
            condition = condition.buffer_not_empty,
            provider = function()
                local file = vim.fn.expand('%:t')
                -- set_hl('FileName_Custom', mode_color_fg_alpha[vim.fn.mode()], colors.bg2)
                return file_with_icons(file, '[+]', '[-]')
            end,
            highlight = { colors.fg, colors.bg },
            separator = left_separator,
            separator_highlight = { colors.grey, colors.bg },
        },
    }

    gls.left[6] = {
        DiffAdd = {
            condition = condition.hide_in_width,
            provider = 'DiffAdd',
            icon = ' + ',
            highlight = { colors.green, colors.bg },
        },
    }

    gls.left[7] = {
        DiffModified = {
            condition = condition.hide_in_width,
            provider = 'DiffModified',
            icon = ' ~ ',
            highlight = { colors.orange, colors.bg },
        },
    }

    gls.left[8] = {
        DiffRemove = {
            condition = condition.hide_in_width,
            provider = 'DiffRemove',
            icon = ' - ',
            highlight = { colors.red, colors.bg },
        },
    }

    gls.mid[1] = {
        ShowLspClient = {
            provider = 'GetLspClient',
            condition = function()
                local tbl = { ['dashboard'] = true, [''] = true }
                if tbl[vim.bo.filetype] then
                    return false
                end
                return true
            end,
            icon = ' Lsp:',
            -- highlight = { colors.fg, colors.bg, 'bold' },
            highlight = { colors.light_grey, colors.bg },
        },
    }

    gls.mid[2] = {
        ModeMessage = {
            provider = function()
                local command_message = require('noice').api.statusline.command.get()
                command_message = command_message and ('  ' .. command_message) or ''
                local mode_message = require('noice').api.statusline.mode.get()
                mode_message = mode_message and ('  ' .. mode_message) or ''
                return mode_message .. command_message
            end,
            highlight = { colors.grey, colors.bg },
        },
    }

    gls.right[1] = {
        DiagnosticError = {
            provider = 'DiagnosticError',
            icon = ' 󰅚 ',
            highlight = { colors.red, colors.bg },
        },
    }

    gls.right[2] = {
        DiagnosticWarn = {
            provider = 'DiagnosticWarn',
            icon = ' 󰀪 ',
            highlight = { colors.yellow, colors.bg },
        },
    }

    gls.right[3] = {
        DiagnosticHint = {
            provider = 'DiagnosticHint',
            icon = ' 󰋽 ',
            highlight = { colors.cyan, colors.bg },
        },
    }

    gls.right[4] = {
        DiagnosticInfo = {
            provider = 'DiagnosticInfo',
            icon = '  ',
            highlight = { colors.blue, colors.bg },
        },
    }

    gls.right[5] = {
        FileEncode = {
            condition = condition.hide_in_width,
            provider = function()
                local encode = vim.bo.fenc ~= '' and vim.bo.fenc or vim.o.enc
                return encode .. ' '
            end,
            separator = right_separator .. ' ',
            separator_highlight = { colors.grey, colors.bg },
            highlight = { colors.fg, colors.bg },
        },
    }

    gls.right[6] = {
        FileFormat = {
            condition = condition.hide_in_width,
            provider = function()
                local ff = vim.bo.fileformat
                if ff == 'unix' then
                    return ' '
                elseif ff == 'dos' then
                    return ' '
                elseif ff == 'mac' then
                    return ' '
                end
            end,
            separator = right_separator .. ' ',
            separator_highlight = { colors.grey, colors.bg },
            highlight = { colors.fg, colors.bg },
        },
    }

    gls.right[7] = {
        FileIcon = {
            condition = condition.buffer_not_empty,
            separator = right_separator .. ' ',
            separator_highlight = { colors.grey, colors.bg },
            highlight = {
                require('galaxyline.provider_fileinfo').get_file_icon_color,
                colors.bg,
            },
            provider = function()
                local icon = require('galaxyline.provider_fileinfo').get_file_icon()
                return icon ~= '' and icon or ''
            end,
        },
    }

    gls.right[8] = {
        FileType = {
            condition = condition.buffer_not_empty,
            highlight = { colors.fg, colors.bg },
            provider = function()
                return vim.bo.filetype:gsub('^%l', string.upper) .. ' '
            end,
        },
    }

    gls.right[9] = {
        PerCent = {
            provider = function()
                -- set_hl('PerCent', mode_color[vim.fn.mode()], colors.bg)
                return require('galaxyline.provider_fileinfo').current_line_percent()
            end,
            separator = right_separator,
            separator_highlight = { colors.grey, colors.bg },
            highlight = { colors.fg, colors.bg },
        },
    }

    gls.right[10] = {
        LineInfo = {
            provider = function()
                local line = vim.fn.line('.')
                local column = vim.fn.col('.')
                -- set_hl('LineInfo', mode_color[vim.fn.mode()], colors.bg)
                return string.format(' %3d:%-2d ', line, column)
            end,
            separator = right_separator,
            separator_highlight = { colors.grey, colors.bg },
            highlight = { colors.light_grey, colors.bg },
        },
    }
    gls.short_line_left[1] = {
        BufferType = {
            provider = function()
                -- set_hl('BufferType', mode_color[vim.fn.mode()], mode_color_alpha[vim.fn.mode()])
                -- return file_with_icons(file, '[+]', '[-]')
                return file_with_icons(
                    ' ' .. vim.bo.filetype:gsub('^%l', string.upper) .. ' ',
                    '[+]',
                    '[-]'
                )
                -- return '  ' .. vim.bo.filetype:gsub('^%l', string.upper) .. ' '
            end,
        },
    }

    gls.short_line_right[1] = {
        BufferIcon = {
            provider = 'BufferIcon',
            highlight = { colors.fg, colors.bg },
        },
    }

    gls.short_line_right[2] = {
        ShortPerCent = {
            provider = function()
                local line = vim.fn.line('.')
                local column = vim.fn.col('.')
                return string.format('  %3d:%-2d ', line, column)
            end,
            highlight = { colors.fg, colors.bg },
        },
    }
end
