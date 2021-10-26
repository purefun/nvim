runtime init/options.vim
runtime init/sensible.vim
runtime init/plugins.vim
runtime init/colorscheme.vim
runtime init/commands.vim
runtime init/maps.vim

lua require('init')

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
augroup END

" autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path %
