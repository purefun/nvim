local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local actions = require('telescope.actions')
local conf = require("telescope.config").values
local action_state = require('telescope.actions.state')
local utils = require('telescope.utils')

local M = {}

M.windows = function(opts)
    local window_ids = utils.get_os_command_output({'tmux', 'list-windows', '-a', '-F', '#S:#W'})
    local display_windows = utils.get_os_command_output({'tmux', 'list-windows', '-a', '-F', '#S: #W'})
    local current_window = utils.get_os_command_output({'tmux', 'display-message', '-p', '#S:#W'})[1]
    local entries = {}

    for i, v in ipairs(display_windows) do
        local entry = {
            value = window_ids[i],
            display = v,
            ordinal = v,
            valid = window_ids[i] ~= current_window
        }
        table.insert(entries, entry)
    end

  local current_client = utils.get_os_command_output({'tmux', 'display-message', '-p', '#{client_tty}'})[1]

  pickers.new(opts, {
      prompt_title = 'Tmux Windows',
      finder = finders.new_table {
          results = entries,
          entry_maker = function(res) return res end,
      },
        sorter = conf.generic_sorter(opts),
      previerer = false,
      attach_mappings = function(prompt_bufnr)
          actions.select_default:replace(function()
              local selection = action_state.get_selected_entry()
              local selected_window_id = selection.value
              vim.cmd(string.format('silent !tmux switchc -t %s -c %s', selected_window_id, current_client))
              actions.close(prompt_bufnr)
          end)
          return true
      end
  }):find()
end

M.windows()

return M
