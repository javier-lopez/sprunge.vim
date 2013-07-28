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
    echoerr "Sprunge unavailable: requires Vim 7.0+"
    finish
endif"}}}

"}}}

function! sprunge#SprungePost()"{{{
    if !has('unix') || !executable('curl')
        echoerr "Sprunge: require 'curl' command"
        return
    endif
    redraw | echon 'Posting it to sprunge ... '
    let l:loc = system('curl -s -F "sprunge=<-" http://sprunge.us < ' . expand('%:p'))[0:-2]
    redraw | echomsg 'Done: '.l:loc
endfunction"}}}

"}}}
