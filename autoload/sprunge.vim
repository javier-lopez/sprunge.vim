" ============================================================================
" File:        sprunge.vim
" Description: vim global plugin to paste to http://sprunge.us/
" Maintainer:  Javier Lopez <m@javier.io>
" License:     WTFPL -- look it up.
" Notes:       Much of this code was thiefed from gundo.vim
" ============================================================================

let s:sprunge = 'curl -s -F "sprunge=<-" http://sprunge.us'

function! sprunge#SprungePostBuffer(line1, line2)"{{{
    let buffer = join(getline(a:line1, a:line2), "\n") . "\n"
    redraw | echon 'Posting it to sprunge ... '
    let l:loc = system(s:sprunge, buffer)[0:-2]
    redraw | echomsg 'Done: '.l:loc
endfunction"}}}
