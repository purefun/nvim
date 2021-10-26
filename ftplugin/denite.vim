setlocal signcolumn=no cursorline nu

nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
nnoremap <silent><buffer><expr> i    denite#do_map('open_filter_buffer')
nnoremap <silent><buffer><expr> /    denite#do_map('open_filter_buffer')
nnoremap <silent><buffer><expr> dd   denite#do_map('do_action', 'delete')
nnoremap <silent><buffer><expr> p    denite#do_map('do_action', 'preview')
nnoremap <silent><buffer><expr> st   denite#do_map('do_action', 'tabopen')
nnoremap <silent><buffer><expr> sg   denite#do_map('do_action', 'vsplit')
nnoremap <silent><buffer><expr> sv   denite#do_map('do_action', 'split')
nnoremap <silent><buffer><expr> '    denite#do_map('quick_move')
nnoremap <silent><buffer><expr> q    denite#do_map('quit')
nnoremap <silent><buffer><expr> <C-c>    denite#do_map('quit')
nnoremap <silent><buffer><expr> r    denite#do_map('redraw')
nnoremap <silent><buffer><expr> yy   denite#do_map('do_action', 'yank')
nnoremap <silent><buffer><expr> <Esc>   denite#do_map('quit')
nnoremap <silent><buffer><expr> <Tab>   denite#do_map('choose_action')
nnoremap <silent><buffer><expr><nowait> <Space> denite#do_map('toggle_select').'j'
