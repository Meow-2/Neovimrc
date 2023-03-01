local package = require('core.pack').package
local conf = require('core.pack'):config('modules.tools')

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
    -- lazy = true,
    config = conf('which-key.nvim'),
})

package({
    'Meow-2/vim-floaterm',
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
        -- 'DapContinue',
    },
    config = conf('telescope.nvim'),
    dependencies = {
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        { 'nvim-telescope/telescope-file-browser.nvim' },
        { 'nvim-telescope/telescope-live-grep-args.nvim' },
        { 'Meow-2/neovim-session-manager', config = conf('neovim-session-manager') },
    },
})

package({
    'kyazdani42/nvim-tree.lua',
    cmd = {
        'NvimTreeToggle',
    },
    config = conf('nvim-tree.lua'),
    dependencies = 'kyazdani42/nvim-web-devicons',
})

-- package({
--     'olimorris/persisted.nvim',
--     -- module = 'persisted', -- For lazy loading
--     dependencies = 'telescope.nvim',
--     config = conf('persisted.nvim'),
-- })

-- package({
--     'Meow-2/neovim-session-manager',
--     dependencies = 'telescope.nvim',
--     config = conf('neovim-session-manager'),
-- })

package({
    'mhartington/formatter.nvim',
    -- event = { 'BufNewFile', 'BufRead' },
    event = { 'VeryLazy' },
    config = conf('formatter.nvim'),
})

package({
    'skywind3000/asynctasks.vim',
    -- event = { 'BufNewFile', 'BufRead' },
    event = { 'VeryLazy' },
    config = conf('asynctasks.vim'),
    dependencies = {
        { 'skywind3000/asyncrun.vim' },
    },
})
package({
    'kevinhwang91/nvim-bqf',
    -- event = { 'BufNewFile', 'BufRead' },
    event = { 'VeryLazy' },
    config = conf('nvim-bqf'),
})

-- package({
--     'iamcco/markdown-preview.nvim',
--     run = 'cd app && npm install',
--     ft = { 'markdown' },
--     setup = function()
--         vim.g.mkdp_filetypes = { 'markdown' }
--     end,
--     config = conf('markdown-preview.nvim'),
-- })

-- package({
--     'Meow-2/nvim-picgo',
--     ft = { 'markdown' },
--     config = conf('nvim-picgo'),
-- })

package({
    'folke/noice.nvim',
    event = { 'VeryLazy' },
    -- event = 'VimEnter',
    config = conf('noice.nvim'),
    dependencies = {
        { 'MunifTanjim/nui.nvim' },
        { 'Meow-2/nvim-notify' },
    },
})

package({
    'chentoast/marks.nvim',
    event = { 'VeryLazy' },
    config = conf('marks.nvim'),
})
