" #############
" ### VIMRC ###
" #############

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

" Highlight whitespace at the ends of lines
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Highlight C/C++ macros
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


"------------------------------------------------------------------------------
" Status line -- DO NOT SORT!!
"------------------------------------------------------------------------------

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


"------------------------------------------------------------------------------
" Plug - plugins
"------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
    Plug 'airblade/vim-gitgutter'
    Plug 'ajh17/VimCompletesMe'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'godlygeek/tabular'
    Plug 'henrik/vim-indexed-search'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'kshenoy/vim-signature'
    Plug 'lervag/vimtex'
    Plug 'mbbill/undotree'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-surround'
    Plug 'Valloric/vim-operator-highlight'
    Plug 'w0rp/ale'
    Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" Plugins' options -- DON'T SORT!
let g:ale_set_highlights=0                    " ALE - disable highlight
let g:ale_set_quickfix=1                      " ALE - enable quicklist
let g:ale_sign_column_always=1                " ALE - sing column always visible
let g:indexed_search_colors=0                 " IndexedSearch - no color of messages
let g:NERDCommentEmptyLines=1                 " NERDCommenter - allow commenting empty lines
let g:NERDSpaceDelims=1                       " NERDCommenter - add space after comment delimiters
let g:nerdtree_tabs_open_on_console_startup=1 " NERDTree(Tabs) - open on startup
let g:NERDTreeWinPos="right"                  " NERDTree - always on right side
let g:ophigh_color=3                          " Operator highlight - change color
let g:undotree_SetFocusWhenToggle=1           " undotree - autofocus
let g:undotree_SplitWidth=32                  " undotree - window width
let g:SignatureMarkTextHLDynamic=1            " Signature - git gutter compability

" Plugins' autocmd
autocmd InsertEnter * SignatureRefresh
autocmd BufEnter * SignatureRefresh


"------------------------------------------------------------------------------
" 'set' OPTIONS
"------------------------------------------------------------------------------

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


"------------------------------------------------------------------------------
" SYNTAX HIGHLIGHT
"------------------------------------------------------------------------------

hi  Comment           ctermfg=grey
hi  CursorLineNr      ctermfg=magenta
hi  DefinedMacro      ctermfg=DarkRed
hi  LineNr            ctermfg=grey
hi  Normal            ctermfg=DarkGreen
hi  Number            ctermfg=DarkCyan
hi  PreProc           ctermfg=LightGreen
hi  SignColumn        ctermbg=black
hi  Special           ctermfg=red
hi  StatusLine        ctermfg=yellow
hi  StatusLineNC      ctermfg=white
hi  String            ctermfg=DarkCyan
hi  Type              ctermfg=white
hi  WildMenu          ctermbg=cyan


"------------------------------------------------------------------------------
" KEY MAPPING
"------------------------------------------------------------------------------

let mapleader="`"
let maplocalleader=','
map <space> <leader>

" Function keys -- also mapped: <F6>, <F8>, <F10>
imap <F1> <Esc>gTi
imap <F2> <Esc>gti
map <F1> gT
map <F2> gt
map <F3> :tabe<CR>
map <F5> :set invrelativenumber<CR>
map <F9> :w <bar> make<CR>

" Leader + function keys
map <leader><F1> :UndotreeToggle<CR>
map <leader><F2> :set wrap!<CR>

" Ctrl + sth / Tab
inoremap <C-p> <ESC>"+pa
noremap <C-o> o<ESC>
noremap <C-p> "+p
noremap <C-q><C-q> q
noremap <C-u> O<ESC>
noremap <C-w><Tab> :vnew<CR>
noremap <C-y> "+y
noremap <Tab> <C-w><C-w>

" Leader + sth
map <leader>h :noh<CR>
map <leader>n :NERDTreeToggle<CR>
nnoremap <leader>v gg0vG$
noremap <leader>= gg=G``
noremap <leader>x Y:!<C-R>"<C-H><CR>

" Normal keys
map - $
map c- <plug>NERDCommenterToEOL
map c<BS> <leader>cu
map c<space> <leader>c<space>
map cc <leader>cc
map cm <leader>cm
map co :copen<CR>
map G G0
map gg gg0
map j gj
map k gk
map N Nzz
map n nzz
map tg 'tdmt
map tt mt<C-]>
noremap '' ``
noremap q: q:
noremap s gh

" <nop>
map ` <nop>
map c <nop>
map gh <nop>
map q <nop>
map Q <nop>
map ZZ <nop>


"------------------------------------------------------------------------------
" COMMANDS
"------------------------------------------------------------------------------

command Ctags w <bar> Silent !ctags -a %
command Q qa!
command SortBlock :normal! vip:sort i<CR>
command W wq
command Ww :execute ':silent w !sudo tee % > /dev/null' | :edit!
command WW :execute ':silent w !sudo tee % > /dev/null' | :edit! | q


"------------------------------------------------------------------------------
" ALIASES
"------------------------------------------------------------------------------

ca nonum set nonumber
ca Plug PlugUpgrade <bar> PlugUpdate
ca rep %!cat
ca sort sort i
ca Tabularize" Tab / " /l0
ca TabularizeS Tab /\S\+/l1


"------------------------------------------------------------------------------
" TEMPORARY
"------------------------------------------------------------------------------
