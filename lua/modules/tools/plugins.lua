local plugin = require('core.pack').register_plugin
local conf = require('core.pack').conf_plugin('modules.tools')

plugin({ 'dstein64/vim-startuptime' })
plugin({ 'voldikss/vim-floaterm', config = conf('vim-floaterm') })
plugin({ 'folke/which-key.nvim', config = conf('which-key.nvim') })
plugin({
    'nvim-telescope/telescope.nvim',
    cmd = { 'Telescope', 'SessionManager' },
    tag = '0.1.0',
    config = conf('telescope.nvim'),
    after = {
        'telescope-ui-select.nvim',
        'telescope-fzf-native.nvim',
        'telescope-file-browser.nvim',
        'telescope-live-grep-args.nvim',
    },
    requires = {
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        { 'nvim-telescope/telescope-file-browser.nvim' },
        { 'nvim-telescope/telescope-live-grep-args.nvim' },
        {
            'nvim-telescope/telescope-dap.nvim',
            after = { 'nvim-dap', 'telescope.nvim' },
            config = function()
                require('telescope').load_extension('dap')
            end,
        },
    },
})

-- plugin({'nvim-telescope/telescope-ui-select.nvim'})
-- plugin({'nvim-telescope/telescope-fzf-native.nvim', run = 'make'})
-- plugin({ 'nvim-telescope/telescope-dap.nvim' })
plugin({
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufNewFile', 'BufReadPost' },
    run = ':TSUpdate',
    -- after = {'telescope.nvim'},
    config = conf('nvim-treesitter'),
    requires = {
        { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
    },
})

-- plugin({ 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' })

plugin({
    'Shatur/neovim-session-manager',
    after = 'telescope.nvim',
    config = conf('neovim-session-manager'),
})
plugin({
    'mhartington/formatter.nvim',
    event = { 'BufNewFile', 'BufReadPost' },
    config = conf('formatter.nvim'),
})
-- plugin({ 'skywind3000/asyncrun.vim' })
plugin({
    'skywind3000/asynctasks.vim',
    after = 'asyncrun.vim',
    config = conf('asynctasks.vim'),
    requires = {
        { 'skywind3000/asyncrun.vim', event = { 'BufNewFile', 'BufReadPost' } },
    },
})
plugin({
    'kevinhwang91/nvim-bqf',
    event = { 'BufNewFile', 'BufReadPost' },
    config = conf('nvim-bqf'),
})

plugin({
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    ft = { 'markdown' },
    setup = function()
        vim.g.mkdp_filetypes = { 'markdown' }
    end,
    config = conf('markdown-preview.nvim'),
})

plugin({
    'askfiy/nvim-picgo',
    ft = { 'markdown' },
    config = conf('nvim-picgo'),
})
