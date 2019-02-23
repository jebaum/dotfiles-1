imap <C-p> <ESC><Plug>SystemPaste
" imap <C-p> <ESC>:execute "normal \<Plug>SystemPaste"<CR>A
map <C-p> <Plug>SystemPaste
map <C-y> <Plug>SystemCopy
noremap <leader><F1> :UndotreeToggle<CR>
noremap <leader>= :Autoformat<CR>
noremap tt :PreviewTag<CR>

" Anzu
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

" NERDCommenter
map c- <plug>NERDCommenterToEOL
map c<BS> <leader>cu
map cc <leader>cc
map cm <leader>cm

" Surround
nmap s ysiw
vmap s S
