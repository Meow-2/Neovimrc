return function()
  local dapui = require('dapui')
  dapui.setup({
    icons = { expanded = '▾', collapsed = '▸' },
    mappings = {
      -- Use a table to apply multiple mappings
      expand = { 'o', '<2-LeftMouse>', '<CR>' },
      open = 'O',
      remove = 'd',
      edit = 'e',
      repl = 'r',
      toggle = 't',
    },
    layouts = {
      -- You can change the order of elements in the sidebar
      {
        elements = {
          -- Provide as ID strings or tables with "id" and "size" keys
          {
            id = 'scopes',
            size = 0.35, -- Can be float or integer > 1
          },
          { id = 'stacks', size = 0.30 },
          { id = 'watches', size = 0.15 },
          { id = 'breakpoints', size = 0.15 },
        },
        size = 40,
        position = 'left', -- Can be "left", "right", "top", "bottom"
      },
      {
        -- elements = { "repl" },
        elements = {
          'repl',
        },
        size = 10,
        position = 'bottom', -- Can be "left", "right", "top", "bottom"
      },
    },
    floating = {
      max_height = nil, -- These can be integers or a float between 0 and 1.
      max_width = nil, -- Floats will be treated as percentage of your screen.
      border = 'single', -- Border style. Can be "single", "double" or "rounded"
      mappings = {
        close = { 'q', '<Esc>' },
      },
    },
    windows = { indent = 1 },
  })

  local dap = require('dap')
  local keymap = require('core.keymap')
  local nmap = keymap.nmap
  local cmd = keymap.cmd
  local nore_silent = keymap.new_opts(keymap.noremap, keymap.nore_silent)

  local debug_open = function()
    dapui.open({})
    vim.api.nvim_command('DapVirtualTextEnable')
    nmap({ '<C-k>', cmd([[lua require'dapui'.eval()]]), nore_silent })
  end

  local debug_close = function()
    dap.repl.close()
    dapui.close({})
    vim.api.nvim_command('DapVirtualTextDisable')
    vim.api.nvim_command('bdelete! term') -- close debug temrinal
    nmap({ '<C-k>', cmd('Lspsaga hover_doc'), nore_silent })
  end

  -- config debug behavior
  dap.listeners.after.event_initialized['dapui_config'] = function()
    debug_open()
  end
  dap.listeners.before.event_terminated['dapui_config'] = function()
    debug_close()
  end
  dap.listeners.before.event_exited['dapui_config'] = function()
    debug_close()
  end
  dap.listeners.before.disconnect['dapui_config'] = function()
    debug_close()
  end

  dap.defaults.fallback.terminal_win_cmd = '30vsplit new'

  -- config dap_breakpoint style
  local dap_breakpoint = {
    error = {
      text = '● ',
      texthl = 'LspDiagnosticsSignError',
    },
    condition = {
      text = ' ',
      texthl = 'LspDiagnosticsSignHint',
    },
    log = {
      text = 'ﳁ ',
      texthl = 'LspDiagnosticsSignInformation',
    },
    rejected = {
      text = ' ',
      texthl = 'LspDiagnosticsSignHint',
    },
    stopped = {
      text = ' ',
      texthl = 'LspDiagnosticsSignInformation',
    },
  }

  vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
  vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
  vim.fn.sign_define('DapLogPoint', dap_breakpoint.log)
  vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
  vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)
end
