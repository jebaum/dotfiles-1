" ################
" ### INIT.VIM ###
" ################

" USE .vimrc -------------------------------------------------------------------

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc


" Terminal buffer options ------------------------------------------------------

autocmd TermOpen * startinsert | setlocal nonumber

tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l


" FIXES/WORKAROUNDS ------------------------------------------------------------

" DO NOT USE LOCAL MARKS, AS THEY ARE UNDELETEABLE
function! s:NeoVim_fix_marks(cmd)
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
"|
nnoremap ' :call <SID>NeoVim_fix_marks("`")<CR>
nnoremap dm :call <SID>NeoVim_fix_marks("D")<CR>
nnoremap m :call <SID>NeoVim_fix_marks("m")<CR>
