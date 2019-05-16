" DOWNLOAD VIM-PLUG (if is not installed) --------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl --create-dirs -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" INSTALL PLUGINS (via Plug) ---------------------------------------------------

call plug#begin('~/.vim/bundle')
Plug 'w0rp/ale'                       " ALE
Plug 'ludovicchabant/vim-gutentags'   " Gutentags
Plug 'scrooloose/nerdcommenter'       " NERDCommenter
Plug 'sheerun/vim-polyglot'           " Polyglot
Plug 'tpope/vim-surround'             " Surround
Plug 'godlygeek/tabular'              " Tabular
Plug 'christoomey/vim-tmux-navigator' " Tmux Navigator
Plug 'SirVer/ultisnips'               " UltiSnips
Plug 'mbbill/undotree'                " UndoTree
call plug#end()


" HIGHLIGHTS -------------------------------------------------------------------

hi  jsObjectProp            ctermfg=yellow
hi  StatusLine_ALE_Error    ctermbg=197      ctermfg=black
hi  StatusLine_ALE_Warning  ctermbg=208      ctermfg=black


" COMMANDS ---------------------------------------------------------------------

command -range TabularizeBySpace execute '<line1>,<line2>Tabularize /\S\+/l1'


" MAPPINGS ---------------------------------------------------------------------

nmap s ysiw
noremap <leader><F1> :UndotreeToggle<CR>
vmap s S


" VARIABLES --------------------------------------------------------------------

let g:ale_c_parse_makefile                   = 1                                  "  ALE
let g:ale_set_highlights                     = 0                                  "  ALE
let g:ale_set_quickfix                       = 1                                  "  ALE
let g:gutentags_cache_dir                    = $HOME."/.vim/cache/tags"           "  Gutentags
let g:NERDCommentEmptyLines                  = 1                                  "  NERDCommenter
let g:NERDSpaceDelims                        = 1                                  "  NERDCommenter
let g:python_highlight_space_errors          = 0                                  "  Polyglot
let g:vim_markdown_new_list_item_indent      = 0                                  "  Polyglot
let g:UltiSnipsEditSplit                     = "context"                          "  UltiSnips
let g:UltiSnipsExpandTrigger                 = "<C-j>"                            "  UltiSnips
let g:UltiSnipsJumpBackwardTrigger           = "<C-k>"                            "  UltiSnips
let g:UltiSnipsJumpForwardTrigger            = "<C-j>"                            "  UltiSnips
let g:UltiSnipsListSnippets                  = "<C-k>"                            "  UltiSnips
let g:UltiSnipsSnippetDirectories            = ['~/.vim/UltiSnips', 'UltiSnips']  "  UltiSnips
let g:undotree_SetFocusWhenToggle            = 1                                  "  UndoTree
let g:undotree_ShortIndicators               = 1                                  "  UndoTree
let g:undotree_SplitWidth                    = 28                                 "  UndoTree
