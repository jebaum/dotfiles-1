" DOWNLOAD VIM-PLUG (if is not installed) --------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl --create-dirs -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" INSTALL PLUGINS (via Plug) ---------------------------------------------------

call plug#begin('~/.vim/bundle')
source $HOME/dotfiles/vim/sources/plugins/list.vim
call plug#end()


" AUTOCMD ----------------------------------------------------------------------

autocmd FileType man let g:nerdtree_tabs_open_on_console_startup=0 " Do not open NERDTree in man pages


" HIGHLIGHTS -------------------------------------------------------------------

hi  jsObjectProp            ctermfg=yellow
hi  StatusLine_ALE_Error    ctermbg=197      ctermfg=black
hi  StatusLine_ALE_Warning  ctermbg=208      ctermfg=black


" COMMANDS ---------------------------------------------------------------------

command -range TabularizeBySpace execute '<line1>,<line2>Tabularize /\S\+/l1'


" MAPPINGS ---------------------------------------------------------------------

noremap <leader><F1> :UndotreeToggle<CR>
noremap <leader>= :Autoformat<CR>
noremap tt :PreviewTag<CR>

" Anzu
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

" Surround
nmap s ysiw
vmap s S
