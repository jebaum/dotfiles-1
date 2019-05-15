" CODE/TEXT MANIPULATION
Plug 'Chiel92/vim-autoformat'                                             " AutoFormat
Plug 'scrooloose/nerdcommenter'                                           " NERDCommenter
Plug 'tpope/vim-surround'                                                 " Surround
Plug 'godlygeek/tabular'                                                  " Tabular

" CODE/TEXT VIEWING
Plug 'osyo-manga/vim-anzu'                                                " Anzu
Plug 'sheerun/vim-polyglot'                                               " Polyglot
Plug 'inkarkat/vim-SyntaxRange'                                           " SyntaxRange

" IDE
Plug 'w0rp/ale'                                                           " ALE
Plug 'airblade/vim-gitgutter'                                             " GitGutter
Plug 'ludovicchabant/vim-gutentags'                                       " Gutentags
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}  " Markdown Preview
Plug 'SirVer/ultisnips'                                                   " UltiSnips
Plug 'skywind3000/vim-preview'                                            " vim-preview
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }             " YouCompleteMe

" NAVIGATION, MOTION etc.
Plug 'junegunn/fzf'                                                       " fzf
Plug 'junegunn/fzf.vim'                                                   " fzf.vim
Plug 'christoomey/vim-tmux-navigator'                                     " Tmux Navigator

" VIM FUNCTIONALITY
Plug 'kshenoy/vim-signature'                                              " Signature
Plug 'mbbill/undotree'                                                    " UndoTree
Plug 'shougo/vinarise.vim'                                                " Vinarise


" DEPENDENCES -------------------------
Plug 'vim-scripts/dbext.vim' , { 'for' : 'sql' }                          " dbext.vim   | for: YouCompleteMe with SQL
Plug 'inkarkat/vim-ingo-library'                                          " ingo-lirary | for: SyntaxRange
