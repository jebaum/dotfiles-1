"-------------------------------------------------------------------------------
" PLUGINS - VARIABLES
"-------------------------------------------------------------------------------

let g:NERDSpaceDelims                        = 1
let g:NERDCommentEmptyLines                  = 1
let g:vim_markdown_new_list_item_indent      = 2
let g:SignatureMarkTextHLDynamic             = 1
let g:Illuminate_delay                       = 0
let g:ophigh_highlight_link_group            = 1

" AutoFormat
let b:formatdef_custom_c                     = '"astyle --style=kr -s4 -N -S -xG -xU -f -k3 -xj -p"'

let b:formatters_c                           = ['custom_c']
let b:formatters_cpp                         = ['custom_c']

" NERDTree
let g:nerdtree_tabs_open_on_console_startup  = 1
let g:nerdtree_tabs_smart_startup_focus      = 2
let g:NERDTreeWinPos                         = "right"

" Syntastic
let g:syntastic_always_populate_loc_list     = 1
let g:syntastic_c_include_dirs               = ['/usr/local/vitasdk/arm-vita-eabi/include','/usr/include','include']
let g:syntastic_check_on_open                = 1
let g:syntastic_check_on_wq                  = 0
let g:syntastic_enable_highlighting          = 0
let g:syntastic_mode_map                     = { 'passive_filetypes': ['c', 'h', 'cpp', 'hpp'] }
let g:syntastic_shell                        = "/bin/bash"

" UltiSnips
let g:UltiSnipsEditSplit                     = "context"
let g:UltiSnipsExpandTrigger                 = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger           = "<C-k>"
let g:UltiSnipsJumpForwardTrigger            = "<C-j>"
let g:UltiSnipsListSnippets                  = "<C-k>"
let g:UltiSnipsSnippetDirectories            = ['~/.vim/UltiSnips', 'UltiSnips']

" UndoTree
let g:undotree_SetFocusWhenToggle            = 1
let g:undotree_ShortIndicators               = 1
let g:undotree_SplitWidth                    = 32


" SET BY AUTOCMD ---------------------------------------------------------------

autocmd FileType man let g:nerdtree_tabs_open_on_console_startup=0 " Not open NERDTree in man pages
