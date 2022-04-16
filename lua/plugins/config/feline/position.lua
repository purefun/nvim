return {
  provider = function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    -- Turn col from byteindex to column number and make it start from 1
    col = vim.str_utfindex(vim.api.nvim_get_current_line(), col) + 1

    return string.format('%3d:%-2d', row, col)
  end,
  right_sep = {
    str = ' ',
  }
}
