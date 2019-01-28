"-------------------------------------------------------------------------------
" SIMPLE COMPILE
"-------------------------------------------------------------------------------

" BASIC // for Vintage BASIC
autocmd filetype basic nnoremap <buffer> <F8> :w <bar> !vintbas %<CR>

" C
autocmd filetype c nnoremap <buffer> <F8> :w <bar> exec '!gcc -g '.shellescape('%').' -o '.shellescape('%:t:r').' && ./'.shellescape('%:t:r')<CR>

" C++
autocmd filetype cpp nnoremap <buffer> <F8> :w <bar> exec '!g++ -std=c++11 -g '.shellescape('%').' -o '.shellescape('%:t:r').' && ./'.shellescape('%:t:r')<CR>

" Haskell // TODO
autocmd filetype haskell nnoremap <buffer> <F8> :w <bar>

" HTML
autocmd filetype html nnoremap <buffer> <F8> :w <bar> !firefox %<CR><CR>

" LaTeX
autocmd filetype tex nnoremap <buffer> <F8> :w <bar> !latexmk -pdf % && latexmk -c && zathura %:t:r.pdf<CR>

" Lisp
autocmd filetype lisp nnoremap <buffer> <F8> :w <bar> !clisp %<CR>

" Lua
autocmd filetype lua nnoremap <buffer> <F8> :w <bar> !lua %<CR>

" Python
autocmd filetype python nnoremap <buffer> <F8> :w <bar> !python3 %<CR>

" Shell Script
autocmd filetype sh nnoremap <buffer> <F8> :w <bar> !%:p<CR>


"-------------------------------------------------------------------------------
" Markdown - look: Markdown Preview plugin
