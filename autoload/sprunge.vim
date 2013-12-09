" ============================================================================
" File:        sprunge.vim
" Description: vim global plugin to paste to http://sprunge.us/
" Maintainer:  Javier Lopez <m@javier.io>
" License:     WTFPL -- look it up.
" Notes:       Much of this code was thiefed from gundo.vim
" ============================================================================

let s:sprunge = 'curl -s -F "sprunge=<-" http://sprunge.us'

if exists('sprunge_clipboard')
    if sprunge_clipboard ==? 'none' || sprunge_clipboard ==? 'vim' ||
     \ sprunge_clipboard ==? 'external' || sprunge_clipboard ==? 'all'
        let s:clipboard = tolower(sprunge_clipboard)
    else
        let s:clipboard = 'all'
    endif
else
    let s:clipboard = 'all'
endif

function! sprunge#SprungeCopyClipboard(_loc)"{{{
    if s:clipboard == 'vim' || s:clipboard == 'all'
        call setreg('"', a:_loc)
    endif
    if s:clipboard == 'external' || s:clipboard == 'all'
        if executable('xclip')
            call system('printf "' .  a:_loc . '"' . ' | ' .
            \ 'xclip -selection clipboard; xclip -o -selection clipboard')
        elseif executable ('pbcopy')
            call system('printf "' .  a:_loc . '"' . ' | ' .
            \ 'pbcopy')
        endif
    endif
endfunction"}}}

function! sprunge#SprungePostBuffer(line1, line2)"{{{
    let buffer = join(getline(a:line1, a:line2), "\n") . "\n"
    redraw | echon 'Posting it to sprunge ... '
    let l:loc = system(s:sprunge, buffer)[0:-2]
    call sprunge#SprungeCopyClipboard(l:loc)
    redraw | echomsg 'Done: '.l:loc
endfunction"}}}
