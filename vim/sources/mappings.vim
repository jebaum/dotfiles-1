" leader + sth
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Leader>R :%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>
nnoremap <leader>v ggVG

" Function keys -- also mapped: <F3>, <F8>
inoremap <F1> <Esc>gTi
inoremap <F2> <Esc>gti
noremap <F1> gT
noremap <F2> gt
noremap <F7> :cwindow <bar> echo 'QuickFix List'<CR>
noremap <F9> :w <bar> make<CR>

" Ctrl + sth
inoremap <C-p> <ESC>"+pa
noremap <C-p> "+p
noremap <C-y> "+y

" Normal keys
noremap '' ``
noremap ' `
noremap <Tab> <C-w><C-w>
noremap gf <C-w>gf
noremap j gj
noremap k gk
noremap N Nzz
noremap n nzz

" <nop>
map c <nop>
map gh <nop>
map q <nop>
map Q <nop>
map ZZ <nop>
