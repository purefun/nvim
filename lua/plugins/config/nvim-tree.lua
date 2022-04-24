vim.g["nvim_tree_add_trailing"] = 1
vim.g["nvim_tree_show_icons"] = {
	 git = 0,
	 folders = 1,
	 files = 0,
   folder_arrows = 1,
}

require'nvim-tree'.setup {
  hijack_cursor = true,
  actions = {
    open_files = {
      quit_on_open = true
    }
  }
}
