local M = {}

-- Common function used by the git providers
local function git_diff(type)
    local gsd = vim.b.gitsigns_status_dict

    if gsd and gsd[type] and gsd[type] > 0 then
        return tostring(gsd[type])
    end

    return ''
end

M.added = {
  provider = function()
    return git_diff('added'), ' +'
  end,
  hl = {
    fg = 'green',
    bg = 'bg',
    style = 'bold'
  }
}


M.removed = {
  provider = function()
    return git_diff('removed'), ' -'
  end,
  hl = {
    fg = 'red',
    bg = 'bg',
    style = 'bold'
  }
}

M.changed = {
  provider = function()
    return git_diff('changed'), ' ~'
  end,
  hl = {
    fg = 'orange',
    bg = 'bg',
    style = 'bold'
  }
}

function M.git_info_exists()
    return vim.b.gitsigns_head or vim.b.gitsigns_status_dict
end

return M
