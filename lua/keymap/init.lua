-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
-- recommend plugins key defines in this file

require('keymap.config')
local key = require('core.keymap')
local nmap,vmap = key.nmap,key.vmap
local silent, noremap = key.silent, key.noremap
local opts = key.new_opts
local cmd,cmds = key.cmd, key.cmds
local source_file = vim.fn.stdpath('config') .. '/init.lua'

-- usage of plugins
nmap({
  -- packer
  { '<Leader>p'             , '<Nop>'                                     , opts(noremap , silent)}  ,
  { '<Leader>ps'            , cmd('luafile '..source_file)                , opts(noremap , silent)}  ,
  { '<Leader>pu'            , cmd('PackerUpdate')                         , opts(noremap , silent) } ,
  { '<Leader>pi'            , cmd('PackerInstall')                        , opts(noremap , silent) } ,
  { '<Leader>pc'            , cmd('PackerCompile')                        , opts(noremap , silent) } ,
  -- dashboard
  { '<Leader>n'             , cmd('DashboardNewFile')                     , opts(noremap , silent) } ,
  -- neovim-session-manager
  { '<Leader>s'             , '<Nop>'                                     , opts(noremap , silent)}  ,
  { '<Leader>ss'            , cmd('SessionManager! save_current_session') , opts(noremap , silent) } ,
  { '<Leader>sl'            , cmd('SessionManager! load_session')         , opts(noremap , silent) } ,
  { '<Leader>sd'            , cmd('SessionManager! delete_session')       , opts(noremap , silent) } ,
  -- nvimtree
  { 'tt'                    , cmd('NvimTreeToggle')                       , opts(noremap , silent) } ,
  -- Telescope
  { '<Leader>b'            , cmd('Telescope buffers')                    , opts(noremap , silent) } ,
  { '<Leader>w'            , cmd('Telescope live_grep')                  , opts(noremap , silent) } ,
  { '<Leader>f'            , cmd('Telescope find_files')                 , opts(noremap , silent) } ,
  { '<Leader>o'            , cmd('Telescope oldfiles')                  , opts(noremap , silent) } ,
  { '<Leader>h'            , cmd('Telescope help_tags')                  , opts(noremap , silent) } ,
  -- { '<Leader>w'            , cmd('Telescope find_files')                 , opts(noremap , silent) } ,
  -- bufferline.nvim
  { 'e'                     , cmd('BufferLineCyclePrev')                  , opts(noremap , silent)}  ,
  { 'r'                     , cmd('BufferLineCycleNext')                  , opts(noremap , silent)}  ,
  { 'gb'                    , cmd('BufferLinePick')                       , opts(noremap , silent)}  ,
  { 'gv'                    , cmd('BufferLinePickVsplit')                 , opts(noremap , silent)}  ,
  { 'tc'                    , cmd('BufferLinePickClose')                  , opts(noremap , silent)}  ,
  { 'tl'                    , cmd('BufferLineMoveNext')                   , opts(noremap , silent)}  ,
  { 'th'                    , cmd('BufferLineMovePrev')                   , opts(noremap , silent)}  ,
  -- nvim-comment
  { '<C-_>'                 , cmd('CommentToggle')                        , opts(noremap , silent)}  ,
})

-- nvim-comment
vmap({
    {'<C-_>'      , [[:CommentToggle<Cr>]] , opts(noremap   , silent)} ,
    { '<Leader>t' , [[:Tabularize /]]      , opts(noremap)} ,
})

