local status_ok, galaxyline = pcall(require, 'galaxyline')
if not status_ok then
    return
end

local condition = require('galaxyline.condition')
local fileinfo = require('galaxyline.provider_fileinfo')
local vcs = require('galaxyline.provider_vcs')
local diagnostic = require('galaxyline.provider_diagnostic')
local lspclient = require('galaxyline.provider_lsp')

local gls = galaxyline.section

-- utils{{{

local hex_to_rgb = function(hex_str) --{{{
    local hex = '[abcdef0-9][abcdef0-9]'
    local pat = string.format('^#(%s)(%s)(%s)$', hex, hex, hex)
    hex_str = string.lower(hex_str)

    assert(string.find(hex_str, pat) ~= nil, 'hex_to_rgb: invalid hex_str: ' .. tostring(hex_str))

    local r, g, b = string.match(hex_str, pat)
    return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
end --}}}

local blend = function(fg, bg, alpha) --{{{
    local bg_rgb = hex_to_rgb(bg)
    local fg_rgb = hex_to_rgb(fg)

    local blend_channel = function(i)
        local ret = (alpha * fg_rgb[i] + ((1 - alpha) * bg_rgb[i]))
        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end

    return string.format('#%02X%02X%02X', blend_channel(1), blend_channel(2), blend_channel(3))
end --}}}

local darken = function(hex, amount, bg) --{{{
    return blend(hex, bg or '#000000', math.abs(amount))
end --}}}

local lighten = function(hex, amount, fg) --{{{
    return blend(hex, fg or '#FFFFFF', math.abs(amount))
end --}}}

local get_mode_color_alpha = function(mode_color, mod, alpha, fg) --{{{
    local tbl = {}
    for key, val in pairs(mode_color) do
        tbl[key] = mod(val, alpha, fg)
    end
    return tbl
end --}}}

local function buffer_is_readonly() --{{{
    if vim.bo.filetype == 'help' then
        return false
    end
    return vim.bo.readonly
end --}}}

local function file_with_icons(file, modified_icon, readonly_icon) --{{{
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

local function has_gitinfo() --{{{
    return vcs.diff_add() or vcs.diff_modified() or vcs.diff_remove()
end --}}}

local function has_diagnostic() --{{{
    if next(vim.lsp.buf_get_clients(0)) == nil then
        return false
    end
    local active_clients = vim.lsp.get_active_clients()

    if active_clients then
        local count = #vim.diagnostic.get(
            vim.api.nvim_get_current_buf(),
            { severity = vim.diagnostic.severity.ERROR }
        )
        if count ~= 0 then
            return true
        end
        count = #vim.diagnostic.get(
            vim.api.nvim_get_current_buf(),
            { severity = vim.diagnostic.severity.HINT }
        )
        if count ~= 0 then
            return true
        end
        count = #vim.diagnostic.get(
            vim.api.nvim_get_current_buf(),
            { severity = vim.diagnostic.severity.INFO }
        )
        if count ~= 0 then
            return true
        end
        count = #vim.diagnostic.get(
            vim.api.nvim_get_current_buf(),
            { severity = vim.diagnostic.severity.WARN }
        )
        if count ~= 0 then
            return true
        end
    else
        return false
    end
    return false
end --}}}

local set_hl = function(group, _fg, _bg) --{{{
    vim.api.nvim_set_hl(0, 'Galaxy' .. group, { fg = _fg, bg = _bg })
end --}}}

--}}}

galaxyline.short_line_list = { --{{{
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
} --}}}

local github_color = { --{{{
    -- -- Background Colors
    bg = '#ffffff',
    bg2 = '#f6f8fa',

    -- -- Foreground Colors
    fg = '#24292e',
    fg_dark = '#424242',
    fg_gutter = '#24292e',
    fg_light = '#24292e',
    fg_term = '#4d5566',

    -- -- Background Highlights Colors
    bg_highlight = '#d5e5f6',
    bg_search = '#fff2be',
    bg_visual = '#e1e4e8',
    bg_visual_selection = '#dbe9f9',
    border = '#044289',

    --   -- Cursor & LineNumber Colors
    cursor = '#0969da',
    cursor_line_nr = '#24292e',
    line_nr = '#959da5',

    -- LSP & Diagnostic Colors
    error = '#cb2431',
    warning = '#bf8803',
    info = '#75beff',
    hint = '#6c6c6c',
    lsp = { ref_txt = '#ccf3d5' },

    -- Auto-Complication Colors
    pmenu = {
        bg = '#f6f8fa',
        sbar = '#e7e9eb',
    },

    -- Git & Diff Colors
    git = {
        add = '#22863a',
        change = '#b08800',
        delete = '#cb2431',
        conflict = '#b08800',
        -- ignore = '#959da5',
        -- renamed = '#007100',
    },
    diff = {
        add = '#d4f8db',
        add_fg = '#22863a',
        change = '#fff5b1',
        change_fg = '#b08800',
        delete = '#fae5e7',
        delete_fg = '#cb2431',
    },

    -- Syntax Colors
    syntax = {
        comment = '#6a737d',
        constant = '#005cc5',
        string = '#032f62',
        variable = '#953800',
        keyword = '#AC5E00',
        func = '#6f42c1',
        func_param = '#24292e',
        match_paren_bg = '#ccf3d5',
        tag = '#24292F',
        html_arg = '#b31d28',
        param = '#e36209',
        json_label = '#005cc5',
    },

    --    -- Terminal Colors
    orange = '#d18616',
    black = '#24292e',
    bright_black = '#586069',
    white = '#6a737d',
    bright_white = '#959da5',
    red = '#d73a49',
    bright_red = '#cb2431',
    green = '#22863a',
    bright_green = '#28a745',
    yellow = '#b08800',
    bright_yellow = '#dbab09',
    blue = '#0366d6',
    bright_blue = '#2188ff',
    magenta = '#6f42c1',
    bright_magenta = '#8a63d2',
    cyan = '#1b7c83',
    bright_cyan = '#3192aa',

    -- Plugin Colors
    git_signs = {
        add = '#22863a',
        change = '#f9c513',
        delete = '#d73a49',
    },
} --}}}

local colors = { --{{{
    bg = '#ffffff',
    -- bg2 = '#f6f8fa',
    bg2 = '#f4f7fa',
    fg = '#24292e',
    red = '#d73a49',
    blue = '#0366d6',
    green = '#22863a',
    orange = '#d18616',
    yellow = '#f9c513',
    cyan = '#1b7c83',
    bright_magenta = '#8a63d2',
    error = '#cb2431',
    warning = '#bf8803',
    info = '#2188ff',
    hint = '#1b7c83',
    gitadd = '#22863a',
    gitchange = '#e36209',
    gitdelete = '#d73a49',
} --}}}

local mode_color = { --{{{
    ['!'] = colors.red,
    [''] = colors.orange,
    [''] = colors.yellow,
    ['r?'] = colors.red,
    c = colors.bright_magenta,
    ce = colors.bright_magenta,
    cv = colors.bright_magenta,
    i = colors.green,
    ic = colors.green,
    n = colors.blue,
    no = colors.blue,
    r = colors.bright_magenta,
    R = colors.bright_magenta,
    rm = colors.bright_magenta,
    Rv = colors.bright_magenta,
    s = colors.yellow,
    S = colors.yellow,
    t = colors.orange,
    v = colors.orange,
    V = colors.orange,
} --}}}

local mode_str = { --{{{
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
} --}}}

local mode_color_alpha = get_mode_color_alpha(mode_color, lighten, 0.2)
-- local mode_color_bg_alpha = get_mode_color_alpha(mode_color, lighten, 0.01, colors.bg2)
local mode_color_fg_alpha = get_mode_color_alpha(mode_color, darken, 0.4, colors.fg)

-- set Background Highlights
vim.api.nvim_set_hl(0, 'StatusLine', { fg = colors.bg2, bg = colors.bg2 })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = darken(colors.fg, 0.5), bg = colors.bg2 })

gls.left[1] = {
    ViMode = {
        provider = function()
            set_hl('ViMode', colors.bg, mode_color[vim.fn.mode()])
            return '  ' .. mode_str[vim.fn.mode()] .. ' '
        end,
    },
}

gls.left[2] = {
    Separator0 = {
        provider = function()
            local color_bg = (condition.check_git_workspace() or has_diagnostic())
                    and mode_color_alpha[vim.fn.mode()]
                or colors.bg2
            set_hl('Separator0', mode_color[vim.fn.mode()], color_bg)
            return ' '
        end,
    },
}

gls.left[3] = {
    GitIcon = {
        condition = condition.check_git_workspace,
        provider = function()
            set_hl('GitIcon', mode_color_fg_alpha[vim.fn.mode()], mode_color_alpha[vim.fn.mode()])
            return '  '
        end,
    },
}

gls.left[4] = {
    GitBranch = {
        condition = condition.check_git_workspace,
        provider = function()
            set_hl('GitBranch', mode_color_fg_alpha[vim.fn.mode()], mode_color_alpha[vim.fn.mode()])
            return vcs.get_git_branch() .. ' '
        end,
    },
}

gls.left[5] = {
    Separator1 = {
        condition = condition.hide_in_width,
        provider = function()
            set_hl(
                'Separator1',
                mode_color_fg_alpha[vim.fn.mode()],
                mode_color_alpha[vim.fn.mode()]
            )
            return has_gitinfo() and ' ' or ''
        end,
    },
}

gls.left[6] = {
    DiffAdd = {
        condition = condition.hide_in_width,
        icon = ' +',
        provider = function()
            set_hl('DiffAdd', colors.gitadd, mode_color_alpha[vim.fn.mode()])
            return vcs.diff_add()
        end,
    },
}

gls.left[7] = {
    DiffModified = {
        condition = condition.hide_in_width,
        icon = ' ~',
        provider = function()
            set_hl('DiffModified', colors.gitchange, mode_color_alpha[vim.fn.mode()])
            return vcs.diff_modified()
        end,
    },
}

gls.left[8] = {
    DiffRemove = {
        condition = condition.hide_in_width,
        icon = ' -',
        provider = function()
            set_hl('DiffRemove', colors.gitdelete, mode_color_alpha[vim.fn.mode()])
            return vcs.diff_remove()
        end,
    },
}

gls.left[9] = {
    Separator2 = {
        provider = function()
            set_hl(
                'Separator2',
                mode_color_fg_alpha[vim.fn.mode()],
                mode_color_alpha[vim.fn.mode()]
            )
            return (has_diagnostic() and condition.check_git_workspace()) and ' ' or ''
        end,
    },
}

gls.left[10] = {
    DiagnosticError = {
        icon = '  ',
        provider = function()
            set_hl('DiagnosticError', colors.error, mode_color_alpha[vim.fn.mode()])
            return diagnostic.get_diagnostic_error()
        end,
    },
}

gls.left[11] = {
    DiagnosticWarn = {
        icon = '  ',
        provider = function()
            set_hl('DiagnosticWarn', colors.warning, mode_color_alpha[vim.fn.mode()])
            return diagnostic.get_diagnostic_warn()
        end,
    },
}

gls.left[12] = {
    DiagnosticInfo = {
        icon = '  ',
        provider = function()
            set_hl('DiagnosticInfo', colors.info, mode_color_alpha[vim.fn.mode()])
            return diagnostic.get_diagnostic_info()
        end,
    },
}
gls.left[13] = {
    DiagnosticHint = {
        icon = '  ',
        provider = function()
            set_hl('DiagnosticHint', colors.hint, mode_color_alpha[vim.fn.mode()])
            return diagnostic.get_diagnostic_hint()
        end,
    },
}

gls.left[14] = {
    Separator3 = {
        provider = function()
            set_hl('Separator3', mode_color_alpha[vim.fn.mode()], colors.bg2)
            return (condition.check_git_workspace() or has_diagnostic()) and ' ' or ''
        end,
    },
}

gls.left[15] = {
    FileName_Custom = {
        condition = condition.buffer_not_empty,
        provider = function()
            local file = vim.fn.expand('%:t')
            set_hl('FileName_Custom', mode_color_fg_alpha[vim.fn.mode()], colors.bg2)
            return file_with_icons(file, '[+]', '[-]')
        end,
    },
}

gls.right[1] = {
    FileEncode = {
        condition = condition.hide_in_width,
        provider = function()
            set_hl('FileEncode', mode_color_fg_alpha[vim.fn.mode()], colors.bg2)
            local encode = vim.bo.fenc ~= '' and vim.bo.fenc or vim.o.enc
            return encode .. ' '
        end,
    },
}
gls.right[2] = {
    Separator4 = {
        condition = condition.hide_in_width,
        provider = function()
            set_hl('Separator4', mode_color_fg_alpha[vim.fn.mode()], colors.bg2)
            return ' '
        end,
    },
}

gls.right[3] = {
    FileFormat = {
        condition = condition.hide_in_width,
        provider = function()
            set_hl('FileFormat', mode_color_fg_alpha[vim.fn.mode()], colors.bg2)
            local ff = vim.bo.fileformat
            if ff == 'unix' then
                return ' '
            elseif ff == 'dos' then
                return ' '
            elseif ff == 'mac' then
                return ' '
            end
        end,
    },
}

gls.right[4] = {
    Separator5 = {
        condition = condition.hide_in_width,
        provider = function()
            set_hl('Separator5', mode_color_fg_alpha[vim.fn.mode()], colors.bg2)
            return ' '
        end,
    },
}

gls.right[5] = {
    FileIcon = {
        condition = condition.buffer_not_empty,
        highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg2 },
        provider = function()
            local icon = fileinfo.get_file_icon()
            return icon ~= '' and icon or ''
        end,
    },
}
gls.right[6] = {
    FileType = {
        condition = condition.buffer_not_empty,
        provider = function()
            set_hl('FileType', mode_color_fg_alpha[vim.fn.mode()], colors.bg2)
            return vim.bo.filetype:gsub('^%l', string.upper) .. ' '
        end,
    },
}
gls.right[7] = {
    Separator6 = {
        provider = function()
            set_hl('Separator6', mode_color_alpha[vim.fn.mode()], colors.bg2)
            return ''
        end,
    },
}
gls.right[8] = {
    PerCent = {
        provider = function()
            set_hl('PerCent', mode_color_fg_alpha[vim.fn.mode()], mode_color_alpha[vim.fn.mode()])
            return ' ' .. fileinfo.current_line_percent()
        end,
    },
}

gls.right[9] = {
    Separator7 = {
        provider = function()
            set_hl('Separator7', mode_color[vim.fn.mode()], mode_color_alpha[vim.fn.mode()])
            return ''
        end,
    },
}
gls.right[10] = {
    LineInfo = {
        provider = function()
            set_hl('LineInfo', colors.bg, mode_color[vim.fn.mode()])
            local line = vim.fn.line('.')
            local column = vim.fn.col('.')
            return string.format('  %3d:%-2d ', line, column)
        end,
    },
}

gls.mid[1] = {
    ShowLspClient = {
        condition = function()
            local tbl = { ['dashboard'] = true, [''] = true }
            if tbl[vim.bo.filetype] or (not condition.hide_in_width()) then
                return false
            end
            return true
        end,
        icon = ' LSP:',
        provider = function()
            set_hl('ShowLspClient', mode_color_fg_alpha[vim.fn.mode()], colors.bg2)
            return lspclient.get_lsp_client()
        end,
    },
}
gls.short_line_left[1] = {
    BufferType = {
        provider = function()
            set_hl('BufferType', colors.bg, mode_color[vim.fn.mode()])
            return '  ' .. vim.bo.filetype:gsub('^%l', string.upper) .. ' '
        end,
    },
}

gls.short_line_left[2] = {
    Separator8 = {
        provider = function()
            set_hl('Separator8', mode_color[vim.fn.mode()], mode_color_alpha[vim.fn.mode()])
            return ' '
        end,
    },
}

gls.short_line_right[1] = {
    Separator9 = {
        provider = function()
            set_hl('Separator9', mode_color[vim.fn.mode()], mode_color_alpha[vim.fn.mode()])
            return ''
        end,
    },
}
gls.short_line_right[2] = {
    ShortPerCent = {
        provider = function()
            set_hl('ShortPerCent', colors.bg, mode_color[vim.fn.mode()])
            return ' ' .. fileinfo.current_line_percent()
        end,
    },
}
