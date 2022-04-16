local M = {}

M.name = {
  provider = function()
    local clients = {}
    for _, client in pairs(vim.lsp.buf_get_clients(0)) do
      clients[#clients + 1] = client.name
    end
    return table.concat(clients, ' '), ''
  end,
  right_sep = ' '
}

return M
