let mapleader=" "

" swap ; and :
" nnoremap : ;
" nnoremap ; :
" vnoremap : ;
" vnoremap ; :

nnoremap <leader><Tab> :b#<cr>
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>
nnoremap <leader>nn :nohl<cr>

nnoremap <leader>nb :bnext<cr>
nnoremap <leader>pb :bprevious<cr>
nnoremap <leader>nc :cnext<cr>
nnoremap <leader>pc :cprevious<cr>
nnoremap <leader>nl :lnext<cr>
nnoremap <leader>pl :lprevious<cr>
nnoremap <leader>x :Defx ~/.notes<CR>
nnoremap <leader>et :vs ~/.config/nvim/lua/mytheme.lua<CR>

" save buffer
" TODO remove ! when https://github.com/nvim-treesitter/nvim-treesitter/issues/1004 fixed
nnoremap <silent> <C-S>    :w!<CR>
vnoremap <silent> <C-S>   <C-C>:w!<CR>
inoremap <silent> <C-S>   <C-C>:w!<CR>

inoremap <silent> <C-c> <ESC>

" search visual
vnoremap // y/<C-r>"<cr>

" terminal
tnoremap <Esc> <C-\><C-n>

" move lines
" vnoremap J :m '>+1<CR>gv=gv
" vnoremap K :m '<-2<CR>gv=gv

