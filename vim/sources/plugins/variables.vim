"-------------------------------------------------------------------------------
" PLUGINS - VARIABLES
"-------------------------------------------------------------------------------

let g:Illuminate_delay                       = 0
let g:ophigh_highlight_link_group            = 1

" AutoFormat
let b:formatdef_custom_c                     = '"astyle --style=kr -s4 -N -S -xG -xU -f -k3 -xj -p"'
let b:formatters_c                           = ['custom_c']
let b:formatters_cpp                         = ['custom_c']

" NERDCommenter
let g:NERDCommentEmptyLines                  = 1
let g:NERDSpaceDelims                        = 1

" NERDTree
let g:nerdtree_tabs_open_on_console_startup  = 1
let g:nerdtree_tabs_smart_startup_focus      = 2
let g:NERDTreeWinPos                         = "right"

" Polyglot
let g:python_highlight_space_errors          = 0
let g:vim_markdown_new_list_item_indent      = 2

" Signature
let g:SignatureForceRemoveGlobal             = 1
let g:SignatureForceRemoveLocal = 1
let g:SignatureMarkTextHLDynamic             = 1

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
