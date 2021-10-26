" https://www.reddit.com/r/vim/comments/dj37wt/plugin_for_conventional_commits/

nnoremap    <buffer> i  i<C-r>=<sid>commit_type()<CR>

fun! s:commit_type()
  call complete(1, ['feat: ', 'fix: ', 'refactor: ', 'docs: ', 'test: ', 'chore: ', 'BREAKING CHANGE: '])
  nunmap <buffer> i
  return ''
endfun
