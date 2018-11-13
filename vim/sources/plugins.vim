
"-----------------------------------------------------------------------------
" DOWNLOAD VIM-PLUG (if is not installed)
"-----------------------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl --create-dirs -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"-----------------------------------------------------------------------------
" FUNCTIONS
"-----------------------------------------------------------------------------

" Build YouCompleteMe - for Plug
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./install.py --clang-completer --java-completer
    endif
endfunction

" Build YouCompleteMe
function! BuildYCM_manual()
    !~/.vim/bundle/YouCompleteMe/install.py --clang-completer --java-completer
endfunction


"-----------------------------------------------------------------------------
" INSTALL PLUGINS (Plug)
"-----------------------------------------------------------------------------

call plug#begin('~/.vim/bundle')
execute 'source ' . '$HOME/dotfiles/vim/plugins_list.vim'
call plug#end()


"-----------------------------------------------------------------------------
" VARIABLES ------------------------------------------------------------------
"-----------------------------------------------------------------------------

let g:ale_set_highlights                    = 0                                 " ALE                     - disable highlight
let g:ale_set_quickfix                      = 1                                 " ALE                     - enable quicklist
let g:ale_sign_column_always                = 1                                 " ALE                     - sing column always visible
let g:NERDSpaceDelims                       = 1                                 " NERDCommenter           - add space after comment delimiters
let g:NERDCommentEmptyLines                 = 1                                 " NERDCommenter           - allow commenting empty lines
let g:NERDTreeWinPos                        = "right"                           " NERDTree                - always on right side
let g:nerdtree_tabs_smart_startup_focus     = 2                                 " NERDTree(Tabs)          - always focus file window after startup
let g:nerdtree_tabs_open_on_console_startup = 1                                 " NERDTree(Tabs)          - open on startup
let g:vim_markdown_new_list_item_indent     = 2                                 " Polyglot > vim-markdown - change list indent
let g:SignatureMarkTextHLDynamic            = 1                                 " Signature               - git gutter compability
let g:UltiSnipsEditSplit                    = "context"                         " UltiSnips               - :UltiSnipsEdit splits window instead of taking over it
let g:UltiSnipsExpandTrigger                = '<C-j>'                           " UltiSnips               - custom expand key to work with YCM
let g:UltiSnipsSnippetDirectories           = ['~/.vim/UltiSnips', 'UltiSnips'] " UltiSnips               - set dafault directory for snippets
let g:undotree_SetFocusWhenToggle           = 1                                 " undotree                - autofocus
let g:undotree_ShortIndicators              = 1                                 " undotree                - short time indicators
let g:undotree_SplitWidth                   = 32                                " undotree                - window width
let g:Illuminate_delay                      = 0                                 " vim-illuminate          - time delay in milliseconds
let g:ophigh_highlight_link_group           = 1                                 " vim-operator-highlight  - add highlight group

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


"-----------------------------------------------------------------------------
" AUTOCMD --------------------------------------------------------------------
"-----------------------------------------------------------------------------

autocmd FileType agit NERDTreeClose    " Fix for Agit and NERDTree
autocmd BufEnter * SignatureRefresh    " Fix for Signature and gitgutter
autocmd InsertEnter * SignatureRefresh " Fix for Signature and gitgutter
autocmd VimEnter * VSO i               " Vissort - case insensivity



"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------
" PACKAGES
"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------

packadd matchit
packadd termdebug
