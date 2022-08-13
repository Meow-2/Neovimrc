local key = require('core.keymap')
local nmap,vmap = key.nmap,key.imap
local silent, noremap = key.silent, key.noremap
local opts = key.new_opts
local cmd = key.cmd
local source_file = vim.fn.stdpath('config') .. '/init.lua'

local nore_silent = opts(noremap,silent)
-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

-- usage of plugins
nmap({
  -- packer
  { '<Leader>p'             , '<Nop>'                                     , nore_silent}  ,
  { '<Leader>ps'            , cmd('luafile '..source_file)                , nore_silent}  ,
  { '<Leader>pu'            , cmd('PackerUpdate')                         , nore_silent } ,
  { '<Leader>pi'            , cmd('PackerInstall')                        , nore_silent } ,
  { '<Leader>pc'            , cmd('PackerCompile')                        , nore_silent } ,
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
  { '<Leader>o'            , cmd('Telescope oldfiles')                  , nore_silent } ,
  { '<Leader>h'            , cmd('Telescope help_tags')                  , nore_silent } ,
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

vmap({
    -- nvim-comment
    {'<C-_>'      , [[:CommentToggle<Cr>]] , nore_silent} ,
    {'<C-/>'      , [[:CommentToggle<Cr>]] , nore_silent} ,
    { '<Leader>t' , [[:Tabularize /]]      , nore_silent} ,
})

