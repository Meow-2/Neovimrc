
local dap, dapui = require "dap", require "dapui"
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
  vim.api.nvim_command("DapVirtualTextEnable")
  vim.api.nvim_set_keymap("n", "<c-k>", "<cmd>lua require'dapui'.eval()<cr>", { noremap = true, silent = true })
  -- dapui.close("tray")
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  vim.api.nvim_command("DapVirtualTextDisable")
  vim.api.nvim_del_keymap("n", "<c-k>")
  vim.api.nvim_set_keymap("n", "<c-k>", "<c-v>", { noremap = true })
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  vim.api.nvim_command("DapVirtualTextDisable")
  dapui.close()
end
-- for some debug adapter, terminate or exit events will no fire, use disconnect reuest instead
dap.listeners.before.disconnect["dapui_config"] = function()
  vim.api.nvim_command("DapVirtualTextDisable")
  dapui.close()
end

-- TODO: wait dap-ui for fix temrinal layout
-- the "30" of "30vsplit: doesn't work
dap.defaults.fallback.terminal_win_cmd = '30vsplit new' -- this will be override by dapui
-- dap.defaults.fallback.terminal_win_cmd = [[belowright new +let\ b:dap_terminal\ =\ 1]]

local dap_breakpoint = {
  error = {
    text = "●",
    texthl = "LspDiagnosticsSignError",
    linehl = "",
    numhl = "",
  },
}

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)

local status_ok, dapui = pcall(require, 'dapui')

dapui.setup ({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "o", "<2-LeftMouse>", "<CR>" },
    open = "O",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.40, -- Can be float or integer > 1
      },
      { id = "stacks", size = 0.30 },
      { id = "watches", size = 0.15 },
      { id = "breakpoints", size = 0.15 },
    },
    size = 40,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    -- elements = { "repl" },
    elements = {},
    -- size = 5,
    -- position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})
