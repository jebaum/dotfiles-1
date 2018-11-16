"-------------------------------------------------------------------------------
" RUN SINGLE FILE CODE (with simple compiling beforehand if necessary)
"-------------------------------------------------------------------------------

" C/C++
autocmd filetype c,cpp nmap <F8> :w! <bar> exec '!g++ -std=c++17 -g '.shellescape('%').' -o '.shellescape('%:t:r').' && ./'.shellescape('%:t:r')<CR>

" HTML
autocmd filetype html nmap <F8> :w! <bar> !xdg-open %<CR><CR>

" LaTeX
autocmd filetype tex nmap <F8> :w <bar> !latexmk -pdf % && latexmk -c && zathura %:t:r.pdf<CR>

" Lisp
autocmd filetype lisp nmap <F8> :w <bar> !clisp %<CR>

" Lua
autocmd filetype lua nmap <F8> :w <bar> !lua %<CR>

" Markdown
autocmd filetype markdown nmap <F8> :w <bar> !grip -b % 1> /dev/null<CR><CR>

" Python
autocmd filetype python nmap <F8> :w! <bar> !python %<CR>

" Shell Script
autocmd filetype sh nmap <F8> :w! <bar> !%:p<CR>
