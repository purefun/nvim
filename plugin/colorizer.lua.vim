if &runtimepath !~ 'nvim-colorizer.lua'
  finish
endif

lua require("plugins.config.colorizer")
