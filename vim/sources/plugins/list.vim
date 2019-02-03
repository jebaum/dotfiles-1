" CODE/TEXT MANIPULATION
Plug 'Chiel92/vim-autoformat'                                             " AutoFormat
Plug 'scrooloose/nerdcommenter'                                           " NERDCommenter
Plug 'tpope/vim-surround'                                                 " Surround
Plug 'godlygeek/tabular'                                                  " Tabular
Plug 'alcesleo/vim-uppercase-sql'                                         " vim-uppercase-sql
Plug 'yaroot/vissort'                                                     " Visual Block Sorting

" CODE/TEXT VIEWING
Plug 'osyo-manga/vim-anzu'                                                " Anzu
Plug 'RRethy/vim-illuminate'                                              " Illuminate
Plug 'Yggdroot/indentLine'                                                " indentLine
Plug 'inkarkat/vim-SyntaxRange'                                           " SyntaxRange
Plug 'romainl/vim-cool'                                                   " vim-cool

" git INTEGRATION
Plug 'tpope/vim-fugitive'                                                 " fugitive.vim
Plug 'airblade/vim-gitgutter'                                             " GitGutter
Plug 'Xuyuanp/nerdtree-git-plugin'                                        " NERDTree-Git

" IDE
Plug 'w0rp/ale'                                                           " ALE
Plug 'ludovicchabant/vim-gutentags'                                       " Gutentags
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}  " Markdown Preview
Plug 'scrooloose/nerdtree'                                                " NERDTree
Plug 'jistr/vim-nerdtree-tabs'                                            " NERDTree(Tabs)
Plug 'chrisbra/nrrwrgn'                                                   " NrrwRgn
Plug 'junegunn/vim-peekaboo'                                              " Peekaboo
Plug 'kshenoy/vim-signature'                                              " Signature
Plug 'SirVer/ultisnips'                                                   " UltiSnips
Plug 'mbbill/undotree'                                                    " UndoTree
Plug 'skywind3000/vim-preview'                                            " vim-preview
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }             " YouCompleteMe

" NAVIGATION, MOTION etc.
Plug 'bkad/camelcasemotion'                                               " CamelCaseMotion
Plug 'junegunn/fzf'                                                       " fzf
Plug 'junegunn/fzf.vim'                                                   " fzf.vim
Plug 'christoomey/vim-tmux-navigator'                                     " Tmux Navigator

" HIGHLIGHTS / SYNTAX FILES ...
Plug 'sheerun/vim-polyglot'                                               " Polyglot
Plug 'Valloric/vim-operator-highlight'                                    " vim-operator-highlight

"" ... FOR SPECIFIC LANGUAGES
Plug 'calviken/vim-gdscript3'                                             " GDScript | vim-gdscript
Plug 'shmup/vim-sql-syntax'                                               " SQL      | vim-sql-syntax

" DEPENDENCES -------------------------
Plug 'vim-scripts/dbext.vim'                                              " dbext.vim   | for: YouCompleteMe with SQL
Plug 'inkarkat/vim-ingo-library'                                          " ingo-lirary | for: SyntaxRange
Plug 'tpope/vim-rhubarb'                                                  " rhubarb.vim | for: fugitive.vim
