-- https://github.com/ray-x/go.nvim
require('go').setup {}

-- vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
--
vim.api.nvim_exec([[
  autocmd BufWritePre *.go :silent! lua require('go.format').goimport()
]], false)


