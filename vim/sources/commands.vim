"-------------------------------------------------------------------------------
" COMMANDS
"-------------------------------------------------------------------------------

command -nargs=+ Spelling execute 'setlocal spell spelllang=<args>'
command Q q!
command QQ qa!
command SortBlock :normal! vip:sort i<CR>
command TrimWhitespace execute '%s/\s\+$//e | %s/\(\n\r\?\)\+\%$//e'
command Vimrc e $MYVIMRC
command W wq

" WITH SHELL COMMAND ----------------------------------------------------------
command Ctags w <bar> Silent !ctags --fields=+nS -a %
command ExecCurrentLine normal :.w !sh<CR>
command SudoW :execute ':silent w !sudo tee % > /dev/null' | :edit!
