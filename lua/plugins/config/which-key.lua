local wk = require("which-key")

wk.setup()

local function setDapLogLevelToTrace()
  require('dap').set_log_level('TRACE')
  print("Set Dap Log Level: TRACE")
end

local function editDapLogFile()
  vim.api.nvim_command("edit " .. vim.fn.stdpath('cache') .. "/dap.log")
end

local function openDapTray()
  require('dapui').open('tray')
end

wk.register({
  ["<leader>d"] = { name = "+Debug" },
  ["<leader>db"] = { require('dap').toggle_breakpoint, "Toggle Breakpoint" },
  ["<leader>dc"] = { require('dap').continue, "Continue" },
  ["<leader>di"] = { require('dap').step_into, "Step Into" },
  ["<leader>dn"] = { require('dap').step_over, "Step Over" }, -- next
  ["<leader>do"] = { require('dap').step_out, "Step Out" },
  ["<leader>dd"] = { require('dap').disconnect, "Disconnect" },
  ["<leader>dr"] = { require('dap').restart, "Restart" },
  ["<leader>dx"] = { require('dap').repl.open, "Open Repl" },
  ["<leader>dj"] = { require('dap').run_to_cursor, "Run to Cursor" },
  ["<leader>dv"] = { openDapTray, "Toggle Dap UI" },
  ["<leader>dt"] = { setDapLogLevelToTrace, "Set TRACE log level" },
  ["<leader>dl"] = { editDapLogFile, "Set TRACE log level" },
  ["<leader>e"] = { name = "+Edit" },
  ["<leader>er"] = { require('spectre').open, "Replace" },
  ["<leader>ld"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Open LSP diagnostics" }, -- lsp diagnostics
  ["<leader>ln"] = { function() require("trouble").next({skip_groups = true, jump = true}) end, "Jump to the next diagnostic item" }, -- lsp diagnostics
  ["<leader>lp"] = { function() require("trouble").previous({skip_groups = true, jump = true}) end, "Jump to the previous diagnostic item" }, -- lsp diagnostics
  ["<leader>lr"] = { '<cmd>LspRestart<cr>', "Restart LSP" }, -- lsp restart
})

