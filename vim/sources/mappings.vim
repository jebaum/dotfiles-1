" Set leader
let mapleader="`"
let maplocalleader=','
map <space> <leader>

" leader + sth
inoremap <leader><Tab> <C-v><Tab>
map <leader>h :noh<CR>
nnoremap <leader>v gg0vG$
noremap <leader>= gg=G``
noremap <leader>" :vnew<CR>

" leader + function keys -- also mapped: <F1>, <F3>, <F4>
map <leader><F2> :set wrap!<CR>

" Function keys -- also mapped: <F8>, <F10> ; do not use <F11>
imap <F1> <Esc>gTi
imap <F2> <Esc>gti
map <F1> gT
map <F2> gt
map <F3> :tabe<CR>
map <F4> :set invrelativenumber<CR>
map <F9> :w <bar> make<CR>

" Ctrl + sth
inoremap <C-d> <ESC>:t.<CR>i
inoremap <C-o> <C-x><C-o>
inoremap <C-p> <ESC>"+pa
noremap <C-d> :t.<CR>
noremap <C-p> "+p
noremap <C-q><C-q> q
noremap <C-w><Tab> :vnew<CR>
noremap <C-y> "+y

" Normal keys
map - $
map G G0
map gg gg0
map j gj
map k gk
map N Nzz
map n nzz
noremap '' ``
noremap 0 ^
noremap <CR> o<ESC>
noremap <Tab> <C-w><C-w>
noremap ^ 0
noremap f z
noremap F zfa{
noremap gff <C-w>gf
noremap gfg gf
noremap z f
noremap Z z

" <nop>
map ` <nop>
map c <nop>
map gh <nop>
map K <nop>
map q <nop>
map Q <nop>
map ZZ <nop>
