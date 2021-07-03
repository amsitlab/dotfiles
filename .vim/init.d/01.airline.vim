
if !g:init.plug_exists('airline')
   finish
endif


if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.colnr = ' ㏇:'
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = ' ␊:'
let g:airline_symbols.linenr = ' ␤:'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" (N)vim built in terminal
let g:airline#extensions#term#enabled = 1


" [vim-lsp](https://github.com/prabirshrestha/vim-lsp)
if g:init.plug_exists('vim-lsp')
   let g:airline#extensions#lsp#enabled = 1
   let airline#extensions#lsp#error_symbol = 'E:'
   let airline#extensions#lsp#warning_symbol = 'W:'
   let airline#extensions#lsp#show_line_numbers = 1
   let airline#extensions#lsp#open_lnum_symbol = '(L'
   let airline#extensions#lsp#close_lnum_symbol = ')'
   let g:airline#extensions#lsp#progress_skip_time = 0.3 (default)
endif

