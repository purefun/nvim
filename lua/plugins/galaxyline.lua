local gl = require('galaxyline')
local theme = require('mytheme')
local condition = require('galaxyline.condition')
local diagnostic = require('galaxyline.provider_diagnostic')
local gls = gl.section
gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer', 'defx', 'qf', 'quickfix'}

local filestatus = function()
  if vim.bo.readonly or not vim.bo.modifiable then
    return ''
  end

  if vim.bo.modified then
    return ''
  end
  return ''
end

------------------------------------------------------------

local filenameWithHi = function(color)
  return  {
    provider = function()
      local file = vim.fn.expand('%:t')
      if vim.fn.empty(file) == 1 then return ' [No Name]' end
      return ' ' .. file .. ' ' .. filestatus()
    end,
    icon = ' ',

    separator = ' ',
    highlight = {color.fg.hex, color.bg.hex},
    separator_highlight = {color.fg.hex, color.bg.hex},
  }
end



local cwd = {
  provider = function()
    return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  end,
  icon = ' ',
  highlight = {theme.GalaxylineCWD.fg.hex, theme.GalaxylineCWD.bg.hex},
  separator = ' ',
  separator_highlight = {theme.GalaxylineCWD.fg.hex, theme.GalaxylineCWD.bg.hex},
}

local gitBranch = {
  provider = 'GitBranch',
  condition = condition.check_git_workspace,
  icon = ' ',
  separator = ' ',
  highlight = {theme.GalaxylineGitBranch.fg.hex, theme.GalaxylineGitBranch.bg.hex},
  separator_highlight = {theme.GalaxylineGitBranch.fg.hex, theme.GalaxylineGitBranch.bg.hex},
}

local diffAdd = {
  provider = 'DiffAdd',
  icon = '+',
  separator = '',
  highlight = {theme.GalaxylineDiffAdd.fg.hex, theme.GalaxylineDiffAdd.bg.hex}
}

local diffModified = {
  provider = 'DiffModified',
  icon = '~',
  separator = '',
  highlight = {theme.GalaxylineDiffModified.fg.hex, theme.GalaxylineDiffModified.bg.hex}
}

local diffRemove = {
  provider = 'DiffRemove',
  icon = '-',
  separator = '',
  highlight = {theme.GalaxylineDiffRemove.fg.hex, theme.GalaxylineDiffRemove.bg.hex}
}

local diagnosticError = {
  provider = function()
    local s = diagnostic.get_diagnostic_error()
    if s ~= nil and s ~= '' then return s .. ' ' end
    return s
  end,
  -- icon = '  ',
  icon = ' E',
  highlight = {theme.GalaxylineDiagnositcError.fg.hex, theme.GalaxylineDiagnositcError.bg.hex},
}

local diagnosticWarn = {
  provider = function()
    local s = diagnostic.get_diagnostic_warn()
    if s ~= nil and s ~= '' then return s .. ' ' end
    return s
  end,
  icon = '  W',
  -- icon = '  ',
  highlight = {theme.GalaxylineDiagnositcWarn.fg.hex, theme.GalaxylineDiagnositcWarn.bg.hex},
}

local diagnosticHint = {
  provider = function()
    local s = diagnostic.get_diagnostic_hint()
    if s ~= nil and s ~= '' then return s .. ' ' end
    return s
  end,
  icon = ' H',
  -- icon = '  ',
  highlight = {theme.GalaxylineDiagnositcHint.fg.hex, theme.GalaxylineDiagnositcHint.bg.hex},
}

local diagnosticInfo = {
  provider = function()
    local s = diagnostic.get_diagnostic_info()
    if s ~= nil and s ~= '' then return s .. ' ' end
    return s
  end,
  icon = ' I',
  -- icon = '  ',
  highlight = {theme.GalaxylineDiagnositcInfo.fg.hex, theme.GalaxylineDiagnositcInfo.bg.hex},
}

local  cocStatus = {
  provider = function()
    if vim.g.coc_status == nil then
        return nil
    end
    return vim.g.coc_status .. ' '
  end,
  highlight = { theme.GalaxylineCocStatus.fg.hex, theme.GalaxylineCocStatus.bg.hex},
}

local lineInfo = {
  provider = function()
    local line = vim.fn.line('.')
    local column = vim.fn.col('.')
    local total = vim.fn.line('$')
    return line .. ':' .. column .. ' ' .. total .. ' '
  end,
  separator = ' ',
  separator_highlight = {'NONE', theme.GalaxylineLineInfo.bg.hex},
  highlight = {'NONE', theme.GalaxylineLineInfo.bg.hex},
}


local filetype = {
  provider = function() return vim.bo.filetype .. ' ' end,
  condition = function() return vim.bo.filetype ~= '' end,
  separator = ' ',
  separator_highlight = {'NONE', theme.GalaxylineLineFiletype.bg.hex},
  highlight = {'NONE', theme.GalaxylineLineFiletype.bg.hex},
}

------------------------------------------------------------

gls.left = {
  { fileName        = filenameWithHi(theme.GalaxylineFilename) },
  { cwd             = cwd             },
  { gitBranch       = gitBranch       },

  { diffAdd         = diffAdd         },
  { diffModified    = diffModified    },
  { diffRemove      = diffRemove      },

  { diagnosticError = diagnosticError },
  { diagnosticWarn  = diagnosticWarn  },
  { diagnosticHint  = diagnosticHint  },
  { diagnosticInfo  = diagnosticInfo  },
}

------------------------------------------------------------

gls.right = {

  { cocStatus       = cocStatus       },
  { LineInfo        = lineInfo        },
  { Filetype        = filetype        },
}

------------------------------------------------------------

gls.short_line_left = {
  { filenameInactive = filenameWithHi(theme.GalaxylineFilenameInactive) },
  { cwd              = cwd                                              },
  { gitBranch        = gitBranch                                        },

  { diffAdd          = diffAdd                                          },
  { diffModified     = diffModified                                     },
  { diffRemove       = diffRemove                                       },

  { diagnosticError  = diagnosticError                                  },
  { diagnosticWarn   = diagnosticWarn                                   },
  { diagnosticHint   = diagnosticHint                                   },
  { diagnosticInfo   = diagnosticInfo                                   },
}




gls.short_line_right = gls.right

