if &runtimepath !~ 'fzf.vim'
  finish
endif

" autocmd! FileType fzf set laststatus=0 noshowmode noruler
"   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let $FZF_DEFAULT_OPTS .= ' --bind ctrl-a:select-all'

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit',
      \}

let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6 } }

" let g:fzf_colors =
"       \ { 'fg':      ['fg', 'Normal'],
"       \ 'bg':      ['bg', 'Normal'],
"       \ 'hl':      ['fg', 'Comment'],
"       \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"       \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"       \ 'hl+':     ['fg', 'Statement'],
"       \ 'info':    ['fg', 'PreProc'],
"       \ 'border':  ['fg', 'Ignore'],
"       \ 'prompt':  ['fg', 'Conditional'],
"       \ 'pointer': ['fg', 'Exception'],
"       \ 'marker':  ['fg', 'Keyword'],
"       \ 'spinner': ['fg', 'Label'],
"       \ 'header':  ['fg', 'Comment'] }

let g:fzf_colors = {
      \ 'prompt': ['fg', 'String'],
      \}

" disable preview window
let g:fzf_preview_window = ''

nnoremap <silent>sf :Files<cr>
nnoremap <silent>sg :Ag<cr>
nnoremap <silent>sb :Buffers<cr>
nnoremap <silent>sw :Ag <c-r><c-w><cr>

" fzf-mru plugin
nnoremap <silent>sm :FZFMru<cr>

tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

nnoremap <silent><C-p> :Command<cr>

let g:fzf_commands_expect = 'ctrl-c'
