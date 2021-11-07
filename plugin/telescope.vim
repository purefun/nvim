if &runtimepath !~ 'telescope'
  finish
endif

lua require('plugins.config.telescope')

" nnoremap <silent>sf :Telescope find_files<cr>
" nnoremap <silent>sf :lua require('telescope.builtin').git_files()<CR>
" nnoremap <silent>sp :lua require('telescope.builtin').find_files()<CR>
nnoremap <silent>so :Telescope oldfiles<cr>
nnoremap <silent>sl :Telescope current_buffer_fuzzy_find<cr>
nnoremap <silent>sg :Telescope live_grep<cr>
nnoremap <silent>sw :Telescope grep_string<cr>
nnoremap <silent>sb :Telescope buffers<cr>
nnoremap <silent>sq :Telescope quickfix<cr>
nnoremap <silent>sc :Telescope commands<cr>
nnoremap <silent>se :Telescope tmux windows<cr>
" nnoremap <silent>sp :Telescope tmux sessions<cr>
nnoremap <silent>sn :Telescope node_modules list<cr>

" TODO
" nnoremap <silent>sd :Denite -resume<cr>
" nnoremap <silent>ss :<c-u>set operatorfunc=GrepOperator<cr>g@
" vnoremap <silent>ss :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    execute lua require('telescope.builtin').help_tags()<cr>

    " execute "Telescope grep_string " . @@
endfunction
