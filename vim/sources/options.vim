" Backup, undo and swap
set backup                                                                  " Enable backup files
set backupdir=~/.vim/cache/backup/                                          " Directory for backup files
set noswapfile                                                              " Disable swap files
set undodir=~/.vim/cache/undo/                                              " Directory for undo files
set undofile                                                                " Enable undo files

" Indentation
set autoindent                                                              " Enable automatic indenting
set cindent                                                                 " Automatic C program indenting
set expandtab                                                               " Use spaces instead of tabs
set shiftround                                                              " Always indent/outdent to the nearest tabstop
set shiftwidth=4                                                            " Indent/outdent by 4 columns
set smartindent                                                             " Smart indention
set softtabstop=4                                                           " Unify tabs and spaces
set tabstop=4                                                               " Tab spacing

" NETRW
let g:netrw_banner        = 0                                               " Do not display info on the top of window
let g:netrw_browse_split  = 4                                               " Use the previous window to open file
let g:netrw_list_hide     = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'  " Do not show hidden files
let g:netrw_liststyle     = 3                                               " Tree-view
let g:netrw_sort_sequence = '[\/]$,*'                                       " Sort is affecting only: directories on the top, files below
let g:netrw_winsize       = -28                                             " Absolute width of netrw window

" Searching
set hlsearch                                                                " Search highlight
set ignorecase                                                              " Ignoring case of letters while searching
set incsearch                                                               " Do incremental searching
set smartcase                                                               " If searching with capital letter then use match case

" UI
set colorcolumn=81                                                          " Highlight column 81
set completeopt-=preview                                                    " Disable preview window for completeopt // for: YCM
set cursorline                                                              " Current line highlight
set laststatus=2                                                            " To always display status line
set number                                                                  " Enable line numbers
set scrolloff=5                                                             " Minimal number of screen lines to keep above and below the cursor
set showcmd                                                                 " Display incomplete commands
set splitbelow                                                              " New windows open on right when split verticaly
set splitright                                                              " New windows open on right when split horizontaly
set t_Co=256                                                                " 256 color support
set wildmenu                                                                " Menu for command line completion

" OTHER
let g:tex_flavor = 'tex'                                                    " Default TeX dialect
set backspace=indent,eol,start                                              " Allow backspacing over everything in insert mode
set history=50                                                              " Keep 50 lines of command line history
set linebreak                                                               " Don't break words while wraping lines
set modeline                                                                " Enable modelines
set nowrap                                                                  " Do not wrap lines on default
set nrformats=                                                              " Ignore non-DEC numeral systems when in- or decrementing with <C-a>/<C-x>
set omnifunc=syntaxcomplete#Complete                                        " Omnifunc
set viminfo+=n~/.vim/viminfo                                                " Change viminfo location
set wrapmargin=0                                                            " No wrap margin


" ------------------

" PATH
set path+=**
set path+=./
set path+=/usr/include
set path+=/usr/include/c++/7
set path+=/usr/local/vitasdk/arm-vita-eabi/include
set path+=/usr/local/vitasdk/arm-vita-eabi/include/SDL
