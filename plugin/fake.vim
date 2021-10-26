finish

let g:fake_src_paths = ['/Users/Nil/.config/nvim/fake_src/']

call fake#define('sentense', 'fake#capitalize('
                        \ . 'join(map(range(fake#int(10,20)),"fake#gen(\"nonsense\")"))'
                        \ . ' . fake#chars(1,"..............!?"))')

call fake#define('paragraph', 'join(map(range(fake#int(3,10)),"fake#gen(\"sentense\")"))')
"" Alias
call fake#define('lipsum', 'fake#gen("paragraph")')
call fake#define('s', 'fake#gen("sentense")')
call fake#define('p', 'fake#gen("paragraph")')

call fake#define('cn', 'join(map(range(fake#int(10,100)),"fake#gen(\"chinese\")"), "")')
