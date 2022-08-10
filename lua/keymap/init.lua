-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
-- recommend plugins key defines in this file

require('keymap.config')
local key = require('core.keymap')
local nmap = key.nmap
local silent, noremap = key.silent, key.noremap
local opts = key.new_opts
local cmd,cmds = key.cmd, key.cmds

-- usage of plugins
nmap({
  -- packer
  { '<Leader>p', '<Nop>', opts(noremap,silent)},
  { '<Leader>pu', cmd('PackerUpdate'), opts(noremap, silent) },
  { '<Leader>pi', cmd('PackerInstall'), opts(noremap, silent) },
  { '<Leader>pc', cmd('PackerCompile'), opts(noremap, silent) },
  -- dashboard
  { '<Leader>n', cmd('DashboardNewFile'), opts(noremap, silent) },
  { '<Leader>s', '<Nop>', opts(noremap,silent)},
  { '<Leader>ss', cmd('SessionSave'), opts(noremap, silent) },
  { '<Leader>sl', cmd('SessionLoad'), opts(noremap, silent) },
  -- nvimtree
  { 'tt', cmd('NvimTreeToggle'), opts(noremap, silent) },
  -- Telescope
  { '<Leader>b', cmd('Telescope buffers'), opts(noremap, silent) },
  { '<Leader>fa', cmd('Telescope live_grep'), opts(noremap, silent) },
  { '<Leader>ff', cmd('Telescope find_files'), opts(noremap, silent) },
  -- bufferline.nvim
  { 'e', cmd('BufferLineCyclePrev'), opts(noremap, silent)},
  { 'r', cmd('BufferLineCycleNext'), opts(noremap, silent)},
  { 'gb', cmd('BufferLinePick'), opts(noremap, silent)},
  { 'tv', cmd('BufferLinePickVsplit'), opts(noremap, silent)},
  { 'tc', cmd('BufferLinePickClose'), opts(noremap, silent)},
  { 'tl', cmd('BufferLineMoveNext'), opts(noremap, silent)},
  { 'th', cmd('BufferLineMovePrev'), opts(noremap, silent)},
})
