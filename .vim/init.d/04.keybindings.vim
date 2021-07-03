" leader {{{
""""""""""""""""""""""""""""""""""""""
let mapleader=','
" }}}
""""""""""""""""""""""""""""""""""""""

" tab completion {{{
""""""""""""""""""""""""""""""""""""""
imap <c-space> <Plug>(asyncomplete_force_refresh)
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" }}}
""""""""""""""""""""""""""""""""""""""
