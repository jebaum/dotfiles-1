"-------------------------------------------------------------------------------
" COMMANDS
"-------------------------------------------------------------------------------

command Ctags w <bar> Silent !ctags --fields=+nS -a %
command ExecCurrentLine normal :.w !sh<CR>
command NoNum set number!
command Q q!
command QQ qa!
command SortBlock :normal! vip:sort i<CR>
command W wq
command Ww :execute ':silent w !sudo tee % > /dev/null' | :edit!
command WW :execute ':silent w !sudo tee % > /dev/null' | :edit! | q
command! -range -nargs=+ TabChar execute '<line1>,<line2>Tabularize / <args> /l0'
command! -range TabSpace execute '<line1>,<line2>Tabularize /\S\+/l1'


"-------------------------------------------------------------------------------
" ALIASES
"-------------------------------------------------------------------------------

ca Plug PlugUpgrade <bar> PlugUpdate
