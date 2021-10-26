command! Bd :bp | :sp | :bn | :bd " Close buffer without closing window.

command! -nargs=1 Vo call s:AddVocabulary(<q-args>)
function! s:AddVocabulary(word)
  execute 'silent !echo ' . a:word . ' >> ~/wiki/english/vocabulary.md'
  redraw!
endfunction

function! s:remember(command)
  execute a:command
  " Or save it to a file for persistence
  let g:prev_command = a:command
endfunction

command! -nargs=* Remember call s:remember(<q-args>)
command! Redo execute g:prev_command
command! Inspect call funcs#synstack()

command! Dot execute "!chezmoi add %"

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
