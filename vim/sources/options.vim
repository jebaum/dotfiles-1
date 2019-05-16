" Backup, undo and swap
set backup                                                              " Enable backup files
set backupdir=~/.vim/cache/backup/                                      " Directory for backup files
set noswapfile                                                          " Disable swap files
set undodir=~/.vim/cache/undo/                                          " Directory for undo files
set undofile                                                            " Enable undo files

" Indentation
set autoindent                                                          " Enable automatic indenting
set cindent                                                             " Automatic C program indenting
set expandtab                                                           " Use spaces instead of tabs
set shiftround                                                          " Always indent/outdent to the nearest tabstop
set shiftwidth=4                                                        " Indent/outdent by 4 columns
set smartindent                                                         " Smart indention
set softtabstop=4                                                       " Unify tabs and spaces
set tabstop=4                                                           " Tab spacing

" Looks
set background=dark                                                     " Dark background (needed for proper colors)
set cursorline                                                          " Current line highlight
set listchars=""                                                        " Helps with vim-indentguides - no $ at the end of lines
set scrolloff=5                                                         " Minimal number of screen lines to keep above and below the cursor
set t_Co=256                                                            " 256 color support

" NETRW
let g:netrw_altv = 0                                                    " Split opening file to the right
let g:netrw_banner = 0                                                  " Do not display info on the top of window
let g:netrw_browse_split = 4                                            " Use the previous window to open file
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'  " Do not show hidden files
let g:netrw_liststyle = 3                                               " Tree-view
let g:netrw_sort_sequence = '[\/]$,*'                                   " Sort is affecting only: directories on the top, files below
let g:netrw_winsize = -28                                               " Absolute width of netrw window

" Searching
set hlsearch                                                            " Search highlight
set ignorecase                                                          " Ignoring case of letters while searching
set incsearch                                                           " Do incremental searching
set smartcase                                                           " If searching with capital letter then use match case

" UI
set completeopt-=preview                                                " Disable preview window for completeopt // for: YCM
set laststatus=2                                                        " To always display status line
set signcolumn=no                                                       " Disable signcolumn
set number                                                              " Enable line numbers
set showcmd                                                             " Display incomplete commands
set splitbelow                                                          " New windows open on right when split verticaly
set splitright                                                          " New windows open on right when split horizontaly
set wildmenu                                                            " Menu for command line completion

" Wraping
set linebreak                                                           " Don't break words while wraping lines
set nowrap                                                              " Do not wrap lines on default

" OTHER
set backspace=indent,eol,start                                          " Allow backspacing over everything in insert mode
set viminfo+=n~/.vim/viminfo                                            " Change viminfo location
let g:tex_flavor = 'tex'                                                " Default TeX dialect
set modeline                                                            " Enable modelines
set nrformats=                                                          " Ignore non-DEC numeral systems when in- or decrementing with <C-a>/<C-x>
set history=50                                                          " Keep 50 lines of command line history
set wrapmargin=0                                                        " No wrap margin
set omnifunc=syntaxcomplete#Complete                                    " Omnifunc


" ------------------------------------------------------------------------------

" PATH
set path+=**
set path+=./
set path+=/usr/include
set path+=/usr/include/c++/7
set path+=/usr/local/vitasdk/arm-vita-eabi/include
set path+=/usr/local/vitasdk/arm-vita-eabi/include/SDL
set path+=/usr/local/include/luajit-2.0
