let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_mode='i'
let g:user_emmet_install_global = 0
let g:user_emmet_settings={
\  'javascript.jsx' : {
\    'extends': 'jsx',
\    'ignore_embeded_filetype': 1,
\    'attribute_name': {'class': 'className', 'for': 'htmlFor'},
\    'empty_element_suffix': ' />',
\  },
\}

" autocmd FileType html,css,javascript.jsx EmmetInstall
