" ################
" ### INIT.VIM ###
" ################

" ------------------------------------------------------------------------------
" USE .vimrc
" ------------------------------------------------------------------------------

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc


"-------------------------------------------------------------------------------
" FIXES/WORKAROUNDS
"-------------------------------------------------------------------------------

" DO NOT USE LOCAL MARKS, AS THEY ARE UNDELETEABLE -----------------------------
function! NeoVim_fix_marks(cmd)
    let chr = getchar()
    let chr = chr >= 97 ? chr - 32 : chr
    let marker = nr2char(chr)
    if a:cmd == "D"
        call signature#mark#Remove(marker)
    else
        try
            execute "normal! ".a:cmd.marker
        catch
        endtry
    endif
    execute "SignatureRefresh"
    echo
endfunction

nnoremap ' :call NeoVim_fix_marks("`")<CR>
nnoremap dm :call NeoVim_fix_marks("D")<CR>
nnoremap m :call NeoVim_fix_marks("m")<CR>
