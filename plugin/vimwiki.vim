if &runtimepath !~ 'vimwiki'
  finish
endif


let g:vimwiki_list = [
      \  {
      \    'path': '~/wiki/',
      \    'syntax': 'markdown',
      \    'ext': '.md'
      \  }
      \]
