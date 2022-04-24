local dap = require('dap')

-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#go-using-delve-directly

-- dap.adapters.go = function(callback, config)
--   local stdout = vim.loop.new_pipe(false)
--   local handle
--   local pid_or_err
--   local port = 38697
--   local opts = {
--     stdio = {nil, stdout},
--     args = {"dap", "-l", "127.0.0.1:" .. port},
--     detached = true
--   }
--   handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
--     stdout:close()
--     handle:close()
--     if code ~= 0 then
--       print('dlv exited with code', code)
--     end
--   end)
--   assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
--   stdout:read_start(function(err, chunk)
--     assert(not err, err)
--     if chunk then
--       vim.schedule(function()
--         require('dap.repl').append(chunk)
--       end)
--     end
--   end)
--   -- Wait for delve to start
--   vim.defer_fn(
--   function()
--     callback({type = "server", host = "127.0.0.1", port = port})
--   end,
--   100)
-- end
--
  -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
  -- dap.configurations.go = {
  --   {
  --     type = "go",
  --     name = "Debug",
  --     request = "launch",
  --     program = "${file}"
  --   },
  --   {
  --     type = "go",
  --     name = "Debug test", -- configuration for debugging test files
  --     request = "launch",
  --     mode = "test",
  --     program = "${file}"
  --   },
  --   -- works with go.mod packages and sub packages 
  --   {
  --     type = "go",
  --     name = "Debug test (go.mod)",
  --     request = "launch",
  --     mode = "test",
  --     program = "./${relativeFileDirname}"
  --   } 
-- }

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/dev/sources/github.com/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
}

dap.configurations.javascript = {
  {
    name = 'launch',
    type = 'node2',
    request = 'launch',
    program = '${workspaceFolder}/${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}

require("nvim-dap-virtual-text").setup()
require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 00.25 },
    },
    size = 40,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { "repl" },
    size = 10,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
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
