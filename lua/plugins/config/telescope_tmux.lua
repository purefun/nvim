local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local actions = require('telescope.actions')
local themes = require('telescope.themes')
local conf = require("telescope.config").values
local action_state = require('telescope.actions.state')
local utils = require('telescope.utils')

local M = {}

M.sessions = function()
    local session_ids = utils.get_os_command_output({'tmux', 'list-sessions', '-F', '#S'})
    local current_session = utils.get_os_command_output({'tmux', 'display-message', '-p', '#S'})[1]
    local entries = {}

    for i, v in ipairs(session_ids) do
        local entry = {
            value = session_ids[i],
            display = v,
            ordinal = v,
            valid = session_ids[i] ~= current_session
        }
        table.insert(entries, entry)
    end

  local current_client = utils.get_os_command_output({'tmux', 'display-message', '-p', '#{client_tty}'})[1]

  local opts = themes.get_dropdown({ layout_config = { width = 80, height = 0.7 } })

  pickers.new(opts, {
      prompt_title = 'Tmux Sessions',
      finder = finders.new_table {
          results = entries,
          entry_maker = function(res) return res end,
      },
      sorter = conf.generic_sorter(opts),
      previerer = false,
      attach_mappings = function(prompt_bufnr)
          actions.select_default:replace(function()
              local selection = action_state.get_selected_entry()
              local selected_session_id = selection.value
              vim.cmd(string.format('silent !tmux switchc -t %s -c %s', selected_session_id, current_client))
              actions.close(prompt_bufnr)
          end)
          return true
      end
  }):find()
end

M.sessions()

return M
