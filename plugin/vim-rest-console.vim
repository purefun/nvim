" let g:vrc_debug = 1
" let g:vrc_show_command = 1
let g:vrc_horizontal_split = 1
let g:vrc_split_request_body = 1
let g:vrc_response_default_content_type = 'application/json'
let g:vrc_auto_format_response_enabled = 1
let g:vrc_auto_format_response_patterns = {
      \ 'json': 'jq',
      \}

let g:vrc_curl_opts = {
      \ '-s': '',
      \ '-i': '',
      \}
