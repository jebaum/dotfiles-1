" ################
" ### INIT.VIM ###
" ################

set guicursor=

" ------------------------------------------------------------------------------
" USE .vimrc
" ------------------------------------------------------------------------------
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc


"-------------------------------------------------------------------------------
" FIXES/WORKAROUNDS
"-------------------------------------------------------------------------------

function! NeoVim_fix_marks(cmd)
    let chr = getchar() - 32
    let marker = nr2char(chr)
    execute "normal! ".a:cmd.marker
    execute "SignatureRefresh"
endfunction

noremap ' :call NeoVim_fix_marks("'")<CR>
noremap m :call NeoVim_fix_marks('m')<CR>
