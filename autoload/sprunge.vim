" ============================================================================
" File:        sprunge.vim
" Description: vim global plugin to paste to http://sprunge.us/
" Maintainer:  Javier Lopez <m@javier.io>
" License:     WTFPL
" ============================================================================

function! sprunge#CopyToClipboard(clip) "{{{
  if g:sprunge_clipboard ==? 'vim' || g:sprunge_clipboard ==? 'all'
    call setreg('"', a:clip)
  endif
  if g:sprunge_clipboard ==? 'external' || g:sprunge_clipboard ==? 'all'
    if executable('xclip')
      call system('printf "' .  a:clip . '"' . ' | ' .
            \ 'xclip -selection clipboard; xclip -o -selection clipboard')
    elseif executable ('xsel')
      call system('printf "' .  a:clip . '"' . ' | ' .  'xsel -bi')
    elseif executable ('pbcopy')
      call system('printf "' .  a:clip . '"' . ' | ' .
            \ 'pbcopy')
    endif
    if has("win32") || has("win16")
      call setreg('*', a:clip)
    endif
  endif
  if exists('g:sprunge_clipboard_cmd')
      call system('printf "' .  a:clip . '"' . ' | ' .  g:sprunge_clipboard_cmd)
  endif
endfunction

function! sprunge#FlushLeft(line1, line2) "{{{
  let l:current_line     = a:line1
  let l:min_white_spaces = 9999
  while l:current_line <= a:line2
      if getline(l:current_line) =~# '^$'
          let l:current_line = l:current_line + 1
          continue
      else
          let l:white_spaces = indent(l:current_line)
          let l:current_line = l:current_line + 1
          if l:white_spaces < l:min_white_spaces
             let l:min_white_spaces = l:white_spaces
          endif
      endif
  endw
  let l:buffer = '' | for line in getline(a:line1, a:line2)
      let l:buffer .= strpart(line, l:min_white_spaces) . "\n"
  endfor
  return l:buffer
endfunction

function! sprunge#OpenBrowser(url) "{{{
  if a:url =~# '//sprunge.us/'
      let l:url = a:url . '?' . &filetype
  elseif a:url =~# '//ix.io/'
      let l:url = a:url . '/' . &filetype
  else
      let l:url = a:url
  endif
  if has("win32")
    exe "!start cmd /cstart /b ".l:url.""
  elseif $DISPLAY !~ '^\w'
    exe "silent !sensible-browser \"".l:url."\""
  else
    exe "silent !sensible-browser -T \"".l:url."\""
  endif
  redraw!
endfunction

function! sprunge#Post(buffer, ...) "{{{
  if a:0 > 0
      if a:1 ==? "sprunge"
          return system('curl -s -F "sprunge=<-" http://sprunge.us', a:buffer)
      elseif a:1 ==? "ix"
          return system('curl -s -F "f:1=<-" http://ix.io', a:buffer)
      endif
  else
      if !exists('g:sprunge_cmd')
        for l:provider in split(g:sprunge_providers, ',')
            let l:url = sprunge#Post(a:buffer, l:provider)
            if l:url =~# '^http.*' | break | endif
        endfor
        if !exists('l:url')
            let l:url = system('curl -s -F "sprunge=<-" http://sprunge.us', a:buffer)
        endif
      else
        let l:url = system(g:sprunge_cmd, a:buffer)
      endif
  endif
  return l:url[0:-2]
endfunction

function! sprunge#Sprunge(line1, line2)  "{{{
  if !exists('g:sprunge_cmd') && !executable('curl')
      echoerr "Sprunge: requires 'curl'"
      return
  endif
  if !exists('g:sprunge_flush_left')
      let buffer = join(getline(a:line1, a:line2), "\n") . "\n"
  else
      let buffer = sprunge#FlushLeft(a:line1, a:line2)
  endif
  redraw | echon 'Posting ... '
  let l:url = sprunge#Post(buffer)
  if empty(l:url)
      let l:url = system("curl -s http://google.com")
      if empty(l:url)
          redraw | echohl WarningMsg|echomsg 'Error: no network available' |echohl None
      else
          redraw | echohl WarningMsg|echomsg 'Error: sprunge.us has been shutdown or altered its api' |echohl None
      endif
  else
      call sprunge#CopyToClipboard(l:url)
      if g:sprunge_open_browser | call sprunge#OpenBrowser(l:url) | endif
      redraw | echomsg 'Done: ' . l:url
  endif
endfunction
