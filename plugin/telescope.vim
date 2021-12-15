lua require('plugins.config.telescope')

nnoremap <silent>sf :lua require('plugins.config.telescope').project_files()<cr>
nnoremap <silent>s; :lua require('plugins.config.telescope_ghq').list(require('telescope.themes').get_dropdown({ layout_config = { width = 80, height = 0.7 } }))<cr>
nnoremap <silent>so :Telescope oldfiles<cr>
nnoremap <silent>sl :Telescope current_buffer_fuzzy_find<cr>
nnoremap <silent>sg :Telescope live_grep<cr>
nnoremap <silent>sw :Telescope grep_string<cr>
nnoremap <silent>sb :Telescope buffers<cr>
nnoremap <silent>sq :Telescope quickfix<cr>
nnoremap <silent>sc :Telescope commands<cr>
nnoremap <silent>sn :Telescope node_modules list<cr>
nnoremap <silent>sr :Telescope resume<cr>
" same as zsh ^t(show tmux sessions using fzf)
nnoremap <silent><C-t> :lua require('plugins.config.telescope_tmux').sessions()<cr>

" TODO
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
