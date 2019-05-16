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

" Clear all maches after leaving buffer
autocmd BufWinLeave * call clearmatches()

" C/C++ formatting
autocmd filetype c,cpp setlocal equalprg=astyle\ --style=kr\ -s4\ -N\ -S\ -xG\ -xU\ -f\ -k3\ -xj\ -p

" Quit QuickFix window along with source file window
autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix" | q | endif

" QuickFix window below other windows
autocmd FileType qf wincmd J

" Open QuickFix window after Grep
autocmd QuickFixCmdPost [^l]* cwindow
autocmd QuickFixCmdPost l*    lwindow

" If last window is netrw/QuickFix, close Vim
autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' | q | endif

" NETRW autocmds
autocmd filetype netrw set nolist
autocmd filetype netrw nnoremap <buffer> <F1> gT
autocmd filetype netrw setlocal statusline=NETRW


" PACKAGES ---------------------------------------------------------------------

packadd matchit
packadd termdebug
