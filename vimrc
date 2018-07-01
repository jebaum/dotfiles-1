" #############
" ### VIMRC ###
" #############


"-------------------------------------------------------------------------------
" GENERAL
"-------------------------------------------------------------------------------

" Use Vim settings -- always 1st
set nocompatible

" Enable syntax highlight
syntax on

" Download vim-plug (if is not installed)
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl --create-dirs -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" tmux - title fix
if has ("title")
    if &t_ts == "" && ( &term == "screen" || &term == "xterm" )
        let &t_ts = "\e]2;"
    endif
    if &t_ts != ""
        set title
    endif
endif

" Open file at the last known position
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exec "normal! g`\"" | endif

" Turns on detection, plugin and indent
filetype plugin indent on

" Redraw after 'silent' command
command! -nargs=+ Silent execute 'silent <args>' | redraw!

" Adds gutter
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" Adds a highlight group for extra whitespace at the ends of lines -- DO NOT CHANGE HERE! USE SYNTAX HIGHLIGHT SECTION!
hi ExtraWhitespace cterm=NONe
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Adds a higlight group for C/C++ macros
function! HighlightDefinedMacros()
    syn clear DefinedMacro
    for l in getline('1','$')
        if l =~ '^\s*#\s*define\s\+'
            let macro = substitute(l, '^\s*#\s*define\s\+\(\k\+\).*$', '\1', '')
            exe 'syn keyword DefinedMacro ' . macro
        endif
    endfor
endfunction
"|
autocmd BufWinEnter *.* exec HighlightDefinedMacros()
autocmd InsertEnter * exec HighlightDefinedMacros()

" Quit QuickFix window along with source file window
aug QFClose
    au!
    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" QuickFix window below other windows
au FileType qf wincmd J

" Backups etc.
set backup
set backupdir=~/.vimtmp//
set directory=~/.vimtmp//
set undodir=~/.vimtmp//
set undofile

" Indentation rules
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set cindent

" Folding
autocmd BufWinEnter *.* silent loadview " Load saved foldings
autocmd BufWinLeave *.* mkview " Save foldings
set foldlevel=10
set foldmethod=indent
set foldnestmax=10
set nofoldenable

" Toggle cursorline's underline
let hl_state=0   " set value to 0 to start without underline, set to 1 to start with underline
"|
if (hl_state == 0)
    hi CursorLine cterm=none
else
    hi CursorLine cterm=underline
endif
"|
map <F6> :if (hl_state == 0) <bar> hi CursorLine cterm=underline <bar> let hl_state=1 <bar>  else <bar> hi CursorLine cterm=none <bar> let hl_state=0 <bar> endif <CR>

" Toggle mouse
function ToggleMouse()
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfunc
"|
map <F10> :call ToggleMouse()<CR>

" Simple compile and run
"" C/C++
autocmd filetype c,cpp nmap <F8> :w! <bar> exec '!g++ -std=c++17 -g '.shellescape('%').' -o '.shellescape('%:t:r').' && ./'.shellescape('%:t:r')<CR>

" Optional packages
packadd matchit


"-------------------------------------------------------------------------------
" Status line -- DO NOT SORT!!
"-------------------------------------------------------------------------------

set statusline=
set statusline+=[%n]                                       " Buffer number
set statusline+=\ \                                        " Separator
set statusline+=%f                                         " Path to the file
set statusline+=\ \                                        " Separator
set statusline+=%y                                         " Filetype
set statusline+=[%{&ff}]                                   " File format
set statusline+=[%{&fileencoding?&fileencoding:&encoding}] " File encoding
set statusline+=\ \                                        " Separator
set statusline+=%r                                         " Readonly flag
set statusline+=%w                                         " Preview flag
set statusline+=\ \                                        " Separator
set statusline+=%m                                         " Modified flag
set statusline+=%=                                         " Switch to the right side
set statusline+=Line\:\ %l/                                " Current line
set statusline+=%L                                         " Total lines
set statusline+=\ \|\ Column\:\ %c                         " Current column
set statusline+=\ \|\ %p%%\ \|                             " Percent through file


"-------------------------------------------------------------------------------
" Plug - plugins
"-------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'cohama/agit.vim'                  " Agit
Plug 'w0rp/ale'                         " ALE
Plug 'octol/vim-cpp-enhanced-highlight' " C++ Enhanced Highlight
Plug 't9md/vim-choosewin'               " Choosewin
Plug 'tpope/vim-fugitive'               " FUGITIVE
Plug 'airblade/vim-gitgutter'           " GitGutter
Plug 'ludovicchabant/vim-gutentags'     " Gutentags
Plug 'henrik/vim-indexed-search'        " IndexedSearch
Plug 'jistr/vim-nerdtree-tabs'          " NERDTree(Tabs)
Plug 'scrooloose/nerdcommenter'         " NERDCommenter
Plug 'scrooloose/nerdtree'              " NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'      " NERDTree-Git
Plug 'semanser/vim-outdated-plugins'    " Outdated-plugins
Plug 'Valloric/vim-operator-highlight'  " Operator Highlight
Plug 'kshenoy/vim-signature'            " Signature
Plug 'tpope/vim-surround'               " Surround
Plug 'christoomey/vim-tmux-navigator'   " Tmux Navigator
Plug 'godlygeek/tabular'                " Tabular
Plug 'mbbill/undotree'                  " UndoTree
" Plug 'ajh17/VimCompletesMe'             " VimCompletesMe
Plug 'junegunn/vim-peekaboo'            " vim-peekaboo
Plug 'lervag/vimtex'                    " VimTex
Plug 'mg979/vim-visual-multi'           " Visual-Multi
Plug 'raviqqe/vim-nonblank'             " Vim-NONBlank
Plug 'skywind3000/vim-preview'          " vim-preview
Plug 'yaroot/vissort'                   " Visual Block Sorting
Plug 'thaerkh/vim-workspace'            " Workspace

call plug#end()

" Plugins' options -- DON'T SORT!
let g:ale_set_highlights=0                    " ALE - disable highlight
let g:ale_set_quickfix=1                      " ALE - enable quicklist
let g:ale_sign_column_always=1                " ALE - sing column always visible
let g:indexed_search_colors=0                 " IndexedSearch - no color of messages
let g:NERDCommentEmptyLines=1                 " NERDCommenter - allow commenting empty lines
let g:NERDSpaceDelims=1                       " NERDCommenter - add space after comment delimiters
let g:NERDTreeWinPos="right"                  " NERDTree - always on right side
let g:nerdtree_tabs_open_on_console_startup=1 " NERDTree(Tabs) - open on startup
let g:ophigh_color=3                          " Operator highlight - change color
let g:SignatureMarkTextHLDynamic=1            " Signature - git gutter compability
let g:undotree_SetFocusWhenToggle=1           " undotree - autofocus
let g:undotree_SplitWidth=32                  " undotree - window width
let g:vimtex_compiler_latexmk = {'callback' : 0}

" Plugins' autocmd
autocmd BufEnter * SignatureRefresh    " Fix for Signature and gitgutter
autocmd FileType agit NERDTreeToggle   " Fix for Agit and NERDTree
autocmd InsertEnter * SignatureRefresh " Fix for Signature and gitgutter
autocmd VimEnter * VSO i               " Vissort - case insensivity


"-------------------------------------------------------------------------------
" 'set' OPTIONS
"-------------------------------------------------------------------------------

set autoindent                 " Always set autoindenting on
set background=dark            " Dark background
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set cursorline                 " Current line highlight
set history=50                 " Keep 50 lines of command line history
set hlsearch                   " Search highlight
set ignorecase                 " Ignoring case of letters while searching
set incsearch                  " Do incremental searching
set laststatus=2               " To always display status line
set linebreak                  " Don't break words while warping lines
set nostartofline              " Cursor is kept in the same column (if possible)
set noswapfile                 " Disable swap file
set nrformats=                 " Ignore non-DEC numeral systems when in- or decrementing with <C-a>/<C-x>
set number                     " Enable line numbers
set ruler                      " Show the cursor position all the time
set scrolloff=5                " Minimal number of screen lines to keep above and below the cursor
set showcmd                    " Display incomplete commands
set smartcase                  " If searching with capital letter then use match case
set smartindent                " Smart indention
set splitbelow                 " New windows open on right when split verticaly
set splitright                 " New windows open on right when split horizontaly
set t_Co=256                   " 256 color support
set wildmenu                   " Menu for command linecompletion


"-------------------------------------------------------------------------------
" SYNTAX HIGHLIGHT
"-------------------------------------------------------------------------------

hi  Comment          ctermfg=grey
hi  CursorLineNr     ctermfg=magenta
hi  DefinedMacro     ctermfg=DarkRed
hi  ExtraWhitespace  ctermbg=red
hi  LineNr           ctermfg=grey
hi  Normal           ctermfg=DarkGreen
hi  Number           ctermfg=DarkCyan
hi  PreProc          ctermfg=LightGreen
hi  SignColumn       ctermbg=black
hi  Special          ctermfg=red
hi  StatusLine       ctermfg=yellow
hi  StatusLineNC     ctermfg=white
hi  String           ctermfg=DarkCyan
hi  Type             ctermfg=white
hi  WildMenu         ctermbg=cyan


"-------------------------------------------------------------------------------
" KEY MAPPING
"-------------------------------------------------------------------------------

" Set leader
let mapleader="`"
let maplocalleader=','
map <space> <leader>

" Leader + sth
map <leader>h :noh<CR>
nnoremap <leader>v gg0vG$
noremap <leader>= gg=G``
noremap <leader>x Y:!<C-R>"<C-H><CR>

" Leader + function keys -- also mapped: <F1>
map <leader><F2> :set wrap!<CR>

" Function keys -- also mapped: <F6>, <F8>, <F10>
imap <F1> <Esc>gTi
imap <F2> <Esc>gti
map <F1> gT
map <F2> gt
map <F3> :tabe<CR>
map <F5> :set invrelativenumber<CR>
map <F9> :w <bar> make<CR>

" Ctrl + sth / Tab
inoremap <C-p> <ESC>"+pa
noremap <C-o> O<ESC>
noremap <C-p> "+p
noremap <C-q><C-q> q
noremap <C-w><Tab> :vnew<CR>
noremap <C-y> "+y
noremap <Tab> <C-w><C-w>

" Normal keys
map - $
map co :copen<CR>
map G G0
map gg gg0
map j gj
map k gk
map N Nzz
map n nzz
noremap '' ``
noremap <CR> o<ESC>
noremap q: q:

" <nop>
map ` <nop>
map s <nop>
map c <nop>
map gh <nop>
map q <nop>
map Q <nop>
map ZZ <nop>


" Plugins' mapping -------------------------------------------------------------

map <leader><F1> :UndotreeToggle<CR>
map <leader>n :NERDTreeToggle<CR>
map c- <plug>NERDCommenterToEOL
map c<BS> <leader>cu
map c<space> <leader>c<space>
map cc <leader>cc
map cm <leader>cm
map tt :PreviewTag<CR>
nnoremap <leader>w :ToggleWorkspace<CR>


"-------------------------------------------------------------------------------
" COMMANDS
"-------------------------------------------------------------------------------

command Ctags w <bar> Silent !ctags --fields=+nS -a %
command Q qa!
command SortBlock :normal! vip:sort i<CR>
command W wq
command Ww :execute ':silent w !sudo tee % > /dev/null' | :edit!
command WW :execute ':silent w !sudo tee % > /dev/null' | :edit! | q


"-------------------------------------------------------------------------------
" ALIASES
"-------------------------------------------------------------------------------

ca agit Agit
ca nonum set nonumber
ca Plug PlugUpgrade <bar> PlugUpdate
ca rep %!cat
ca sort sort i
ca Tabularize" Tab / " /l0
ca TabularizeS Tab /\S\+/l1


"-------------------------------------------------------------------------------
" TEMPORARY
"-------------------------------------------------------------------------------
