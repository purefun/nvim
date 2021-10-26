nnoremap <C-p> :call <SID>apply()<CR>

function! s:apply()
  execute 'Colortemplate!'
  execute 'colorscheme nil'
  execute 'chdir ~/.config/nvim'

  " https://github.com/norcalli/nvim-colorizer.lua/issues/35#issuecomment-725850831
  " reload colorizer plugin
  lua package.loaded['colorizer'] = nil
  lua package.loaded['plugins.colorizer'] = nil
  lua require('plugins.colorizer')
  lua require('colorizer').attach_to_buffer(0)

endfunction
