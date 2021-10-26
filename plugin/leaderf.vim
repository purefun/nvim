if &runtimepath !~ 'LeaderF'
  finish
endif

let g:Lf_WindowPosition = 'popup'
let g:Lf_PopupHeight = 0.6
let g:Lf_HideHelp = 1
let g:Lf_PopupShowStatusline = 0
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_PopupShowFoldcolumn = 0
let g:Lf_DevIconsFont = 'Hack Nerd Font Mono'
let g:Lf_HighlightIndividual = 0
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_CommandMap = {
\   '<C-k>': ['<C-p>'],
\   '<C-j>': ['<C-n>'],
\   '<F5>': ['<C-e>'],
\}

nnoremap <silent>sf :<C-u>Leaderf file<CR>
nnoremap <silent>so :Leaderf mru<CR>
nnoremap <silent>sg :Leaderf rg<CR>
nnoremap <silent>si :LeaderfRgInteractive<CR>
nnoremap <silent>sw :Leaderf rg --cword<CR>
nnoremap <silent>sb :LeaderfBufferAll<CR>
nnoremap <silent>sd :LeaderfRgRecall<CR>

nnoremap <silent>ss :<c-u>set operatorfunc=GrepOperator<cr>g@
vnoremap <silent>ss :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    execute "Leaderf rg " . @@
endfunction
