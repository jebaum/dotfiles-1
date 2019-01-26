"-------------------------------------------------------------------------------
" PLUGINS - VARIABLES
"-------------------------------------------------------------------------------

let g:NERDSpaceDelims                       = 1                                 " NERDCommenter           - add space after comment delimiters
let g:NERDCommentEmptyLines                 = 1                                 " NERDCommenter           - allow commenting empty lines
let g:vim_markdown_new_list_item_indent     = 2                                 " Polyglot > vim-markdown - change list indent
let g:SignatureMarkTextHLDynamic            = 1                                 " Signature               - git gutter compability
let g:Illuminate_delay                      = 0                                 " vim-illuminate          - time delay in milliseconds
let g:ophigh_highlight_link_group           = 1                                 " vim-operator-highlight  - add highlight group

" AutoFormat
let b:formatdef_custom_c                    = '"astyle --style=kr -s4 -N -S -xG -xU -f -k3 -xj -p"'

let b:formatters_c                          = ['custom_c']
let b:formatters_cpp                        = ['custom_c']

" NERDTree
let g:nerdtree_tabs_open_on_console_startup = 1                                 " Open on startup
let g:nerdtree_tabs_smart_startup_focus     = 2                                 " Always focus file window after startup
let g:NERDTreeWinPos                        = "right"                           " Always on right side

" Syntastic
let g:syntastic_c_include_dirs = ['/usr/local/vitasdk/arm-vita-eabi/include','/usr/include','include']
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_shell = "/bin/bash"

" UltiSnips
let g:UltiSnipsEditSplit                    = "context"                         " :UltiSnipsEdit splits window instead of taking over it
let g:UltiSnipsExpandTrigger                = "<C-j>"                           " Custom expand key to work with YCM
let g:UltiSnipsJumpBackwardTrigger          = "<C-k>"                           " As variable suggests
let g:UltiSnipsJumpForwardTrigger           = "<C-j>"                           " As variable suggests
let g:UltiSnipsListSnippets                 = "<C-k>"                           " List maching snippets
let g:UltiSnipsSnippetDirectories           = ['~/.vim/UltiSnips', 'UltiSnips'] " Set dafault directory for snippets

" UndoTree
let g:undotree_SetFocusWhenToggle           = 1
let g:undotree_ShortIndicators              = 1
let g:undotree_SplitWidth                   = 32
