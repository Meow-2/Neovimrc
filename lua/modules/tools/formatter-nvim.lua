return function()
  -- Utilities for creating configurations
  local util = require('formatter.util')
  -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
  require('formatter').setup({
    -- Enable or disable logging
    logging = false,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
      sh = {
        function()
          local shiftwidth = vim.opt.shiftwidth:get()
          local expandtab = vim.opt.expandtab:get()

          if not expandtab then
            shiftwidth = 0
          end

          return {
            exe = 'shfmt',
            args = { '-i', shiftwidth, '-ci', '-bn' },
            stdin = true,
          }
        end,
      },
      cpp = {
        require('formatter.filetypes.cpp').clangformat,
      },
      python = {
        require('formatter.filetypes.python').autopep8,
      },
      json = {
        require('formatter.defaults.clangformat'),
      },
      cmake = {
        function()
          return {
            exe = 'cmake-format',
            args = { '-' },
            stdin = true,
          }
        end,
      },
      go = {
        require('formatter.filetypes.go').gofmt,
      },
      -- Formatter configurations for filetype "lua" go here
      -- and will be executed in order
      lua = {
        -- "formatter.filetypes.lua" defines default configurations for the
        -- "lua" filetype
        require('formatter.filetypes.lua').stylua,

        -- You can also define your own configuration
        -- function()
        -- 	-- Supports conditional formatting
        -- 	if util.get_current_buffer_file_name() == "special.lua" then
        -- 		return nil
        -- 	end
        --
        -- 	-- Full specification of configurations is down below and in Vim help
        -- 	-- files
        -- 	return {
        -- 		exe = "stylua",
        -- 		args = {
        -- 			"--search-parent-directories",
        -- 			"--stdin-filepath",
        -- 			util.escape_path(util.get_current_buffer_file_path()),
        -- 			"--",
        -- 			"-",
        -- 		},
        -- 		stdin = true,
        -- 	}
        -- end,
      },

      -- Use the special "*" filetype for defining formatter configurations on
      -- any filetype
      ['*'] = {
        -- "formatter.filetypes.any" defines default configurations for any
        -- filetype
        require('formatter.filetypes.any').remove_trailing_whitespace,
      },
    },
  })
  vim.api.nvim_create_augroup('Format_on_write', { clear = true })
  vim.api.nvim_create_autocmd('BufWritePost', {
    group = 'Format_on_write',
    pattern = { '*' },
    callback = function()
      vim.api.nvim_command('FormatWrite')
    end,
  })
end
