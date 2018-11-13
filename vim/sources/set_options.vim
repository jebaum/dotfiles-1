set background=dark                  " Dark background (needed for proper colors)
set backspace=indent,eol,start       " Allow backspacing over everything in insert mode
set colorcolumn=+1                   " Highlight 81st column
set cursorcolumn                     " Current column highlight
set cursorline                       " Current line highlight
set history=50                       " Keep 50 lines of command line history
set hlsearch                         " Search highlight
set ignorecase                       " Ignoring case of letters while searching
set incsearch                        " Do incremental searching
set laststatus=2                     " To always display status line
set linebreak                        " Don't break words while warping lines
set listchars=""                     " Helps with vim-indentguides - no $ at the end of lines
set modeline                         " Enable modelines
set nostartofline                    " Cursor is kept in the same column (if possible)
set noswapfile                       " Disable swap file
set nowrap                           " Do not wrap lines on default
set nrformats=                       " Ignore non-DEC numeral systems when in- or decrementing with <C-a>/<C-x>
set number                           " Enable line numbers
set omnifunc=syntaxcomplete#Complete " Omnifunc
set ruler                            " Show the cursor position all the time
set scrolloff=5                      " Minimal number of screen lines to keep above and below the cursor
set showcmd                          " Display incomplete commands
set smartcase                        " If searching with capital letter then use match case
set splitbelow                       " New windows open on right when split verticaly
set splitright                       " New windows open on right when split horizontaly
set t_Co=256                         " 256 color support
set textwidth=80                     " Set default textwidth to 80 columns
set viewoptions-=options,folds       " View options
set wildmenu                         " Menu for command line completion
