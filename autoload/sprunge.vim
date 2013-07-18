" ============================================================================
" File:        sprunge.vim
" Description: vim global plugin to paste to http://sprunge.us/
" Maintainer:  Javier Lopez <m@javier.io>
" License:     WTFPL -- look it up.
" Notes:       Much of this code was thiefed from gundo.vim
"
" ============================================================================

"{{{ Init

if v:version < '700'"{{{
    echohl WarningMsg|echomsg "Sprunge unavailable: requires Vim 7.0+"|echohl None
    finish
endif"}}}

"}}}

function! sprunge#SprungePost()"{{{
    if !has('unix') || !executable('curl')
        echohl WarningMsg| echo "Sprunge: require 'curl' command" |echohl None
        return
    endif
    redraw | echon 'Posting it to sprunge ... '
    let l:loc = substitute(system("cat " . expand("%:p") . " |  curl -s -F '\''sprunge=<-'\'' http://sprunge.us"), "\n", '', '')
    redraw | echomsg 'Done: '.l:loc
endfunction"}}}

"}}}
