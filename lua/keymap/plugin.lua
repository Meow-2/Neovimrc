local key = require('core.keymap')
local nmap,vmap,imap,tmap = key.nmap,key.vmap,key.imap,key.tmap
local opts = key.new_opts
local cmd = key.cmd
local nore = opts(key.noremap,key.silent)
local nore_silent = opts(key.noremap,key.silent)
local nore_silent_expr = opts(key.noremap,key.silent,key.expr)
local source_file = vim.fn.stdpath('config') .. '/init.lua'

-- usage of plugins
nmap({
    -- packer
    -- { '<Leader>p'             , '<Nop>'                                     , nore_silent}  ,
    { '<C-s>'                 , cmd('luafile '..source_file)                , nore_silent}  ,
    { '<Leader>u'            , cmd('PackerUpdate')                         , nore_silent } ,
    { '<Leader>i'            , cmd('PackerInstall')                        , nore_silent } ,
    { '<Leader>c'            , cmd('PackerCompile')                        , nore_silent } ,
    -- dashboard
    { '<Leader>n'             , cmd('DashboardNewFile')                     , nore_silent } ,
    -- neovim-session-manager
    { '<Leader>s'             , '<Nop>'                                     , nore_silent}  ,
    { '<Leader>ss'            , cmd('SessionManager! save_current_session') , nore_silent } ,
    { '<Leader>sl'            , cmd('SessionManager! load_session')         , nore_silent } ,
    { '<Leader>sd'            , cmd('SessionManager! delete_session')       , nore_silent } ,
    -- nvimtree
    { 'tt'                    , cmd('NvimTreeToggle')                       , nore_silent } ,
    -- Telescope
    { '<Leader>b'            , cmd('Telescope buffers')                    , nore_silent } ,
    { '<Leader>w'            , cmd('Telescope live_grep')                  , nore_silent } ,
    { '<Leader>f'            , cmd('Telescope find_files')                 , nore_silent } ,
    { '<Leader>h'            , cmd('Telescope oldfiles')                  , nore_silent } ,
    { '<Leader>p'            , cmd('Telescope help_tags')                  , nore_silent } ,
    -- bufferline.nvim
    { 'e'                     , cmd('BufferLineCyclePrev')                  , nore_silent}  ,
    { 'r'                     , cmd('BufferLineCycleNext')                  , nore_silent}  ,
    { 'gb'                    , cmd('BufferLinePick')                       , nore_silent}  ,
    { 'gv'                    , cmd('BufferLinePickVsplit')                 , nore_silent}  ,
    { 'tc'                    , cmd('BufferLinePickClose')                  , nore_silent}  ,
    { 'tl'                    , cmd('BufferLineMoveNext')                   , nore_silent}  ,
    { 'th'                    , cmd('BufferLineMovePrev')                   , nore_silent}  ,
    { '<Leader>m', cmd('Mason'),nore_silent},
    -- nvim-comment
    { '<C-_>'                 , cmd('CommentToggle')                        , nore_silent}  ,
    { '<C-/>'                 , cmd('CommentToggle')                        , nore_silent}  ,
    -- vim-floaterm
    { '<C-g>', cmd('FloatermNew --cwd=<root> --name=lazygit lazygit'),nore_silent},
    { '<C-t>', cmd('FloatermToggle'), nore_silent},
    { 'R', cmd('FloatermNew ranger'),nore_silent},
    -- nnoremap <silent> <S-F3> :set norelativenumber<cr>:FloatermNew! --cmd=<buffer> --width=0.5 --position=belowright --wintype=vsplit --name=lldb lldb %:h/build/%:t:r<cr>
    -- tnoremap <silent> <S-F3> <C-d><C-\><C-N>:FloatermKill lldb<cr>:set relativenumber<cr>
    -- " tnoremap <silent> <S-F3> i<c-u><C-d>exit<cr>
    --
    -- nnoremap <silent> <c-t> :FloatermToggle<cr>
    -- tnoremap <silent> <c-t> <C-\><C-N>:FloatermToggle<cr>
    -- lspsaga.nvim
    { '=', cmd('Lspsaga diagnostic_jump_next'), nore_silent },
    { '-', cmd('Lspsaga diagnostic_jump_prev'), nore_silent },
    { 'gt', cmd('Lspsaga lsp_finder'), nore_silent },
    { 'gD', cmd('Lspsaga preview_definition'), nore_silent },
    { '<Leader>rn', cmd('Lspsaga rename'), nore_silent },
    { '<Leader>o', cmd('LSoutlineToggle'), nore_silent },
    { '<C-k>', cmd('Lspsaga hover_doc'), nore_silent },
    { '<C-p>', cmd('Lspsaga signature_help'),nore_silent },
    -- { '<Leader>.', cmd('Lspsaga code_action'), nore_silent },
    -- Lspsaga floaterminal
    -- { '<C-t>',a cmd ('Lspsaga open_floaterm'), nore_silent },
    -- { '<C-g>', cmd('Lspsaga open_floaterm lazygit'), nore_silent },

    -- LuaSnip
    -- " press <Tab> to expand or jump in a snippet. These can also be mapped separately
    -- " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
    -- imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
    -- " -1 for jumping backwards.
    -- inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
    --
    -- snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
    -- snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
    --
})

imap({'<C-p>', cmd('Lspsaga signature_help'),nore_silent })


vmap({
    -- nvim-comment
    {'<C-_>'      , [[:CommentToggle<Cr>]] , nore_silent} ,
    {'<C-/>'      , [[:CommentToggle<Cr>]], nore_silent} ,
    { 'gt' , [[:Tabularize /]]      , nore} ,
    { '<Leader>.', cmd('Lspsaga range_code_action'), nore_silent },
})

tmap({
    -- tnoremap <silent> <c-t> <C-\><C-N>:FloatermToggle<cr>
    {'<C-t>', [[<C-\><C-n>:FloatermToggle<Cr>]], nore_silent },
    -- vim-floaterm
    {'<C-g>', function ()
        return vim.bo.filetype == 'floaterm' and [[q<C-\><C-n>:FloatermKill lazygit<cr>]] or '<C-g>'
    end,nore_silent_expr},
})

