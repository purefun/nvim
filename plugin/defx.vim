nnoremap <silent>_ :Defx -search=`expand('%:p')` -show-ignored-files<CR>
nnoremap <silent>- :Defx `expand('%:p:h')` -search=`expand('%:p')` -show-ignored-files<CR>
nnoremap <silent><C-_> :Defx -show-ignored-files<CR>

autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
  setlocal cursorline
  nnoremap <silent><buffer><expr> <CR>     defx#do_action('open')
  nnoremap <silent><buffer><expr> cc       defx#do_action('copy')
  nnoremap <silent><buffer><expr> M        defx#do_action('move')
  nnoremap <silent><buffer><expr> p        defx#do_action('paste')
  nnoremap <silent><buffer><expr> l        defx#do_action('open')
  nnoremap <silent><buffer><expr> E        defx#do_action('drop')
  nnoremap <silent><buffer><expr> P        defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o        defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K        defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N        defx#do_action('new_file')
  " nnoremap <silent><buffer><expr> M        defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C        defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time:git')
  nnoremap <silent><buffer><expr> S        defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> dd       defx#do_action('remove', 'false')
  nnoremap <silent><buffer><expr> r        defx#do_action('rename')
  nnoremap <silent><buffer><expr> !        defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x        defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy       defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .        defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> h        defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> -        defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> _        defx#do_action('open_directory', getcwd())
  nnoremap <silent><buffer><expr> q        defx#do_action('quit')
  nnoremap <silent><buffer><expr> m        defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> t        defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> *        defx#do_action('clear_select_all')
  nnoremap <silent><buffer><expr> j        line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k        line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>    defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>    defx#do_action('print')
  nnoremap <silent><buffer><expr> cd       defx#do_action('change_vim_cwd')

	call defx#custom#column('filename', {
	      \ 'root_marker_highlight': 'Ignore',
	      \ })

endfunction

" hide [in]
call defx#custom#option('_', {
      \ 'root_marker': '',
      \ })

" nnoremap <silent><buffer><expr>  defx#do_action('repeat')
" augroup defx
"     au!
"     au VimEnter * sil! au! FileExplorer *
"     au BufEnter * if s:isdir(expand('%')) | bd | exe 'Defx' | endif
" augroup END

" fu! s:isdir(dir) abort
"     return !empty(a:dir) && (isdirectory(a:dir) ||
"        \ (!empty($SYSTEMDRIVE) && isdirectory('/'.tolower($SYSTEMDRIVE[0]).a:dir)))
" endfu
