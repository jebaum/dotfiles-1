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
