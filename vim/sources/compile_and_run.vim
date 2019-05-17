function s:CompileAndRun(filetype, cmd)
    exec "autocmd filetype ".a:filetype." nnoremap <buffer> <F8> :w <bar> !".a:cmd."<CR>"
endfunction

" Those languages have "normal apportionment", i.e.: one filetype equals one compiling command
" Dict structure:   FILETYPE : COMMAND
let s:languages = {
            \ "asm"      : "as -o %<.o % && ld -s -o %< %<.o && rm %<.o && ./%<",
            \ "basic"    : "vintbas %",
            \ "c"        : "gcc -std=gnu11 -g % -o %< && ./%<",
            \ "cpp"      : "g++ -std=gnu++11 -g % -o %< && ./%<",
            \ "haskell"  : "ghc -o %< %; rm %<.hi %<.o && ./%<",
            \ "html"     : "firefox %",
            \ "lisp"     : "clisp %",
            \ "lua"      : "lua %",
            \ "markdown" : "grip -b % 1> /dev/null<CR>",
            \ "nasm"     : "yasm -f elf64 % && ld -g -o %< %<.o && rm %<.o && ./%<",
            \ "perl"     : "perl %",
            \ "python"   : "python3 %",
            \ "rust"     : "rustc % && ./%<",
            \ "sh"       : "%:p",
            \ "tex"      : "latexmk -pdf % && latexmk -c; zathura %<.pdf",
            \}

for [ft, cmd] in items(s:languages)
    call <SID>CompileAndRun(ft, cmd)
endfor
