"-------------------------------------------------------------------------------
" SIMPLE COMPILE
"-------------------------------------------------------------------------------

" BASIC // for Vintage BASIC
autocmd filetype basic nnoremap <buffer> <F8> :w <bar> !vintbas %<CR>

" C
autocmd filetype c nnoremap <buffer> <F8> :w <bar> exec '!gcc -std=c99 -g '.shellescape('%').' -o '.shellescape('%:t:r').' && ./'.shellescape('%:t:r')<CR>

" C++
autocmd filetype cpp nnoremap <buffer> <F8> :w <bar> exec '!g++ -std=c++11 -g '.shellescape('%').' -o '.shellescape('%:t:r').' && ./'.shellescape('%:t:r')<CR>
" autocmd filetype c,cpp nnoremap <buffer> <F10> :w <bar> exec '!g++ -std=c++11 -g '.shellescape('%').' -o '.shellescape('%:t:r').'' <bar> terminal ./%:t:r<CR><CR>

" Haskell // TODO
" autocmd filetype haskell nnoremap <buffer> <F8> :w <bar>

" HTML
autocmd filetype html nnoremap <buffer> <F8> :w <bar> !xdg-open %<CR><CR>

" LaTeX
autocmd filetype tex nnoremap <buffer> <F8> :w <bar> !latexmk -pdf % && latexmk -c && zathura %:t:r.pdf<CR>

" Lisp
autocmd filetype lisp nnoremap <buffer> <F8> :w <bar> !clisp %<CR>

" Lua
autocmd filetype lua nnoremap <buffer> <F8> :w <bar> !lua %<CR>

" Markdown // useful only if not using Markdown Preview plugin
" autocmd filetype markdown nnoremap <buffer> <F8> :w <bar> !grip -b % 1> /dev/null<CR><CR>

" Python
autocmd filetype python nnoremap <buffer> <F8> :w <bar> !python3 %<CR>

" Shell Script
autocmd filetype sh nnoremap <buffer> <F8> :w <bar> !%:p<CR>
