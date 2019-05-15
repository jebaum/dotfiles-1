" leader + sth
nnoremap <leader>h :nohlsearch<CR>
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Leader>R :%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>
nnoremap <leader>v ggVG

" Function keys -- also mapped: <F3>, <F8>
inoremap <F1> gT
inoremap <F2> gt
noremap <F1> gT
noremap <F2> gt
noremap <F7> :cwindow <bar> echo 'QuickFix List'<CR>
noremap <F9> :w <bar> make<CR>

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
imap <F1> <nop>
map gh <nop>
map Q <nop>
map q: <nop>
map ZZ <nop>
