function s:CompileAndRun(filetype, cmd, ...)
    if a:0
        let prefix = "autocmd BufRead *.".get(a:, 1, 0)." "
    else
        let prefix = ""
    endif
    if has('nvim') " in Neovim there isn't any way to break infinite loop
        exec prefix."autocmd filetype ".a:filetype." nnoremap <buffer> <F8> :w <bar> split <bar> term ".a:cmd."<CR>i"
    else
        exec prefix."autocmd filetype ".a:filetype." nnoremap <buffer> <F8> :w <bar> !".a:cmd."<CR>"
    endif
endfunction

" Those languages have "normal apportionment", i.e.: one filetype equals one compiling command
" Dict structure:   FILETYPE : COMMAND
let s:languages = {
            \ "basic"    : "vintbas %",
            \ "c"        : "gcc -std=gnu11 -g % -o %< && ./%<",
            \ "cpp"      : "g++ -std=gnu++11 -g % -o %< && ./%<",
            \ "haskell"  : "ghc -o %< %; rm %<.hi %<.o && ./%<",
            \ "lisp"     : "clisp %",
            \ "lua"      : "lua %",
            \ "perl"     : "perl %",
            \ "python"   : "python3 %",
            \ "rust"     : "rustc % && ./%<",
            \ "html"     : "firefox %<CR>",
            \ "sh"       : "%:p",
            \ "tex"      : "latexmk -pdf % && latexmk -c; zathura %<.pdf",
            \}

" These languages are different with different file extension
" Dict structure:   FILE_EXTENSION : [FILETYPE, COMMAND]
let s:languages2 = {
            \ "S"   : ["asm", "as -o %<.o % && ld -s -o %< %<.o && rm %<.o && ./%<"],
            \ "asm" : ["asm", "nasm -f elf % && ld -s -o %< %<.o && rm %<.o && ./%<"],
            \}

for [ft, cmd] in items(s:languages)
    call <SID>CompileAndRun(ft, cmd)
endfor

for [ext, ft_cmd] in items(s:languages2)
    call <SID>CompileAndRun(ft_cmd[0], ft_cmd[1], ext)
endfor

" ------------------------------------------------------------------------------

" Markdown // depends on Markdown Preview plugin
autocmd filetype markdown nnoremap <buffer> <F8> :MarkdownPreview<CR>
