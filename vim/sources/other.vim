" Turns on detection, plugin and indent
filetype plugin indent on

" Enable syntax
syntax enable

" Default filetype
autocmd BufEnter * if &filetype == "" | setlocal filetype=text | endif

" Quit QuickFix window along with source file window
autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix" | q | endif

" QuickFix window below other windows
autocmd FileType qf wincmd J

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

" PACKAGES ---------------------------------------------------------------------

packadd matchit
packadd termdebug
