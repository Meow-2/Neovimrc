return function()
  -- vim.api.nvim_command('set foldmethod=marker')
  -- vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
  require('nvim-treesitter.configs').setup({
    ensure_installed = {'c','cpp','lua','python','go','bash','yaml','vim','json', 'cmake','markdown'},
    -- ignore_install = { 'phpdoc' },
    highlight = {
      enable = true,
    },

    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ['f'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
    },

    matchup = {
        enable = true,
        disable = {},
    },
  })
end

