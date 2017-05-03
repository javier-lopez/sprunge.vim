" ============================================================================
" File:        sprunge.vim
" Description: vim global plugin to paste to http://sprunge.us/
" Maintainer:  Javier Lopez <m@javier.io>
" ============================================================================

" Init {{{1
if exists('g:loaded_sprunge') || &cp
  finish
endif
let g:loaded_sprunge = 1

if v:version < '700'
  echoerr "Sprunge unavailable: requires Vim 7.0+"
  finish
endif

" Default configuration {{{1
if exists('g:sprunge_clipboard')
  let g:sprunge_clipboard = g:sprunge_clipboard =~? 'none\|vim\|external\|all' ? tolower(g:sprunge_clipboard) : 'all'
else
  let g:sprunge_clipboard = 'all'
endif

if !exists('g:sprunge_providers')    | let g:sprunge_providers = 'sprunge,ix' | endif
if !exists('g:sprunge_open_browser') | let g:sprunge_open_browser = 0         | endif
if !exists('g:sprunge_map')          | let g:sprunge_map = '<Leader>s'        | endif
if !exists('g:sprunge_tabs2spaces')  | let g:sprunge_tabs2spaces = 0          | endif
if !exists('g:sprunge_flush_left')   | let g:sprunge_flush_left  = 0          | endif

" Commands & Mappings {{{1
command! -nargs=0 -range=% Sprunge call sprunge#Sprunge(<line1>,<line2>)

if !hasmapto('<Plug>Sprunge')
    try
        exe "nmap <unique> " . g:sprunge_map . " <Plug>Sprunge"
        exe "xmap <unique> " . g:sprunge_map . " <Plug>Sprunge"
    catch /^Vim(.*):E227:/
        if(&verbose != 0)
            echohl WarningMsg|echomsg 'Error: sprunge default mapping: ' . g:sprunge_map
            \ . 'is already taken, refusing to overwrite it. See :h SprungeConfig-map' |echohl None
        endif
    endtry
endif

nnoremap <unique> <script> <Plug>Sprunge :Sprunge<CR>
xnoremap <unique> <script> <Plug>Sprunge :Sprunge<CR>
