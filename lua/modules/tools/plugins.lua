local package = require('core.pack').package
local conf = require('core.pack').conf_package('modules.tools')

package({
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

package({
    'voldikss/vim-floaterm',
    cmd = {
        'FloatermNew',
        'FloatermToggle',
    },
    config = conf('vim-floaterm'),
})

package({
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

package({
    'kyazdani42/nvim-tree.lua',
    after = 'telescope.nvim',
    config = conf('nvim-tree.lua'),
    requires = 'kyazdani42/nvim-web-devicons',
})

package({
    'Shatur/neovim-session-manager',
    after = 'nvim-tree.lua',
    config = conf('neovim-session-manager'),
})

package({
    'mhartington/formatter.nvim',
    event = { 'BufNewFile', 'BufReadPost' },
    config = conf('formatter.nvim'),
})

package({
    'skywind3000/asynctasks.vim',
    after = 'asyncrun.vim',
    config = conf('asynctasks.vim'),
    requires = {
        { 'skywind3000/asyncrun.vim', event = { 'BufNewFile', 'BufReadPost' } },
    },
})
package({
    'kevinhwang91/nvim-bqf',
    event = { 'BufNewFile', 'BufReadPost' },
    config = conf('nvim-bqf'),
})

package({
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    ft = { 'markdown' },
    setup = function()
        vim.g.mkdp_filetypes = { 'markdown' }
    end,
    config = conf('markdown-preview.nvim'),
})

package({
    'Meow-2/nvim-picgo',
    ft = { 'markdown' },
    config = conf('nvim-picgo'),
})

package({
    'folke/noice.nvim',
    commit = '87f908da660c321439a0dd98a8e51cd85227f57b',
    event = 'VimEnter',
    config = conf('noice.nvim'),
    requires = {
        { 'MunifTanjim/nui.nvim', opt = true },
        { 'rcarriga/nvim-notify', opt = true },
    },
})

package({
    'chentoast/marks.nvim',
    event = { 'BufNewFile', 'BufReadPost' },
    config = conf('marks.nvim'),
})
