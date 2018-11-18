"-------------------------------------------------------------------------------
" PLUGINS - YouCompleteMe VARIABLES
"-------------------------------------------------------------------------------

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
            \   'cpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::'],
            \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \ }
