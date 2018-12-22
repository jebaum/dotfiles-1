" Backups etc.
set backup                           " Enable backup files
set backupdir=~/.vimtmp/backup/      " Directory for backup files
set noswapfile                       " Disable swap file
set undodir=~/.vimtmp/undo/          " Directory for undo files
set undofile                         " Enable undo files

" Looks
set background=dark                  " Dark background (needed for proper colors)
set colorcolumn=+1                   " Highlight 81st column
set cursorcolumn                     " Current column highlight
set cursorline                       " Current line highlight
set listchars=""                     " Helps with vim-indentguides - no $ at the end of lines
set scrolloff=5                      " Minimal number of screen lines to keep above and below the cursor
set t_Co=256                         " 256 color support

" Searching
set hlsearch                         " Search highlight
set ignorecase                       " Ignoring case of letters while searching
set incsearch                        " Do incremental searching
set smartcase                        " If searching with capital letter then use match case

" UI
set completeopt-=preview             " Disable preview window for completeopt // for: YCM
set laststatus=2                     " To always display status line
set number                           " Enable line numbers
set showcmd                          " Display incomplete commands
set splitbelow                       " New windows open on right when split verticaly
set splitright                       " New windows open on right when split horizontaly
set wildmenu                         " Menu for command line completion

" Wraping
set linebreak                        " Don't break words while warping lines
set nowrap                           " Do not wrap lines on default

" OTHER
set backspace=indent,eol,start       " Allow backspacing over everything in insert mode
set history=50                       " Keep 50 lines of command line history
set modeline                         " Enable modelines
set nrformats=                       " Ignore non-DEC numeral systems when in- or decrementing with <C-a>/<C-x>
set omnifunc=syntaxcomplete#Complete " Omnifunc
set textwidth=80                     " Set default textwidth to 80 columns
