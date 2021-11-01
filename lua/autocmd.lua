local cmd = vim.cmd

cmd [[autocmd TextYankPost * silent! lua vim.highlight.on_yank { timeout=500 }]]
