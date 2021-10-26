if &runtimepath !~ 'clap'
  finish
endif

let g:clap_layout = { 'relative': 'editor' }

nnoremap <silent>sf :Clap files<CR>
" nnoremap <silent>sl :Denite line<cr>
" nnoremap <silent>sd :Denite -resume<cr>
nnoremap <silent>sg :Clap grep<cr>
" nnoremap <silent>sw :Denite grep -input=<c-r><c-w><cr>
" nnoremap <silent>sb :Denite buffer<cr>
nnoremap <silent>so :Clap history<cr>
