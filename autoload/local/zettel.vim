func! local#zettel#edit(...)
  let l:sep = ''
  if len(a:000) > 0
    let l:sep = '-'
  endif
  " build the file name
  " let l:fname = expand('~/notes/') . strftime("%F-%H%M") . l:sep . join(a:000, '-') . '.md'
  let l:fname = expand('~/notes/') . tolower(join(a:000, '-'))

  if fnamemodify(l:fname, ":e") == "md" && filereadable(l:fname)
    exec "e " . l:fname
  elseif filereadable(l:fname . '.md')
      exec "e " . l:fname . ".md"
  else
    exec "e " . l:fname . '.md'
    if len(a:000) > 0
      exec "normal ggO# " . join(a:000) . "\<esc>G"
    endif
  endif
endfunc
