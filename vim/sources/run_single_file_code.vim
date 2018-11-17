"-------------------------------------------------------------------------------
" RUN SINGLE FILE CODE (with simple compiling beforehand if necessary)
"-------------------------------------------------------------------------------

" C/C++
autocmd filetype c,cpp nnoremap <F8> :w! <bar> exec '!g++ -std=c++17 -g '.shellescape('%').' -o '.shellescape('%:t:r').' && ./'.shellescape('%:t:r')<CR>

" HTML
autocmd filetype html nnoremap <F8> :w! <bar> !xdg-open %<CR><CR>

" LaTeX
autocmd filetype tex nnoremap <F8> :w <bar> !latexmk -pdf % && latexmk -c && zathura %:t:r.pdf<CR>

" Lisp
autocmd filetype lisp nnoremap <F8> :w <bar> !clisp %<CR>

" Lua
autocmd filetype lua nnoremap <F8> :w <bar> !lua %<CR>

" Markdown
autocmd filetype markdown nnoremap <F8> :w <bar> !grip -b % 1> /dev/null<CR><CR>

" Python
autocmd filetype python nnoremap <F8> :w! <bar> !python %<CR>

" Shell Script
autocmd filetype sh nnoremap <F8> :w! <bar> !%:p<CR>
