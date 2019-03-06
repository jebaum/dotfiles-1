" CmdAlias -- rewrite of https://github.com/vim-scripts/cmdalias.vim -----------

let g:cmdaliasCmdPrefixes = 'verbose debug silent redir'

let s:aliases = {}

function! s:ExpandAlias(lhs, rhs)
    if getcmdtype() == ":"
        let partCmd = strpart(getcmdline(), 0, getcmdpos())
        let prefixes = ['^'] + map(split(g:cmdaliasCmdPrefixes, ' '), '"^".v:val."!\\?"." "')
        for prefix in prefixes
            if partCmd =~ prefix.a:lhs.'$'
                return a:rhs
            endif
        endfor
    endif
    return a:lhs
endfunction

function! s:CmdAlias(lhs, rhs)
    exec 'cnoreabbr <expr> '.a:lhs." <SID>ExpandAlias('".a:lhs."', '".a:rhs."')"
    let s:aliases[a:lhs] = a:rhs
endfunction

function! s:Aliases()
    let maxLhsLen = max(map(copy(keys(s:aliases)), 'strlen(v:val[0])'))
    echo join(map(copy(keys(s:aliases)), 'printf("%-".maxLhsLen."s | %s", v:val, s:aliases[v:val])'), "\n")
endfunction

command! Aliases call <SID>Aliases()


" ------------------------------------------------------------------------------
" ALIASES
" ------------------------------------------------------------------------------
