
" [-- add */lua/ to runtimpath --]
" --- for nvim
let s:has_lua = 1

" --- for viM
if !has('nvim')
  let s:lua = execute("silent! lua print(1)")
  let s:has_lua = s:lua =~ "\s*1\s*" ? 1 : 0
endif

let s:runtime_path = []
if has('nvim') || s:has_lua
  let s:paths = split(&runtimepath, ',')
  for s:path in s:paths
    call add(s:runtime_path, s:path)
    if s:path[-3] ==# 'lua' && s:path[-4:] ==# 'lua/'
      continue
    endif
    call add(s:runtime_path, s:path . '/lua')
  endfor
endif




let &runtimepath=join(s:runtime_path, ',')
" ----------------------------------

