local filename = require('plugins.config.feline.filename')
local git_branch = require('plugins.config.feline.git_branch')
local git_diff = require('plugins.config.feline.git_diff')
local diagnostics = require('plugins.config.feline.diagnostics')
local lsp = require('plugins.config.feline.lsp')
local line_count = require('plugins.config.feline.line_count')
local position = require('plugins.config.feline.position')

local colors = {
  bg = '#454d5e',
  black = '#282828',
  yellow = '#d8a657',
  cyan = '#89b482',
  oceanblue = '#45707a',
  green = '#a9b665',
  orange = '#e78a4e',
  violet = '#d3869b',
  magenta = '#c14a4a',
  white = '#a89984',
  fg = '#e8e9ee',
  skyblue = '#7daea3',
  red = '#ea6962',
}

local components = {
  active = {{}, {}, {}},
  inactive = {{}, {}, {}},
}

-- LEFT

components.active[1][1] = filename
components.active[1][2] = git_branch
components.active[1][3] = git_diff.added
components.active[1][4] = git_diff.changed
components.active[1][5] = git_diff.removed
components.active[1][6] = diagnostics.error
components.active[1][7] = diagnostics.warning
components.active[1][8] = diagnostics.hint
components.active[1][10] = diagnostics.info

-- RIGHT

components.active[3][1] = lsp.name
components.active[3][2] = position
components.active[3][3] = line_count


components.inactive = components.active

require('feline').setup({
  theme = colors,
  colors = colors,
  components = components,
  force_inactive = {
    filetypes = {
      'NvimTree',
      'dbui',
      'packer',
      'startify',
      'fugitive',
      'fugitiveblame'
    },
    buftypes = {
      'terminal'
    },
    bufnames = {}
  },
})
