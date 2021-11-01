local cmd = vim.cmd

cmd [[syntax on]]
cmd [[filetype plugin on]]
cmd [[filetype indent on]]

vim.g.colors_name = 'mytheme'
cmd [[colorscheme mytheme]]

vim.g.mapleader = ' '
