if &runtimepath !~ 'galaxyline.nvim'
  finish
endif

lua require('plugins.galaxyline')
