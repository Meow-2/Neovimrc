local keymap = require('core.keymap')
local nmap, imap, cmap, vmap, tmap, omap, xmap =
    keymap.nmap, keymap.imap, keymap.cmap, keymap.vmap, keymap.tmap, keymap.omap, keymap.xmap
local opts = keymap.new_opts
local cmd = keymap.cmd
local noremap, silent, expr = keymap.noremap, keymap.silent, keymap.expr
-- local nore = opts(noremap)
-- local opts(noremap, silent) = opts(noremap, silent)
-- local opts(noremap, silent, expr) = opts(noremap, silent, expr)

-- Use space as leader key
vim.g.mapleader = ' '
-- leaderkey
-- nmap({ ' ', '', noremap })
-- xmap({ ' ', '', noremap })

local quitbuffer = function() --{{{
    local same_buffer_count = vim.fn.win_findbuf(vim.fn.bufnr('%'))
    if #same_buffer_count > 1 then
        vim.cmd('q!')
        if vim.bo.filetype == 'NvimTree' then
            vim.cmd('q!')
        end
        return
    end
    local buffer_count = vim.fn.getbufinfo({ buflisted = true })
    if #buffer_count == 1 then
        vim.cmd('q!')
        if vim.bo.filetype == 'NvimTree' then
            vim.cmd('q!')
        end
        return
    end
    if vim.bo.filetype == 'dashboard' then
        vim.cmd('q!')
        if vim.bo.filetype == 'NvimTree' then
            vim.cmd('q!')
        end
        return
    end
    vim.cmd('bd!')
    if vim.bo.filetype == 'NvimTree' then
        vim.cmd('bd!')
    end
end --}}}

nmap({
    -- noremal remap
    -- cursor move
    { 'H', 'b', opts(noremap, silent) },
    { 'J', '5j', opts(noremap, silent) },
    { 'K', '5k', opts(noremap, silent) },
    { 'L', 'e', opts(noremap, silent) },
    -- { '<Leader>i'          , 'Bi'        , nore } ,
    -- { '<Leader>o'          , 'Ea'        , nore } ,
    -- visual select
    { '<C-j>', '<C-v>j', opts(noremap, silent) },
    { '<C-k>', '<C-v>k', opts(noremap, silent) },
    { [[\v]], 'v$', opts(noremap, silent) },
    -- save and quit
    { '<C-s>', cmd('w!'), opts(noremap) },
    { '<C-q>', cmd('qa!'), opts(noremap, silent) },
    -- close buffer/tab/dashboard
    { 'q', quitbuffer, opts(noremap, silent) },
    -- split windows
    { 's', '<Nop>', opts(noremap, silent) },
    {
        'sh',
        cmd('set nosplitright') .. cmd('vsplit') .. cmd('set splitright'),
        opts(noremap, silent, 'Split Left'),
    },
    { 'sj', cmd('set splitbelow') .. cmd('split'), opts(noremap, silent, 'Split Up') },
    {
        'sk',
        cmd('set nosplitbelow') .. cmd('split') .. cmd('set splitbelow'),
        opts(noremap, silent, 'Split Down'),
    },
    { 'sl', cmd('set splitright') .. cmd('vsplit'), opts(noremap, silent, 'Split Right') },

    {
        '<S-Left>',
        cmd('set nosplitright') .. cmd('vsplit') .. cmd('set splitright'),
        opts(noremap, silent),
    },
    { '<S-Down>', cmd('set splitbelow') .. cmd('split'), opts(noremap, silent) },
    {
        '<S-Up>',
        cmd('set nosplitbelow') .. cmd('split') .. cmd('set splitbelow'),
        opts(noremap, silent),
    },
    { '<S-Right>', cmd('set splitright') .. cmd('vsplit'), opts(noremap, silent) },

    -- move around split windows
    { '<C-S-h>', '<C-w>h', opts(noremap, silent) },
    { '<C-S-j>', '<C-w>j', opts(noremap, silent) },
    { '<C-S-k>', '<C-w>k', opts(noremap, silent) },
    { '<C-S-l>', '<C-w>l', opts(noremap, silent) },

    { '<Left>', '<C-w>h', opts(noremap, silent) },
    { '<Down>', '<C-w>j', opts(noremap, silent) },
    { '<Up>', '<C-w>k', opts(noremap, silent) },
    { '<Right>', '<C-w>l', opts(noremap, silent) },
    -- adjust the size of split windows
    { '<C-Left>', cmd('vertical resize+2'), opts(noremap, silent) },
    { '<C-Down>', cmd('resize-2'), opts(noremap, silent) },
    { '<C-Up>', cmd('resize+2'), opts(noremap, silent) },
    { '<C-Right>', cmd('vertical resize-2'), opts(noremap, silent) },
    -- { '<Leader>=', '<C-w>=', opts(noremap, silent)},
    -- search behavior
    { 'n', 'nzz', opts(noremap, silent) },
    { 'N', 'Nzz', opts(noremap, silent) },
    { '<Esc>', '<Esc>' .. cmd('nohlsearch'), opts(noremap, silent) },
    -- yank to system clipboard
    { 'y', [["+y]], opts(noremap, silent) },
    { 'yy', [["+yy]], opts(noremap, silent) },
    { 'Y', [["+y$]], opts(noremap, silent) },
    -- marco
    { 'Q', 'q1', opts(noremap) },
    { '@', '@1', opts(noremap) },
    -- fold code
    { 'zi', 'zf%', opts(noremap, silent) },
    { 'zo', 'za', opts(noremap, silent) },
    -- indent line
    -- { '<Tab>', '>>',opts(noremap, silent)},
    -- { '<S-Tab>', '<<',opts(noremap, silent)},
})

imap({
    -- insert mode
    -- emacs keymap
    { '<C-h>', '<Bs>', opts(noremap, silent) },
    { '<C-j>', '<Down>', opts(noremap, silent) },
    { '<C-k>', '<Up>', opts(noremap, silent) },
    { '<C-l>', '<Right>', opts(noremap, silent) },

    { '<C-e>', '<End>', opts(noremap, silent) },
    { '<C-a>', '<Esc>^i', opts(noremap, silent) },
    { '<C-d>', '<Del>', opts(noremap, silent) },
    { '<C-b>', '<Left>', opts(noremap, silent) },
    -- word jump
    { '<C-S-h>', '<C-Left>', opts(noremap, silent) },
    { '<C-S-l>', '<C-Right>', opts(noremap, silent) },
    -- <Esc> behavior
    { '<Esc>', '<Esc>l' .. cmd('nohlsearch'), opts(noremap, silent) },
    -- <S-Tab> behavior
    -- { '<S-Tab>', '<C-d>', noremap},
    -- for nvui
    { '<C-v>', '<C-r><C-p>+', opts(noremap, silent) },
})

cmap({
    -- commandline remap
    -- emacs keymap
    { '<C-h>', '<Bs>', opts(noremap) },
    { '<C-j>', '<Down>', opts(noremap) },
    { '<C-k>', '<Up>', opts(noremap) },
    { '<C-l>', '<Right>', opts(noremap) },

    { '<C-e>', '<End>', opts(noremap) },
    { '<C-a>', '<Home>', opts(noremap) },
    { '<C-d>', '<Del>', opts(noremap) },
    { '<C-b>', '<Left>', opts(noremap) },

    -- word jump
    { '<C-S-h>', '<C-Left>', opts(noremap) },
    { '<C-S-l>', '<C-Right>', opts(noremap) },
    -- for nvui
    { '<C-v>', '<C-r>+', opts(noremap) },
})

vmap({
    -- visual remap
    -- cursor move
    { 'H', 'b', opts(noremap, silent) },
    { 'J', '5j', opts(noremap, silent) },
    { 'K', '5k', opts(noremap, silent) },
    { 'L', 'e', opts(noremap, silent) },
    { '<c-j>', 'j', opts(noremap, silent) },
    { '<c-k>', 'k', opts(noremap, silent) },
    -- <Esc> behavior
    { '<Esc>', '<Esc>' .. cmd('nohlsearch'), opts(noremap, silent) },
    -- yank to system clipboard
    { 'y', '"+y`]', opts(noremap, silent) },
    -- fold code
    { 'zi', 'zf%', opts(noremap, silent) },
    { 'zo', 'za', opts(noremap, silent) },
    -- indent code
    { '<Left>', '<gv', opts(noremap, silent) },
    { '<Right>', '>gv', opts(noremap, silent) },
})

tmap({
    {
        '<C-S-h>',
        function()
            if vim.bo.filetype == 'floaterm' then
                return '\x1b[72;6u'
            else
                return [[<C-\><C-n><C-w>h]]
            end
        end,
        opts(noremap, silent, expr),
    },
    { '<C-S-j>', [[<C-\><C-n><C-w>j]], opts(noremap, silent) },
    { '<C-S-k>', [[<C-\><C-n><C-w>k]], opts(noremap, silent) },
    {
        '<C-S-l>',
        function()
            if vim.bo.filetype == 'floaterm' then
                return '\x1b[76;6u'
            else
                return [[<C-\><C-n><C-w>l]]
            end
        end,
        opts(noremap, silent, expr),
    },
})

-- { '/', 'i/' },
-- { '<', 'i<' },
-- { '>', 'i>' },
-- { '[', 'i[' },
-- { ']', 'i]' },

omap({
    { 'w', 'iw' },
    { '`', 'i`' },
    { '_', 'i_' },
    { '(', 'i(' },
    { ')', 'i)' },
    { '{', 'i{' },
    { '}', 'i}' },
    { [["]], [[i"]] },
    { [[']], [[i']] },
})

xmap({
    { 'w', 'iw' },
    { '`', 'i`' },
    { '_', 'i_' },
    { '(', 'i(' },
    { ')', 'i)' },
    { '{', 'i{' },
    { '}', 'i}' },
    { [["]], [[i"]] },
    { [[']], [[i']] },
})
