if &runtimepath !~ 'lightline'
  finish
endif

let g:lightline.component = {
    \ 'totaline': "%{line('$')}",
    \ }

let g:lightline.subseparator = { 'left': '', 'right': '' }

let g:lightline.component_expand = {
      \ }

let g:lightline.component_type = {
      \ }

let g:lightline.component_function = {
    \ 'gitbranch': 'fugitive#head',
    \ 'workingDirectory': 'WorkingDirectory',
    \ 'cocstatus': 'CocStatus',
    \ }

let g:lightline.active = {
    \ 'left':  [
    \            [ 'workingDirectory' ],
    \            [ 'gitbranch' ],
    \            [ 'filename' ],
    \            [ 'readonly', 'modified' ]
    \          ],
    \ 'right': [ [ 'totaline' ],
    \            [ 'lineinfo' ],
    \            [ 'filetype' ],
    \            [ 'cocstatus' ] ] }


let g:lightline.inactive = {
    \ 'left':  [
    \            ['workingDirectory'],
    \            [ 'gitbranch', 'filename' ],
    \            [ 'readonly', 'modified' ]
    \          ],
    \ 'right': [ ['totaline'],
    \            [ 'lineinfo' ],
    \            [ 'filetype' ],
    \            [ 'cocstatus' ] ] }

let g:lightline.tabline = {
    \ 'left':  [ [ 'tabs' ] ],
    \ 'right': [ ] }

function! WorkingDirectory()
 return strpart(getcwd(), strridx(getcwd(), '/') + 1)
endfunction

function! CocStatus() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

" autocmd User ALEJobStarted call lightline#update()
" autocmd User ALELintPost call lightline#update()
" autocmd User ALEFixPost call lightline#update()
