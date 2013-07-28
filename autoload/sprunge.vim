" ============================================================================
" File:        sprunge.vim
" Description: vim global plugin to paste to http://sprunge.us/
" Maintainer:  Javier Lopez <m@javier.io>
" License:     WTFPL -- look it up.
" Notes:       Much of this code was thiefed from gundo.vim
"
" ============================================================================

function! sprunge#SprungePost()"{{{
    redraw | echon 'Posting it to sprunge ... '
    let l:loc = system('curl -s -F "sprunge=<-" http://sprunge.us < ' . expand('%:p'))[0:-2]
    redraw | echomsg 'Done: '.l:loc
endfunction"}}}
