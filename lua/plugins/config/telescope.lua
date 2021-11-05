require('telescope').setup{
  defaults = {
    selection_caret = '  ',
    sorting_strategy = 'ascending',
    prompt_prefix = ' 😎 ',
    layout_config = {
      mirror = false,
      prompt_position = 'top',
    },
  },
  pickers = {
    git_files = {
      prompt_title = '',
      theme = 'dropdown',
      previewer = false,
      layout_config = {
        width = 80,
        height = 0.7
      }
    },
    live_grep = {
      prompt_title = '',
      results_title = '',
      preview_title = '',
    },
  }, -- end of pickers

  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('node_modules')
require('telescope').load_extension('coc')
