"-------------------------------------------------------------------------------
" PLUGINS - MAPPINGS
"-------------------------------------------------------------------------------

noremap <leader><F1> :UndotreeToggle<CR>
noremap <leader>= :Autoformat<CR>
noremap tt :PreviewTag<CR>

" Anzu
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" NERDCommenter
map c- <plug>NERDCommenterToEOL
map c<BS> <leader>cu
map c<space> <leader>c<space>
map cc <leader>cc
map cm <leader>cm

" Surround
nmap s ysiw
vmap s S
