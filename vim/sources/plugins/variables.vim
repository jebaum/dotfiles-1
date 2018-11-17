"-------------------------------------------------------------------------------
" PLUGINS - VARIABLES
"-------------------------------------------------------------------------------

let g:ale_set_highlights                            = 0                                             " ALE                     - disable highlight
let g:ale_sign_column_always                        = 1                                             " ALE                     - sing column always visible
let g:NERDSpaceDelims                               = 1                                             " NERDCommenter           - add space after comment delimiters
let g:NERDCommentEmptyLines                         = 1                                             " NERDCommenter           - allow commenting empty lines
let g:vim_markdown_new_list_item_indent             = 2                                             " Polyglot > vim-markdown - change list indent
let g:SignatureMarkTextHLDynamic                    = 1                                             " Signature               - git gutter compability
let g:Illuminate_delay                              = 0                                             " vim-illuminate          - time delay in milliseconds
let g:ophigh_highlight_link_group                   = 1                                             " vim-operator-highlight  - add highlight group

" NERDTree
let g:NERDTreeWinPos                                = "right"                                       " Always on right side
let g:nerdtree_tabs_smart_startup_focus             = 2                                             " Always focus file window after startup
let g:nerdtree_tabs_autofind                        = 1                                             " Automatically find and select currently opened file
let g:nerdtree_tabs_open_on_console_startup         = 1                                             " Open on startup

" UltiSnips
let g:UltiSnipsEditSplit                            = "context"                                     " :UltiSnipsEdit splits window instead of taking over it
let g:UltiSnipsExpandTrigger                        = '<C-j>'                                       " Custom expand key to work with YCM
let g:UltiSnipsSnippetDirectories                   = ['$HOME/dotfiles/vim/UltiSnips', 'UltiSnips'] " Set dafault directory for snippets
let g:UltiSnipsListSnippets                         = "<C-k>"                                       " List maching snippets

" UndoTree
let g:undotree_SetFocusWhenToggle                   = 1
let g:undotree_ShortIndicators                      = 1
let g:undotree_SplitWidth                           = 32

" YouCompleteMe
let g:ycm_add_preview_to_completeopt                = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files       = 1
let g:ycm_complete_in_comments                      = 1
let g:ycm_complete_in_strings                       = 1
let g:ycm_global_ycm_extra_conf                     = '$HOME/dotfiles/vim/ycm_extra_conf.py'
let g:ycm_key_list_stop_completion                  = ['<C-y>']
let g:ycm_max_num_candidates                        = 20
let g:ycm_min_num_of_chars_for_completion           = 2
let g:ycm_show_diagnostics_ui                       = 0

let g:ycm_filetype_blacklist = {
            \ 'tagbar': 1,
            \ 'qf': 1,
            \ 'notes': 1,
            \ 'unite': 1,
            \ 'vimwiki': 1,
            \ 'pandoc': 1,
            \ 'infolog': 1,
            \ 'mail': 1,
            \}

let g:ycm_semantic_triggers = {
            \   'c' : ['->', '.','re![_a-zA-z0-9]'],
            \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s', 're!\[.*\]\s'],
            \   'ocaml' : ['.', '#'],
            \   'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::'],
            \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \ }
