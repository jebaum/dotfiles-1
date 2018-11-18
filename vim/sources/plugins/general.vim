"-------------------------------------------------------------------------------
" DOWNLOAD VIM-PLUG (if is not installed)
"-------------------------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl --create-dirs -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"-------------------------------------------------------------------------------
" INSTALL PLUGINS (via Plug)
"-------------------------------------------------------------------------------

call plug#begin('~/.vim/bundle')
execute 'source ' . '$HOME/dotfiles/vim/sources/plugins/list.vim'
call plug#end()


"-------------------------------------------------------------------------------
" au
"-------------------------------------------------------------------------------

autocmd FileType agit NERDTreeClose    " Fix for Agit and NERDTree
autocmd BufEnter * SignatureRefresh    " Fix for Signature and gitgutter
autocmd InsertEnter * SignatureRefresh " Fix for Signature and gitgutter
autocmd VimEnter * VSO i               " Vissort - case insensivity


"-------------------------------------------------------------------------------
" HIGHLIGHTS
"-------------------------------------------------------------------------------

hi  illuminatedWord  cterm=underline
hi  jsObjectProp     ctermfg=yellow
hi  OperatorChars    ctermfg=3


"-------------------------------------------------------------------------------
" COMMANDS
"-------------------------------------------------------------------------------

command -range -nargs=+ TabChar execute '<line1>,<line2>Tabularize / <args> /l0'
command -range TabSpace execute '<line1>,<line2>Tabularize /\S\+/l1'
command Plugins PlugUpgrade <bar> PlugUpdate
command PlugPlug execute 'PlugClean | PlugUpgrade | PlugUpdate'
