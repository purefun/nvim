local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ' '

-- save buffer

keymap('n', '<C-S>', [[<cmd>w!<cr>]], { noremap = true })
keymap('i', '<C-S>', [[<C-C><cmd>w!<cr>]], { noremap = true })
keymap('v', '<C-S>', [[<C-C><cmd>w!<cr>]], { noremap = true })

keymap('n', '<leader>nn', [[<cmd>nohl<cr>]], { noremap = true })
keymap('i', '<C-C>', [[<ESC>]], { noremap = true })
keymap('v', '//', [[y/<C-r>"<cr>]], { noremap = true })
keymap('n', 'f', [[<Plug>Lightspeed_s]], { noremap = false })
keymap('n', 'F', [[<Plug>Lightspeed_S]], { noremap = false })
keymap('i', 'jj', [[<ESC>]], { noremap = true })
keymap('c', 'jj', [[<ESC>]], { noremap = true })
