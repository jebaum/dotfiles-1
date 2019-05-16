" Turns on detection, plugin and indent
filetype plugin indent on

" Enable syntax
syntax enable

" Default filetype
autocmd BufEnter * if &filetype == "" | setlocal filetype=text | endif

" Open file at the last known position
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exec "normal! g`\"" | endif

" Disable continuation of comments to the next line (it cannot be just '-cro')
autocmd FileType * set fo-=c fo-=r fo-=o

" Trim trailing whitespace
autocmd BufWritePre * silent! undojoin | %s/\s\+$//e | %s/\(\n\r\?\)\+\%$//e

" Define comments for *.list
autocmd BufEnter *.list setlocal comments=:# commentstring=#%s | syn match listComment "#.*$" | hi link listComment Comment

" Markdown TAB = 2 SPACES
autocmd filetype markdown setlocal tabstop=2 softtabstop=2

" Default TeX dialect
let g:tex_flavor = 'tex'

" ------------------------------------------------------------------------------

" Quit QuickFix window along with source file window
autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix" | q | endif

" QuickFix window below other windows
autocmd FileType qf wincmd J

" Open QuickFix window after Grep
autocmd QuickFixCmdPost [^l]* cwindow
autocmd QuickFixCmdPost l*    lwindow

" ------------------------------------------------------------------------------

" If last window is netrw/QuickFix, close Vim
autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' | q | endif

" ------------------------------------------------------------------------------

" NETRW autocmds
autocmd filetype netrw set nolist
autocmd filetype netrw nnoremap <buffer> <F1> gT
autocmd filetype netrw setlocal statusline=NETRW

" NETRW variables
let g:netrw_altv = 0                                                   " Split opening file to the right
let g:netrw_banner = 0                                                 " Do not display info on the top of window
let g:netrw_browse_split = 4                                           " Use the previous window to open file
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+' " Do not show hidden files
let g:netrw_liststyle = 3                                              " Tree-view
let g:netrw_sort_sequence = '[\/]$,*'                                  " Sort is affecting only: directories on the top, files below
let g:netrw_winsize = -28                                              " Absolute width of netrw window


" PACKAGES ---------------------------------------------------------------------

packadd matchit
packadd termdebug
