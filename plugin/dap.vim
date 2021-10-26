if &runtimepath !~ 'nvim-dap'
  finish
endif

lua require('plugins.dap')
