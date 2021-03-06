function! s:lsp_init() abort
  setlocal omnifunc=lsp#complete
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <Leader><Leader>r :w<CR><Plug>(lsp-rename)
endfunction

augroup LSP
  au!
  autocmd User lsp_buffer_enabled call s:lsp_init()

  if executable('ccls')
    au User lsp_setup call lsp#register_server({
          \ 'name': 'ccls',
          \ 'cmd': {server_info->['ccls']},
          \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
          \ 'initialization_options': {'cache': {'directory': '/tmp/ccls/cache' }, 'clang': {'extraArgs': ['--gcc-toolchain=/usr'] } },
          \ 'whitelist': [ 'c', 'cpp', 'objc', 'objcpp', 'cc' ],
          \ })
  endif

  if executable('pyls')
    au User lsp_setup call lsp#register_server({
          \ 'name': 'pyls',
          \ 'cmd': {server_info->['pyls']},
          \ 'whitelist': [ 'python' ],
          \ })
  endif

  if executable('jdtls')
    au User lsp_setup call lsp#register_server({
          \ 'name': 'eclipse.jdt.ls',
          \ 'cmd': {server_info->['jdtls']},
          \ 'whitelist': [ 'java' ],
          \ })
  endif

  if executable('sqls')
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'sqls',
          \ 'cmd': {server_info->['sqls']},
          \ 'workspace_config': {
          \   'sqls': {
          \     'connections': [
          \       {
          \         'driver': 'mysql',
          \         'proto':  'unix',
          \         'user':   expand($SQLS_MYSQL_USER),
          \         'passwd': expand($SQLS_MYSQL_PASSWD),
          \         'path':   '/run/mysqld/mysqld.sock',
          \         'dbName': expand($SQLS_MYSQL_DB),
          \       },
          \     ],
          \   },
          \ },
          \ 'whitelist': [ 'sql' ]
          \ })
  endif

augroup END

" vim: fdl=1
