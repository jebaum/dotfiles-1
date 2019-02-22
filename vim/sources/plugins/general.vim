" DOWNLOAD VIM-PLUG (if is not installed) --------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl --create-dirs -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" INSTALL PLUGINS (via Plug) ---------------------------------------------------

call plug#begin('~/.vim/bundle')
execute 'source ' . '$HOME/dotfiles/vim/sources/plugins/list.vim'
call plug#end()


" AUTOCMD ----------------------------------------------------------------------

autocmd BufReadPost * if &bin | Vinarise | endif                   " Vinarise - open automatically when 'binary' is set
autocmd FileType man let g:nerdtree_tabs_open_on_console_startup=0 " Not open NERDTree in man pages
autocmd VimEnter * autocmd BufEnter,InsertEnter * SignatureRefresh " Fix for Signature and gitgutter
autocmd VimEnter * VSO i                                           " Vissort - case insensivity


" HIGHLIGHTS -------------------------------------------------------------------

hi  jsObjectProp            ctermfg=yellow
hi  StatusLine_ALE_Error    ctermbg=197      ctermfg=black
hi  StatusLine_ALE_Warning  ctermbg=208      ctermfg=black


" COMMANDS ---------------------------------------------------------------------

command -range TabularizeBySpace execute '<line1>,<line2>Tabularize /\S\+/l1'
