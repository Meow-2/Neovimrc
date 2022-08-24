local plugin = require('core.pack').register_plugin
local conf = require('core.pack').conf_plugin('modules.tools')

plugin({ 'dstein64/vim-startuptime' })

plugin({
    'folke/which-key.nvim',
    keys = {
        's',
        'g',
        'z',
        't',
        'c',
        'd',
        'R',
        '<C-t>',
        '<C-g>',
        '<Leader>',
    },
    module = { 'gitsigns', 'cmp', 'lspconfig', 'nvim-tree' },
    config = conf('which-key.nvim'),
})

plugin({
    'voldikss/vim-floaterm',
    cmd = {
        'FloatermNew',
        'FloatermToggle',
    },
    config = conf('vim-floaterm'),
})

plugin({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    cmd = {
        'Telescope',
        'TelescopeLiveGrep',
        'TodoTelescope',
        'SessionManager',
        'NvimTreeToggle',
        'DapContinue',
    },
    module = 'dap',
    after = {
        'telescope-ui-select.nvim',
        'telescope-fzf-native.nvim',
        'telescope-file-browser.nvim',
        'telescope-live-grep-args.nvim',
    },
    config = conf('telescope.nvim'),
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

plugin({
    'kyazdani42/nvim-tree.lua',
    after = 'telescope.nvim',
    config = conf('nvim-tree.lua'),
    requires = 'kyazdani42/nvim-web-devicons',
})

plugin({
    'Shatur/neovim-session-manager',
    after = 'nvim-tree.lua',
    config = conf('neovim-session-manager'),
})

plugin({
    'mhartington/formatter.nvim',
    event = { 'BufNewFile', 'BufReadPost' },
    config = conf('formatter.nvim'),
})

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
    'Meow-2/nvim-picgo',
    ft = { 'markdown' },
    config = conf('nvim-picgo'),
})
