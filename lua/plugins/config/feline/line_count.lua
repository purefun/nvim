return {
  provider = function()
    return tostring(vim.api.nvim_buf_line_count(0))
  end,
  right_sep = ' '
}
