function s:CompileAndRun(cmd)
    if has('nvim') " you will have no way to break infinite loop
        exec "nnoremap <buffer> <F8> :w <bar> split <bar> term ".a:cmd."<CR>i"
    else
        exec "nnoremap <buffer> <F8> :w <bar> !".a:cmd."<CR>"
    endif
endfunction

" ------------------------------------------------------------------------------

" BASIC // for Vintage BASIC
autocmd filetype basic call <SID>CompileAndRun("vintbas %")

" C
autocmd filetype c call <SID>CompileAndRun("gcc -std=gnu11 -g % -o %< && ./%<")

" C++
autocmd filetype cpp call <SID>CompileAndRun("g++ -std=gnu++11 -g % -o %< && ./%<")

" Haskell
autocmd filetype haskell call <SID>CompileAndRun("ghc -o %< %; rm %<.hi %<.o && ./%<")

" HTML
autocmd filetype html nnoremap <buffer> <F8> :w <bar> !firefox %<CR><CR>

" LaTeX
autocmd filetype tex nnoremap <buffer> <F8> :w <bar> !latexmk -pdf % && latexmk -c; zathura %<.pdf<CR>

" Lisp
autocmd filetype lisp call <SID>CompileAndRun("clisp %")

" Lua
autocmd filetype lua call <SID>CompileAndRun("lua %")

" Markdown // depends on Markdown Preview plugin
autocmd filetype markdown nnoremap <buffer> <F8> :MarkdownPreview<CR>

" Perl
autocmd filetype perl call <SID>CompileAndRun("perl %")

" Python
autocmd filetype python call <SID>CompileAndRun("python3 %")

" Rust
autocmd filetype rust call <SID>CompileAndRun("rustc % && ./%<")

" Shell Script
autocmd filetype sh call <SID>CompileAndRun("%:p")
