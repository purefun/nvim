local lsp = require('feline.providers.lsp')

local ERROR = vim.diagnostic.severity.ERROR
local WARN = vim.diagnostic.severity.WARN
local HINT = vim.diagnostic.severity.HINT
local INFO = vim.diagnostic.severity.INFO

local function count(severity)
  return lsp.get_diagnostics_count(severity)
end

local function error()
  return ' E' .. count(ERROR)
end

local function warn()
  return ' W' .. count(WARN)
end

local function hint()
  return ' H' .. count(HINT)
end

local function info()
  return ' I' .. count(INFO)
end

local M = {}

M.error = {
  provider = error,
  enabled = function() return count(ERROR) > 0 end,
  hl = {
    fg = 'red',
    style = 'bold'
  }
}

M.warning = {
  provider = warn,
  enabled = function() return count(WARN) > 0 end,
  hl = {
    fg = 'yellow',
    style = 'bold'
  }
}
M.hint = {
  provider = hint,
  enabled = function() return count(HINT) > 0 end,
  hl = {
    fg = 'cyan',
    style = 'bold'
  }
}
M.info = {
  provider = info,
  enabled = function() return count(INFO) > 0 end,
  hl = {
    fg = 'skyblue',
    style = 'bold'
  }
}


return M
