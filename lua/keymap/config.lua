-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
-- recommend some vim mode key defines in this file

local keymap = require('core.keymap')
local nmap, imap, cmap, vmap, tmap, omap, xmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.vmap, keymap.tmap, keymap.omap, keymap.xmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd,cmds = keymap.cmd, keymap.cmds

-- Use space as leader key
vim.g.mapleader = ' '
-- leaderkey
-- nmap({ ' ', '', opts(noremap) })
-- xmap({ ' ', '', opts(noremap) })

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
    { 'H'                  , 'b'         , opts(noremap) } ,
    { 'J'                  , '5j'        , opts(noremap) } ,
    { 'K'                  , '5k'        , opts(noremap) } ,
    { 'L'                  , 'e'         , opts(noremap) } ,
    { '<Leader>i'          , 'Bi'        , opts(noremap) } ,
    { '<Leader>o'          , 'Ea'        , opts(noremap) } ,
    -- visual select
    { '<C-j>'              , '<C-v>j'    , opts(noremap) } ,
    { '<C-k>'              , '<C-v>k'    , opts(noremap) } ,
    { '\v' , 'v$h' , opts(noremap)},
    -- save and quit
    { 's'                  , cmd('w!')     , opts(noremap) } ,
    { '<C-q>'              , cmd('qa!')    , opts(noremap) } ,
    -- close buffer/tab/dashboard
    { 'q' , quitbuffer , opts(noremap,silent)},
    -- split windows
    { 'S','<Nop>',opts(noremap,silent)},
    { 'Sh',cmds('set nosplitright','vsplit','set splitright'),opts(noremap,silent)},
    { 'Sj',cmds('set splitbelow','split'),opts(noremap,silent)},
    { 'Sk',cmds('set nosplitbelow','split','set splitbelow'),opts(noremap,silent)},
    { 'Sl',cmds('set splitright','vsplit'),opts(noremap,silent)},

    { '<S-Left>',cmds('set nosplitright','vsplit','set splitright'),opts(noremap,silent)},
    { '<S-Down>',cmds('set splitbelow','split'),opts(noremap,silent)},
    { '<S-Up>' ,cmds('set nosplitbelow','split','set splitbelow'),opts(noremap,silent)},
    { '<S-Right>',cmds('set splitright','vsplit'),opts(noremap,silent)},

    -- move around split windows
    { '<C-S-h>', '<C-w>h', opts(noremap) },
    { '<C-S-j>', '<C-w>j', opts(noremap) },
    { '<C-S-k>', '<C-w>k', opts(noremap) },
    { '<C-S-l>', '<C-w>l', opts(noremap) },

    { '<Left>', '<C-w>h', opts(noremap) },
    { '<Down>', '<C-w>j', opts(noremap) },
    { '<Up>', '<C-w>k', opts(noremap) },
    { '<Right>', '<C-w>l', opts(noremap) },
    -- adjust the size of split windows
    { '<C-Left>' , cmd('vertical resize+2'), opts(noremap, silent)} ,
    { '<C-Down>' , cmd('resize-2'), opts(noremap, silent)} ,
    { '<C-Up>' , cmd('resize+2'), opts(noremap, silent)} ,
    { '<C-Right>' , cmd('vertical resize-2'), opts(noremap, silent)} ,
    { '<Leader>=', '<C-w>=', opts(noremap)},
    -- search behavior
    { 'n' , 'nzz' , opts(noremap)},
    { 'N' , 'Nzz' , opts(noremap)},
    { '<Esc>', '<Esc>'..cmd('nohlsearch'), opts(noremap)},
    -- yank to system clipboard
    { 'y' , [["+y]] , opts(noremap)},
    { 'yy' , [["+yy]] , opts(noremap)},
    { 'Y' , [["+y$]] , opts(noremap)},
    -- marco
    { 'Q' ,'q1',opts(noremap)},
    { '@' ,'@1',opts(noremap)},
    -- fold code
    { 'zi', 'zf%', opts(noremap,silent)},
    { 'zo', 'za', opts(noremap,silent)},
})

imap({
    -- insert mode
    -- emacs keymap
    { '<C-h>'              , '<Bs>'      , opts(noremap) } ,
    { '<C-j>'              , '<Down>'    , opts(noremap) } ,
    { '<C-k>'              , '<Up>'      , opts(noremap) } ,
    { '<C-l>'              , '<Right>'   , opts(noremap) } ,

    { '<C-e>'              , '<End>'     , opts(noremap) } ,
    { '<C-a>'              , '<Esc>^i'   , opts(noremap) } ,
    { '<C-d>'              , '<Del>'     , opts(noremap) } ,
    { '<C-b>'              , '<Left>'    , opts(noremap) } ,
    -- word jump
    { '<C-S-h>'            , '<C-Left>'  , opts(noremap) } ,
    { '<C-S-l>'            , '<C-Right>' , opts(noremap) } ,
    -- <Esc> behavior
    { '<Esc>', '<Esc>l'..cmd('nohlsearch'), opts(noremap)},
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
    { '<C-S-h>', '<C-Left>', opts(noremap)},
    { '<C-S-l>', '<C-Right>', opts(noremap)},
})

vmap({
    -- visual remap
    -- cursor move
    { 'H'                  , 'b'         , opts(noremap) } ,
    { 'J'                  , '5j'        , opts(noremap) } ,
    { 'K'                  , '5k'        , opts(noremap) } ,
    { 'L'                  , 'e'         , opts(noremap) } ,
    { '<c-j>', 'j', opts(noremap) },
    { '<c-k>', 'k', opts(noremap) },
    -- <Esc> behavior
    { '<Esc>', '<Esc>'..cmd('nohlsearch'), opts(noremap)},
    -- yank to system clipboard
    { 'y' , '"+y`]' , opts(noremap)},
    -- fold code
    { 'zi', 'zf%', opts(noremap,silent)},
    { 'zo', 'za', opts(noremap,silent)},
    -- indent code
    { '<Tab>', '>gv' , opts(noremap)},
    { '<S-Tab>', '<gv' , opts(noremap)},
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
    { '+', 'i+' },
    { '-', 'i-' },
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
    { '+', 'i+' },
    { '-', 'i-' },
    { [["]], [[i"]] },
    { [[']], [[i']] },
})
