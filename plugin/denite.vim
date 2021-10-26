if &runtimepath !~ 'denite'
  finish
endif
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#option('_', {
      \ 'start-filter': 1,
      \ 'split': 'floating',
      \ 'prompt': 'λ',
      \ 'no-empty': 1,
      \ 'statusline': 0,
      \ 'auto-resume': 1,
      \ })
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])
" filter by path for grep result
call denite#custom#source('grep', 'converters', ['converter/abbr_word'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/*', '*.pyc', 'node_modules/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/', '*.png'])

nnoremap <silent>sf :Denite file/rec<cr>
nnoremap <silent>sl :Denite line<cr>
nnoremap <silent>sd :Denite -resume<cr>
nnoremap <silent>sg :Denite grep<cr>
nnoremap <silent>sw :Denite grep -input=<c-r><c-w><cr>
nnoremap <silent>sb :Denite buffer<cr>
nnoremap <silent>sm :Denite file_mru<cr>
nnoremap <silent>ss :<c-u>set operatorfunc=GrepOperator<cr>g@
vnoremap <silent>ss :<c-u>call GrepOperator(visualmode())<cr>

" autocmd FileType denite call s:denite_normal_settings()
autocmd FileType denite-filter call s:denite_filter_settings()


" function! s:denite_normal_settings() abort
"   nnoremap <silent><buffer><expr> s denite#do_map('quit')
" endfunction

function! s:denite_filter_settings()
  inoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
endfunction

" call denite#custom#kind('_', 'default_action', 'tabswitch')

function! GrepOperator(type)
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    execute "Denite grep -input=" . @@
endfunction

