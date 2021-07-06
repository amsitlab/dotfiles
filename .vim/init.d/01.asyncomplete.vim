
let g:asyncompleteconf = get(g:, 'asyncompleteconf', {})

let s:basedir = expand('<sfile>:p:h')
let s:dir = expand(s:basedir . '/asyncomplete.vim')

call g:init.load_files(s:dir)
