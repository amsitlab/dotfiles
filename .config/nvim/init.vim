" compatible with viM
set runtimepath^=~/.vim runtimepath+=~/.vim/after

" -------- add */lua/ to runtimpath ----------

    " --- for viM, nvim default installed with lua
let s:lua = execute("silent! lua print(1)")
let s:has_lua = s:lua =~ "\s*1\s*" ? 1 : 0
    " ---

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
" -------------------------------------------

" --- update viM8 plugins path
let &packpath=&runtimepath

" -- campatible with viM configuration file.
source ~/.vim/vimrc
