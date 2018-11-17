"-------------------------------------------------------------------------------
" PLUGINS - MAPPINGS
"-------------------------------------------------------------------------------

map <leader><F1> :UndotreeToggle<CR>
map <leader><F4> :UltiSnipsEdit<CR>
map tt :PreviewTag<CR>
nnoremap <leader>s :ToggleWorkspace<CR>

" NERDCommenter
map c- <plug>NERDCommenterToEOL
map c<BS> <leader>cu
map c<space> <leader>c<space>
map cc <leader>cc
map cm <leader>cm

" Surround
nmap s ysiw
vmap s S

" EasyMotion
map <leader>l <Plug>(easymotion-bd-jk)
nmap <leader>l <Plug>(easymotion-overwin-line)
map <leader>w <Plug>(easymotion-bd-w)

" Anzu
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

" fzf
nmap <Leader>a :Ag<CR>
nmap <Leader>f :Files<CR>
