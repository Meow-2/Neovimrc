-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
-- recommend some vim mode key defines in this file

local keymap = require('core.keymap')
local nmap, imap, cmap, vmap, omap, xmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.vmap, keymap.omap, keymap.xmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd= keymap.cmd
local nore = opts(noremap)
local nore_silent = opts(noremap,silent)

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
    { 'H'                  , 'b'         , nore } ,
    { 'J'                  , '5j'        , nore } ,
    { 'K'                  , '5k'        , nore } ,
    { 'L'                  , 'e'         , nore } ,
    -- { '<Leader>i'          , 'Bi'        , nore } ,
    -- { '<Leader>o'          , 'Ea'        , nore } ,
    -- visual select
    { '<C-j>'              , '<C-v>j'    , nore } ,
    { '<C-k>'              , '<C-v>k'    , nore } ,
    { [[\v]] , 'v$h' , nore},
    -- save and quit
    { 's'                  , cmd('w!')     , nore } ,
    { '<C-q>'              , cmd('qa!')    , nore } ,
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
    { '<C-S-h>', '<C-w>h', nore },
    { '<C-S-j>', '<C-w>j', nore },
    { '<C-S-k>', '<C-w>k', nore },
    { '<C-S-l>', '<C-w>l', nore },

    { '<Left>', '<C-w>h', nore },
    { '<Down>', '<C-w>j', nore },
    { '<Up>', '<C-w>k', nore },
    { '<Right>', '<C-w>l', nore },
    -- adjust the size of split windows
    { '<C-Left>' , cmd('vertical resize+2'), nore_silent} ,
    { '<C-Down>' , cmd('resize-2'), nore_silent} ,
    { '<C-Up>' , cmd('resize+2'), nore_silent} ,
    { '<C-Right>' , cmd('vertical resize-2'), nore_silent} ,
    { '<Leader>=', '<C-w>=', nore},
    -- search behavior
    { 'n' , 'nzz' , nore},
    { 'N' , 'Nzz' , nore},
    { '<Esc>', '<Esc>'..cmd('nohlsearch'), nore},
    -- yank to system clipboard
    { 'y' , [["+y]] , nore},
    { 'yy' , [["+yy]] , nore},
    { 'Y' , [["+y$]] , nore},
    { 'yp' , [[T/"+yt']] , nore},
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
    { '<C-h>'              , '<Bs>'      , nore } ,
    { '<C-j>'              , '<Down>'    , nore } ,
    { '<C-k>'              , '<Up>'      , nore } ,
    { '<C-l>'              , '<Right>'   , nore } ,

    { '<C-e>'              , '<End>'     , nore } ,
    { '<C-a>'              , '<Esc>^i'   , nore } ,
    { '<C-d>'              , '<Del>'     , nore } ,
    { '<C-b>'              , '<Left>'    , nore } ,
    -- word jump
    { '<C-S-h>'            , '<C-Left>'  , nore } ,
    { '<C-S-l>'            , '<C-Right>' , nore } ,
    -- <Esc> behavior
    { '<Esc>', '<Esc>l'..cmd('nohlsearch'), nore},
    -- <S-Tab> behavior
    -- { '<S-Tab>', '<C-d>', noremap},
    -- for nvui
    { '<C-v>', '<C-r><C-p>+', nore},

})

cmap({
    -- commandline remap
    -- emacs keymap
    { '<C-h>', '<Bs>', nore },
    { '<C-j>', '<Down>', nore },
    { '<C-k>', '<Up>', nore },
    { '<C-l>', '<Right>', nore },

    { '<C-e>', '<End>', nore },
    { '<C-a>', '<Home>', nore },
    { '<C-d>', '<Del>', nore },
    { '<C-b>', '<Left>', nore },

    -- word jump
    { '<C-S-h>', '<C-Left>', nore},
    { '<C-S-l>', '<C-Right>', nore},
    -- for nvui
    { '<C-v>', '<C-r>+', nore},
})

vmap({
    -- visual remap
    -- cursor move
    { 'H'                  , 'b'         , nore } ,
    { 'J'                  , '5j'        , nore } ,
    { 'K'                  , '5k'        , nore } ,
    { 'L'                  , 'e'         , nore } ,
    { '<c-j>', 'j', nore },
    { '<c-k>', 'k', nore },
    -- <Esc> behavior
    { '<Esc>', '<Esc>'..cmd('nohlsearch'), nore},
    -- yank to system clipboard
    { 'y' , '"+y`]' , nore},
    -- fold code
    { 'zi', 'zf%', nore_silent},
    { 'zo', 'za', nore_silent},
    -- indent code
    { '<Left>', '<gv' , nore},
    { '<Right>', '>gv' , nore},
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
