" leader + sth
inoremap <leader><Tab> <C-v><Tab>
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Leader>R :%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>
nnoremap <leader>v gg0vG$

" Function keys -- also mapped: <F8>
inoremap <F1> <Esc>gTi
inoremap <F2> <Esc>gti
noremap <F1> gT
noremap <F2> gt
noremap <F4> :set invrelativenumber<CR>
noremap <F5> :setlocal cursorcolumn! cursorline!<CR>
noremap <F7> :cwindow <bar> echo 'QuickFix List'<CR>
noremap <F9> :w <bar> make<CR>

" Ctrl + sth
inoremap <C-d> <ESC>:t.<CR>i
inoremap <C-p> <ESC>"+pa
noremap <C-p> "+p
noremap <C-q><C-q> q
noremap <C-y> "+y

" Normal keys
noremap '' ``
noremap ' `
noremap <Tab> <C-w><C-w>
noremap G G0
noremap gf <C-w>gf
noremap gg gg0
noremap j gj
noremap k gk
noremap N Nzz
noremap n nzz

" <nop>
map ` <nop>
map c <nop>
map gh <nop>
map q <nop>
map Q <nop>
map ZZ <nop>
