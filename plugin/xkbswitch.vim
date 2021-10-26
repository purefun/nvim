if &runtimepath !~ 'vim-xkbswitch'
  finish
endif

let g:XkbSwitchEnabled = 1
let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'

