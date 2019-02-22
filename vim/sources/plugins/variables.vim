let g:gitgutter_max_signs                    = 5000
let g:gutentags_cache_dir                    = $HOME."/.vim/cache/tags"

" ALE
let g:ale_c_parse_makefile                   = 1
let g:ale_set_highlights                     = 0
let g:ale_set_quickfix                       = 1
let g:ale_sign_column_always                 = 1
let g:ale_sign_column_always                 = 1

" AutoFormat
let b:formatdef_custom_c                     = '"astyle --style=kr -s4 -N -S -xG -xU -f -k3 -xj -p"'
let b:formatdef_custom_css                   = '"css-beautify"'
let b:formatdef_custom_html                  = '"html-beautify"'
let b:formatters_c                           = ['custom_c']
let b:formatters_cpp                         = ['custom_c']
let b:formatters_css                         = ['custom_css']
let b:formatters_html                        = ['custom_html']

" eregex.vim
let g:eregex_default_enable                  = 0
let g:eregex_force_case                      = 1

" Localvimrc
let g:localvimrc_ask                         = 0
let g:localvimrc_persistent                  = 1

" NERDCommenter
let g:NERDCommentEmptyLines                  = 1
let g:NERDSpaceDelims                        = 1

" NERDTree
let g:nerdtree_tabs_open_on_console_startup  = 1
let g:nerdtree_tabs_smart_startup_focus      = 2
let g:NERDTreeWinPos                         = "right"

" Polyglot
let g:python_highlight_space_errors          = 0
let g:polyglot_disabled                      = ['markdown']

" Signature
let g:SignatureForceRemoveGlobal             = 1
let g:SignatureForceRemoveLocal              = 1
let g:SignatureMarkTextHLDynamic             = 1

" System Copy
let g:system_copy#copy_command               = 'xclip -sel clipboard'
let g:system_copy#paste_command              = 'xclip -sel clipboard -o'

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

" Vim Markdown
let g:vim_markdown_conceal                   = 0
let g:vim_markdown_new_list_item_indent      = 2
