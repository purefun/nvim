local layout = {
    width = 80,
    height = 0.7,
    prompt_position = 'top',
}

require('telescope').setup{
  defaults = {
    selection_caret = '  ',
    sorting_strategy = 'ascending',
    prompt_position = 'top',
    prompt_prefix = '  ➔ ',
    layout_config = {
      prompt_position = 'top',
    }
  },
  pickers = {
    find_files = {
      prompt_title = '',
      theme = 'dropdown',
      previewer = false,
      layout_config = layout,
    },
    git_files = {
      prompt_title = '',
      theme = 'dropdown',
      previewer = false,
      layout_config = layout,
    },
    live_grep = {
      prompt_title = '',
      results_title = '',
      preview_title = '',
      layout_config = {
        width = 0.9,
        height = 0.9,
        prompt_position = 'top',
      },
    },
    buffers = {
      theme = 'dropdown',
      previewer = false,
      layout_config = layout,
    },
    oldfiles = {
      theme = 'dropdown',
      previewer = false,
      layout_config = {
        width = 0.9,
        height = 0.7,
        prompt_position = 'top',
      },
    },
    grep_string = {
      layout_config = {
        width = 0.9,
        height = 0.9,
        prompt_position = 'top',
      },
    },
  }, -- end of pickers

  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
    tmuxinator = {
      disable_icons = true,
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('node_modules')
require('telescope').load_extension('coc')
require('telescope').load_extension('ghq')

local M = {}

M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

return M

