-- NOTE: opt{{{

local cache_dir = os.getenv('HOME') .. '/.cache/nvim/'
vim.opt.undofile = true
vim.opt.undodir = cache_dir .. 'undo/'
vim.g.mapleader = ' '
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.timeout = false
vim.opt.ttimeoutlen = 0
vim.opt.updatetime = 0
vim.opt.showcmd = true
vim.opt.virtualedit = 'block' --}}}

-- utils{{{
local keymap = require('core.keymap')
local nmap, vmap, omap, xmap = keymap.nmap, keymap.vmap, keymap.omap, keymap.xmap
local opts = keymap.new_opts
local cmd = keymap.cmd
local noremap = keymap.noremap --}}}

nmap({ --{{{
    -- cursor move
    { 'H', 'b', opts(noremap) },
    { 'J', '5j', opts(noremap) },
    { 'K', '5k', opts(noremap) },
    { 'L', 'e', opts(noremap) },
    -- visual block
    { '<C-j>', '<C-v>j', opts(noremap) },
    { '<C-k>', '<C-v>k', opts(noremap) },
    { [[\v]], 'v$h', opts(noremap) },
    -- save and quit
    -- map q <C-w>c
    -- noremap Q q
    { '<C-s>', cmd('w!') },
    { 'q', '<C-w>c' },
    -- marco
    { 'Q', 'q1', opts(noremap) },
    { '@', '@1', opts(noremap) },
    -- split windows
    { 's', '<Nop>' },
    {
        'sh',
        cmd('set nosplitright') .. cmd('vsplit') .. cmd('set splitright'),
    },
    { 'sj', cmd('set splitbelow') .. cmd('split') },
    {
        'sk',
        cmd('set nosplitbelow') .. cmd('split') .. cmd('set splitbelow'),
    },
    { 'sl', cmd('set splitright') .. cmd('vsplit') },
    {
        '<S-Left>',
        cmd('set nosplitright') .. cmd('vsplit') .. cmd('set splitright'),
    },
    { '<S-Down>', cmd('set splitbelow') .. cmd('split') },
    {
        '<S-Up>',
        cmd('set nosplitbelow') .. cmd('split') .. cmd('set splitbelow'),
    },
    { '<S-Right>', cmd('set splitright') .. cmd('vsplit') },

    -- move around split windows
    { '<C-S-h>', '<C-w>h' },
    { '<C-S-j>', '<C-w>j' },
    { '<C-S-k>', '<C-w>k' },
    { '<C-S-l>', '<C-w>l' },
    { '<Leader>j', '<C-w>j' },
    { '<Leader>k', '<C-w>k' },

    { '<Left>', '<C-w>h' },
    { '<Down>', '<C-w>j' },
    { '<Up>', '<C-w>k' },
    { '<Right>', '<C-w>l' },
    -- adjust the size of split windows
    { '<C-Left>', cmd([[call VSCodeNotify('workbench.action.increaseViewSize')]]) },
    { '<C-Right>', cmd([[call VSCodeNotify('workbench.action.decreaseViewSize')]]) },
    { '<C-Up>', cmd([[call VSCodeNotify('workbench.action.increaseViewSize')]]) },
    { '<C-Down>', cmd([[call VSCodeNotify('workbench.action.decreaseViewSize')]]) },
    -- search behavior
    { 'n', 'nzz', opts(noremap) },
    { 'N', 'Nzz', opts(noremap) },
    { '<Esc>', '<Esc>' .. cmd('nohlsearch'), opts(noremap) },
    -- change tab
    { 'e', cmd('tabp') },
    { 'r', cmd('tabn') },
    { 'tc', cmd('tabclose') },
    { 'tt', cmd([[call VSCodeNotify('workbench.view.explorer')]]), opts(noremap) },
    -- lsp
    { 'gd', cmd([[call VSCodeNotify('editor.action.revealDefinition')]]) },
    { 'gi', cmd([[call VSCodeNotify('editor.action.goToImplementation')]]) },
    { 'gr', cmd([[call VSCodeNotify('editor.action.goToReferences')]]) },
    { 'gl', cmd([[call VSCodeNotify('editor.action.revealDefinitionAside')]]) },
    { '<Leader>r', cmd([[call VSCodeNotify('editor.action.rename')]]) },
    { '<Leader>.', cmd([[call VSCodeNotify('editor.action.quickFix')]]) },
    { '-', cmd([[call VSCodeNotify('editor.action.marker.prev')]]) },
    { '=', cmd([[call VSCodeNotify('editor.action.marker.next')]]) },
    --file
    { 'sw', cmd([[call VSCodeNotify('workbench.action.findInFiles')]]) },
    { 'so', cmd([[call VSCodeNotify('workbench.action.quickOpen')]]) },
    -- plugin
    { 'gs', cmd('Antovim') },
    -- nvim-comment
    { '<C-_>', [[:CommentToggle<Cr>]] },
    { '<C-/>', [[:CommentToggle<Cr>]] },
    -- matchup
    { ';', '<Plug>(matchup-%)' },
    { '[;', '<Plug>(matchup-[%)' },
    { '];', '<Plug>(matchup-]%)' },
    { 'g;', '<Plug>(matchup-z%)' },
    { 'z;', '<Plug>(matchup-z%)' },
}) --}}}

vmap({ --{{{
    { 'H', 'b' },
    { 'J', '5j' },
    { 'K', '5k' },
    { 'L', 'e' },
    { '<c-j>', 'j' },
    { '<c-k>', 'k' },
    -- <Esc> behavior
    { '<Esc>', '<Esc>' .. cmd('nohlsearch') },
    -- yank to system clipboard
    { 'y', '"+y`]' },
    -- fold code
    { 'zi', 'zf%' },
    { 'zo', 'za' },
    -- indent code
    { '<Left>', '<gv', opts(noremap) },
    { '<Right>', '>gv', opts(noremap) },
    -- Tabularize
    { '=', [[:Tabularize /]] },
    -- nvim-comment
    { '<C-_>', [[:CommentToggle<Cr>]] },
    { '<C-/>', [[:CommentToggle<Cr>]] },
}) --}}}

omap({ --{{{
    { 'w', 'iw' },
    { '`', 'i`' },
    { '_', 'i_' },
    { '(', 'i(' },
    { ')', 'i)' },
    { '{', 'i{' },
    { '}', 'i}' },
    { [["]], [[i"]] },
    { [[']], [[i']] },
    -- matchup
    { ';', '<Plug>(matchup-i%)' },
    { '[;', '<Plug>(matchup-[%)' },
    { '];', '<Plug>(matchup-]%)' },
    { 'i;', '<Plug>(matchup-i%)' },
    { 'a;', '<Plug>(matchup-a%)' },
    { 'g;', '<Plug>(matchup-z%)' },
    { 'z;', '<Plug>(matchup-z%)' },
}) --}}}

xmap({ --{{{
    { 'w', 'iw' },
    { '`', 'i`' },
    { '_', 'i_' },
    { '(', 'i(' },
    { ')', 'i)' },
    { '{', 'i{' },
    { '}', 'i}' },
    { [["]], [[i"]] },
    { [[']], [[i']] },
    -- matchup
    { ';', '<Plug>(matchup-i%)' },
    { '[;', '<Plug>(matchup-[%)' },
    { '];', '<Plug>(matchup-]%)' },
    { 'i;', '<Plug>(matchup-i%)' },
    { 'a;', '<Plug>(matchup-a%)' },
    { 'g;', '<Plug>(matchup-z%)' },
    { 'z;', '<Plug>(matchup-z%)' },
}) --}}}

-- autogroup{{{
vim.api.nvim_create_augroup('VSCodeGroup', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    group = 'VSCodeGroup',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ higroup = 'Search', timeout = 400 })
    end,
})

-- set cursor to the line when vim quit
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
    group = 'VSCodeGroup',
    pattern = '*',
    callback = function()
        if vim.fn.line([['"]]) > 1 and vim.fn.line([['"]]) <= vim.fn.line('$') then
            vim.cmd([[normal! g'"]])
        end
    end,
}) --}}}

-- yank{{{
local clip = '/mnt/c/Windows/System32/clip.exe'
if vim.fn.executable(clip) == 1 then
    vim.g.clipboard = 'unnamedplus'
    vim.api.nvim_create_autocmd('TextYankPost', {
        group = 'VSCodeGroup',
        pattern = '*',
        callback = function()
            if vim.v.event.operator == 'y' then
                vim.cmd([[call system(s:clip, @0)]])
            end
        end,
    })
else
    nmap({
        -- yank to system clipboard
        { 'y', [["+y]], opts(noremap) },
        { 'yy', [["+yy]], opts(noremap) },
        { 'Y', [["+y$]], opts(noremap) },
    })
    vmap({ 'y', '"+y`]', opts(noremap) })
end --}}}

-- plugin{{{
vim.cmd([[packadd packer.nvim]])
require('packer').startup(function(use)
    use({
        'andymass/vim-matchup',
        config = require('modules.editor.vim-matchup'),
    })
    use({ 'Meow-2/antovim' })
    use({ 'godlygeek/tabular' })
    use({ 'wellle/targets.vim' })
    use({ 'kylechui/nvim-surround', config = require('modules.editor.nvim-surround') })
    use({ 'terrortylor/nvim-comment', config = require('modules.editor.nvim-comment') })
    use({ 'mg979/vim-visual-multi', config = require('modules.editor.vim-visual-multi') })
    use({
        'lewis6991/gitsigns.nvim',
        config = require('modules.dress.gitsigns-nvim'),
        requires = { 'nvim-lua/plenary.nvim' },
    })
    use({ 'lilydjwg/fcitx.vim', config = require('modules.editor.fcitx-vim') })
    use({
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    'c',
                    'cpp',
                    'lua',
                    'python',
                    'go',
                    'bash',
                    'json',
                    'cmake',
                    'markdown',
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = '<CR>',
                        node_incremental = '<CR>',
                        scope_incremental = '<BS>',
                    },
                },
                matchup = {
                    enable = true,
                    disable = {},
                },
            })
        end,
    })
end) --}}}
