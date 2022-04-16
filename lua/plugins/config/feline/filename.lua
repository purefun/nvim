return {
  provider = function()
    local filename = vim.fn.expand("%:t")
    if filename == '' then
      return '[No Name]'
    end
    local status = '[✔︎]'
    if vim.bo.modified then
      status = '[+]'
    end
    if vim.bo.readonly then
      status = '[-]'
    end

    return ' ' .. filename .. ' ' .. status
  end,
  hl = {
    fg = 'fg',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = {
    str = ' ',
    hl = {
      fg = 'fg',
      bg = 'bg',
      style = 'bold'
    },
  }
}
