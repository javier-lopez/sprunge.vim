" ============================================================================
" File:        sprunge.vim
" Description: vim global plugin to paste to http://sprunge.us/
" Maintainer:  Javier Lopez <m@javier.io>
" License:     WTFPL -- look it up.
" Notes:       Much of this code was thiefed from gundo.vim
" ============================================================================

"{{{ Init
if (exists('g:sprunge_disable') || exists('loaded_sprunge') || &cp)
    finish
endif
let loaded_sprunge = 1

if v:version < '700'
    echoerr "Sprunge unavailable: requires Vim 7.0+"
    finish
endif

if !has('unix') || !executable('curl')
    echoerr "Sprunge: requires 'curl' command"
    finish
endif
"}}}

"{{{ Misc
command! -nargs=0 -range=% Sprunge call sprunge#SprungePostBuffer(<line1>,<line2>)
"}}}
