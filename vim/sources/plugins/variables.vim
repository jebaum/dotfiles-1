"-------------------------------------------------------------------------------
" PLUGINS - VARIABLES
"-------------------------------------------------------------------------------

let g:ale_set_highlights                    = 0                                 " ALE                     - disable highlight
let g:ale_sign_column_always                = 1                                 " ALE                     - sing column always visible
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

" UltiSnips
let g:UltiSnipsEditSplit                    = "context"                         " :UltiSnipsEdit splits window instead of taking over it
let g:UltiSnipsExpandTrigger                = "<C-i>"                           " Custom expand key to work with YCM
let g:UltiSnipsJumpBackwardTrigger          = "<C-k>"                           " As variable suggests
let g:UltiSnipsJumpForwardTrigger           = "<C-i>"                           " As variable suggests
let g:UltiSnipsListSnippets                 = "<C-k>"                           " List maching snippets
let g:UltiSnipsSnippetDirectories           = ['~/.vim/UltiSnips', 'UltiSnips'] " Set dafault directory for snippets

" UndoTree
let g:undotree_SetFocusWhenToggle           = 1
let g:undotree_ShortIndicators              = 1
let g:undotree_SplitWidth                   = 32
