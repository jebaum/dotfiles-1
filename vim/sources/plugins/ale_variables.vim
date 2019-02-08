"-------------------------------------------------------------------------------
" PLUGINS - ALE VARIABLES
"-------------------------------------------------------------------------------

let g:ale_c_parse_compile_commands = 1
let g:ale_c_parse_makefile         = 1
let g:ale_set_highlights           = 0
let g:ale_set_quickfix             = 1
let g:ale_sign_column_always       = 1
let g:ale_sign_column_always       = 1


" LINTERS OPTIONS --------------------------------------------------------------

let g:ale_c_gcc_options   = "-std=gnu11 -Wall -Wextra -Wno-sign-compare"
let g:ale_cpp_gcc_options = "-std=c++11 -Wall -Wextra -Wno-sign-comparea"
