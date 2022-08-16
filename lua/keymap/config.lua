-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
-- recommend some vim mode key defines in this file

local keymap = require('core.keymap')
local nmap, imap, cmap, vmap,tmap, omap, xmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.vmap,keymap.tmap, keymap.omap, keymap.xmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd= keymap.cmd
local nore = opts(noremap)
local nore_silent = opts(noremap,silent)
local nore_silent_expr = opts(noremap,silent,keymap.expr)

-- Use space as leader key
vim.g.mapleader = ' '
-- leaderkey
-- nmap({ ' ', '', noremap })
-- xmap({ ' ', '', noremap })

local quitbuffer = function()--{{{
    local temp = vim.fn.getbufinfo({buflisted = true})
    if #temp == 1 then
        return vim.cmd('q!')
    end
    temp = vim.fn.win_findbuf(vim.fn.bufnr('%'))
    if #temp > 1 then
        return vim.cmd('q!')
    end
    if vim.bo.filetype == 'dashboard' then
        return vim.cmd('q!')
    end
    return vim.cmd('bd!')
end--}}}

local compile = function()--{{{
    if vim.bo.filetype == 'vim' then
        return vim.cmd('luafile $HOME/.config/nvim/init.lua')
    end
    if vim.bo.filetype == 'markdown' then
        return vim.cmd('MarkdownPreview')
    end
    return vim.cmd('AsyncTask file-build')
end--}}}

nmap({
    -- noremal remap
    -- cursor move
    { 'H'                  , 'b'         , nore_silent } ,
    { 'J'                  , '5j'        , nore_silent } ,
    { 'K'                  , '5k'        , nore_silent } ,
    { 'L'                  , 'e'         , nore_silent } ,
    -- { '<Leader>i'          , 'Bi'        , nore } ,
    -- { '<Leader>o'          , 'Ea'        , nore } ,
    -- visual select
    { '<C-j>'              , '<C-v>j'    , nore_silent } ,
    { '<C-k>'              , '<C-v>k'    , nore_silent } ,
    { [[\v]] , 'v$h' , nore_silent},
    -- save and quit
    { 's'                  , cmd('w!')     , nore } ,
    { '<C-q>'              , cmd('qa!')    , nore_silent } ,
    -- close buffer/tab/dashboard
    { 'q' , quitbuffer , nore_silent},
    -- split windows
    { 'S','<Nop>',nore_silent},
    { 'Sh',cmd('set nosplitright')..cmd('vsplit')..cmd('set splitright'),nore_silent},
    { 'Sj',cmd('set splitbelow')..cmd('split'),nore_silent},
    { 'Sk',cmd('set nosplitbelow')..cmd('split')..cmd('set splitbelow') ,nore_silent},
    { 'Sl',cmd('set splitright')..cmd('vsplit'),nore_silent},

    { '<S-Left>',cmd('set nosplitright')..cmd('vsplit')..cmd('set splitright'),nore_silent},
    { '<S-Down>',cmd('set splitbelow')..cmd('split'),nore_silent},
    { '<S-Up>' ,cmd('set nosplitbelow')..cmd('split')..cmd('set splitbelow') ,nore_silent},
    { '<S-Right>',cmd('set splitright')..cmd('vsplit'),nore_silent},

    -- move around split windows
    { '<C-S-h>', '<C-w>h', nore_silent },
    { '<C-S-j>', '<C-w>j', nore_silent },
    { '<C-S-k>', '<C-w>k', nore_silent },
    { '<C-S-l>', '<C-w>l', nore_silent },

    { '<Left>', '<C-w>h', nore_silent },
    { '<Down>', '<C-w>j', nore_silent },
    { '<Up>', '<C-w>k', nore_silent },
    { '<Right>', '<C-w>l', nore_silent },
    -- adjust the size of split windows
    { '<C-Left>' , cmd('vertical resize+2'), nore_silent} ,
    { '<C-Down>' , cmd('resize-2'), nore_silent} ,
    { '<C-Up>' , cmd('resize+2'), nore_silent} ,
    { '<C-Right>' , cmd('vertical resize-2'), nore_silent} ,
    -- { '<Leader>=', '<C-w>=', nore_silent},
    -- search behavior
    { 'n' , 'nzz' , nore_silent},
    { 'N' , 'Nzz' , nore_silent},
    { '<Esc>', '<Esc>'..cmd('nohlsearch'), nore_silent},
    -- yank to system clipboard
    { 'y' , [["+y]] , nore_silent},
    { 'yy' , [["+yy]] , nore_silent},
    { 'Y' , [["+y$]] , nore_silent},
    -- marco
    { 'Q' ,'q1',nore},
    { '@' ,'@1',nore},
    -- fold code
    { 'zi', 'zf%', nore_silent},
    { 'zo', 'za', nore_silent},
    -- indent line
    -- { '<Tab>', '>>',opts(noremap, silent)},
    -- { '<S-Tab>', '<<',opts(noremap, silent)},
})

imap({
    -- insert mode
    -- emacs keymap
    { '<C-h>'              , '<Bs>'      , nore_silent } ,
    { '<C-j>'              , '<Down>'    , nore_silent } ,
    { '<C-k>'              , '<Up>'      , nore_silent } ,
    { '<C-l>'              , '<Right>'   , nore_silent } ,

    { '<C-e>'              , '<End>'     , nore_silent } ,
    { '<C-a>'              , '<Esc>^i'   , nore_silent } ,
    { '<C-d>'              , '<Del>'     , nore_silent } ,
    { '<C-b>'              , '<Left>'    , nore_silent } ,
    -- word jump
    { '<C-S-h>'            , '<C-Left>'  , nore_silent } ,
    { '<C-S-l>'            , '<C-Right>' , nore_silent } ,
    -- <Esc> behavior
    { '<Esc>', '<Esc>l'..cmd('nohlsearch'), nore_silent},
    -- <S-Tab> behavior
    -- { '<S-Tab>', '<C-d>', noremap},
    -- for nvui
    { '<C-v>', '<C-r><C-p>+', nore_silent},

})

cmap({
    -- commandline remap
    -- emacs keymap
    { '<C-h>', '<Bs>', nore_silent },
    { '<C-j>', '<Down>', nore_silent },
    { '<C-k>', '<Up>', nore_silent },
    { '<C-l>', '<Right>', nore_silent },

    { '<C-e>', '<End>', nore_silent },
    { '<C-a>', '<Home>', nore_silent },
    { '<C-d>', '<Del>', nore_silent },
    { '<C-b>', '<Left>', nore_silent },

    -- word jump
    { '<C-S-h>', '<C-Left>', nore_silent},
    { '<C-S-l>', '<C-Right>', nore_silent},
    -- for nvui
    { '<C-v>', '<C-r>+', nore_silent},
})

vmap({
    -- visual remap
    -- cursor move
    { 'H'                  , 'b'         , nore_silent } ,
    { 'J'                  , '5j'        , nore_silent } ,
    { 'K'                  , '5k'        , nore_silent } ,
    { 'L'                  , 'e'         , nore_silent } ,
    { '<c-j>', 'j', nore_silent },
    { '<c-k>', 'k', nore_silent },
    -- <Esc> behavior
    { '<Esc>', '<Esc>'..cmd('nohlsearch'), nore_silent},
    -- yank to system clipboard
    { 'y' , '"+y`]' , nore_silent},
    -- fold code
    { 'zi', 'zf%', nore_silent},
    { 'zo', 'za', nore_silent},
    -- indent code
    { '<Left>', '<gv' , nore_silent},
    { '<Right>', '>gv' , nore_silent},
})

tmap({
    {'<C-S-h>',function()
        if vim.bo.filetype == 'floaterm' then
            return "\x1b[72;6u"
        else
            return [[<C-\><C-n><C-w>h]]
        end
    end, nore_silent_expr},
    {'<C-S-j>',[[<C-\><C-n><C-w>j]], nore_silent},
    {'<C-S-k>',[[<C-\><C-n><C-w>k]], nore_silent},
    {'<C-S-l>',function()
        if vim.bo.filetype == 'floaterm' then
            return "\x1b[76;6u"
        else
            return [[<C-\><C-n><C-w>l]]
        end
    end, nore_silent_expr},
})
omap({
    { 'w', 'iw' },
    { '/', 'i/' },
    { '`', 'i`' },
    { '<', 'i<' },
    { '>', 'i>' },
    { '_', 'i_' },
    { '[', 'i[' },
    { ']', 'i]' },
    { '(', 'i(' },
    { ')', 'i)' },
    { '{', 'i{' },
    { '}', 'i}' },
    { [["]], [[i"]] },
    { [[']], [[i']] },
})

xmap({
    { 'w', 'iw' },
    { '/', 'i/' },
    { '`', 'i`' },
    { '<', 'i<' },
    { '>', 'i>' },
    { '_', 'i_' },
    { '[', 'i[' },
    { ']', 'i]' },
    { '(', 'i(' },
    { ')', 'i)' },
    { '{', 'i{' },
    { '}', 'i}' },
    { [["]], [[i"]] },
    { [[']], [[i']] },
})
