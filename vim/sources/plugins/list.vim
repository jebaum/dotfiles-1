" CODE/TEXT MANIPULATION
Plug 'Chiel92/vim-autoformat'                                             " AutoFormat
Plug 'scrooloose/nerdcommenter'                                           " NERDCommenter
Plug 'tpope/vim-surround'                                                 " Surround
Plug 'godlygeek/tabular'                                                  " Tabular
Plug 'alcesleo/vim-uppercase-sql'                                         " vim-uppercase-sql
Plug 'yaroot/vissort'                                                     " Visual Block Sorting

" CODE/TEXT VIEWING
Plug 'osyo-manga/vim-anzu'                                                " Anzu
Plug 'Yggdroot/indentLine'                                                " indentLine
Plug 'inkarkat/vim-SyntaxRange'                                           " SyntaxRange
Plug 'romainl/vim-cool'                                                   " vim-cool

" git INTEGRATION
Plug 'tpope/vim-fugitive'                                                 " fugitive.vim
Plug 'airblade/vim-gitgutter'                                             " GitGutter
Plug 'Xuyuanp/nerdtree-git-plugin'                                        " NERDTree-Git

" HIGHLIGHTS / SYNTAX / INDENT FILES ...
Plug 'sheerun/vim-polyglot'                                               " Polyglot

"" ... FOR SPECIFIC LANGUAGES
Plug 'calviken/vim-gdscript3'                                             " GDScript | vim-gdscript
Plug 'plasticboy/vim-markdown'                                            " Markdown | vim-markdown
Plug 'vim-scripts/sh.vim'                                                 " sh/bash  | sh.vim
Plug 'shmup/vim-sql-syntax'                                               " SQL      | vim-sql-syntax

" IDE
Plug 'w0rp/ale'                                                           " ALE
Plug 'ludovicchabant/vim-gutentags'                                       " Gutentags
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}  " Markdown Preview
Plug 'scrooloose/nerdtree'                                                " NERDTree
Plug 'jistr/vim-nerdtree-tabs'                                            " NERDTree(Tabs)
Plug 'SirVer/ultisnips'                                                   " UltiSnips
Plug 'skywind3000/vim-preview'                                            " vim-preview
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }             " YouCompleteMe

" NAVIGATION, MOTION etc.
Plug 'bkad/camelcasemotion'                                               " CamelCaseMotion
Plug 'junegunn/fzf'                                                       " fzf
Plug 'junegunn/fzf.vim'                                                   " fzf.vim
Plug 'christoomey/vim-tmux-navigator'                                     " Tmux Navigator

" VIM FUNCTIONALITY
Plug 'othree/eregex.vim'                                                  " eregex.vim
Plug 'kshenoy/vim-signature'                                              " Signature
Plug 'christoomey/vim-system-copy'                                        " System Copy
Plug 'mbbill/undotree'                                                    " UndoTree
Plug 'shougo/vinarise.vim'                                                " Vinarise


" DEPENDENCES -------------------------
Plug 'vim-scripts/dbext.vim' , { 'for' : 'sql' }                          " dbext.vim   | for: YouCompleteMe with SQL
Plug 'inkarkat/vim-ingo-library'                                          " ingo-lirary | for: SyntaxRange
Plug 'tpope/vim-rhubarb'                                                  " rhubarb.vim | for: fugitive.vim
