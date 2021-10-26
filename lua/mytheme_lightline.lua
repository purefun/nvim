local theme = require('mytheme')

local lightline_theme = {
  normal = {
    left = {
      {theme.LightlineLeft1.fg.hex, theme.LightlineLeft1.bg.hex},
      {theme.LightlineLeft2.fg.hex, theme.LightlineLeft2.bg.hex},
    },
    middle = {
      {theme.LightlineMiddle.fg.hex, theme.LightlineMiddle.bg.hex},
    },
    right = {
      {theme.LightlineRight1.fg.hex, theme.LightlineRight1.bg.hex},
    },
  },
}

local lightline_theme_filled = vim.fn['lightline#colorscheme#fill'](lightline_theme)
vim.g['lightline#colorscheme#mytheme#palette'] = lightline_theme_filled
