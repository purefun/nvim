nnoremap <leader>z :Goyo 90<cr>

let g:goyo_height = '100%'
let g:goyo_linenr = 1

function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  " set scrolloff=999
  " silent !tmux set status off
  " silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  " set scrolloff=5
  " silent !tmux set status on
  " silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

