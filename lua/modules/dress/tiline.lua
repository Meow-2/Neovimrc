local status_ok, galaxyline = pcall(require, 'galaxyline')
if not status_ok then
    return
end

local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local fileinfo = require('galaxyline.provider_fileinfo')
local gls = galaxyline.section
galaxyline.short_line_list = {
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
}

local mode_color = {
    ['!'] = colors.red,
    [''] = colors.yellow,
    [''] = colors.orange,
    ['r?'] = colors.cyan,
    c = colors.magenta,
    ce = colors.red,
    cv = colors.red,
    i = colors.cyan,
    ic = colors.yellow,
    n = colors.red,
    no = colors.red,
    r = colors.cyan,
    R = colors.violet,
    rm = colors.cyan,
    Rv = colors.violet,
    s = colors.orange,
    S = colors.orange,
    t = colors.orange,
    v = colors.orange,
    V = colors.orange,
}

gls.left[1] = {
    RainbowRed = {
        provider = function()
            return '▊ '
        end,
        highlight = { colors.blue, colors.bg },
    },
}

gls.left[2] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            vim.api.nvim_command(
                'hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.bg
            )
            return ' '
        end,
    },
}

gls.left[3] = {
    FileSize = {
        condition = condition.buffer_not_empty,
        -- highlight = { colors.red, colors.bg },
        provider = function()
            vim.api.nvim_command(
                'hi GalaxyFileSize guifg='
                    .. mode_color[vim.fn.mode()]
                    .. ' guibg='
                    .. colors.bg
                    .. ' gui=bold'
            )
            return fileinfo.get_file_size()
        end,
    },
}

gls.left[4] = {
    FileIcon = {
        condition = condition.buffer_not_empty,
        highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg },
        provider = 'FileIcon',
    },
}

gls.left[5] = {
    FileName = {
        condition = condition.buffer_not_empty,
        highlight = { colors.blue, colors.bg, 'bold' },
        provider = 'FileName',
    },
}

gls.left[6] = {
    LineInfo = {
        highlight = { colors.cyan, colors.bg, 'bold' },
        provider = 'LineColumn',
        separator = ' ',
        separator_highlight = { 'NONE', colors.bg },
    },
}

gls.left[7] = {
    PerCent = {
        highlight = { colors.cyan, colors.bg, 'bold' },
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = { 'NONE', colors.bg },
    },
}

gls.left[8] = {
    DiagnosticError = {
        highlight = { colors.red, colors.bg },
        icon = '  ',
        provider = 'DiagnosticError',
    },
}

gls.left[9] = {
    DiagnosticWarn = {
        highlight = { colors.yellow, colors.bg },
        icon = '  ',
        provider = 'DiagnosticWarn',
    },
}

gls.left[10] = {
    DiagnosticHint = {
        highlight = { colors.cyan, colors.bg },
        icon = '  ',
        provider = 'DiagnosticHint',
    },
}

gls.left[11] = {
    DiagnosticInfo = {
        highlight = { colors.blue, colors.bg },
        icon = '  ',
        provider = 'DiagnosticInfo',
    },
}

gls.mid[1] = {
    ShowLspClient = {
        condition = function()
            local tbl = { ['dashboard'] = true, [''] = true }
            if tbl[vim.bo.filetype] then
                return false
            end
            return true
        end,
        highlight = { colors.yellow, colors.bg, 'bold' },
        icon = ' LSP:',
        provider = 'GetLspClient',
    },
}

gls.right[1] = {
    GitIcon = {
        provider = function()
            return '  '
        end,
        condition = condition.check_git_workspace,
        highlight = { colors.red, colors.bg },
        separator = ' ',
        separator_highlight = { 'NONE', colors.bg },
    },
}

gls.right[2] = {
    GitBranch = {
        condition = condition.check_git_workspace,
        highlight = { colors.red, colors.bg, 'bold' },
        provider = 'GitBranch',
    },
}

gls.right[3] = {
    Separator = {
        provider = function()
            return ' '
        end,
    },
}

gls.right[4] = {
    DiffAdd = {
        condition = condition.hide_in_width,
        highlight = { colors.green, colors.bg },
        icon = '  ',
        provider = 'DiffAdd',
    },
}

gls.right[5] = {
    DiffModified = {
        condition = condition.hide_in_width,
        highlight = { colors.orange, colors.bg },
        icon = ' 柳',
        provider = 'DiffModified',
    },
}

gls.right[6] = {
    DiffRemove = {
        condition = condition.hide_in_width,
        highlight = { colors.red, colors.bg },
        icon = '  ',
        provider = 'DiffRemove',
    },
}

gls.right[7] = {
    FileEncode = {
        condition = condition.hide_in_width,
        highlight = { colors.green, colors.bg },
        provider = 'FileEncode',
        separator = ' ',
        separator_highlight = { 'NONE', colors.bg },
    },
}

gls.right[8] = {
    FileFormat = {
        condition = condition.hide_in_width,
        highlight = { colors.green, colors.bg },
        provider = 'FileFormat',
        separator = ' ',
        separator_highlight = { 'NONE', colors.bg },
    },
}

gls.right[9] = {
    RainbowBlue = {
        provider = function()
            return '  ▊'
        end,
        highlight = { colors.blue, colors.bg },
    },
}

gls.short_line_left[1] = {
    BufferType = {
        highlight = { colors.blue, colors.bg, 'bold' },
        provider = 'FileTypeName',
        separator = ' ',
        separator_highlight = { 'NONE', colors.bg },
    },
}

gls.short_line_left[2] = {
    SFileName = {
        condition = condition.buffer_not_empty,
        highlight = { colors.fg, colors.bg, 'bold' },
        provider = 'SFileName',
    },
}

gls.short_line_right[1] = {
    BufferIcon = {
        highlight = { colors.fg, colors.bg },
        provider = 'BufferIcon',
    },
}
