set number

colorscheme pablo
set background=dark
set mouse=a
set ts=4 sw=4
set backspace=indent,eol,start




call plug#begin()
   if filereadable(expand('~/.dotfiles/plugins.vim'))
	   source ~/.dotfiles/plugins.vim
   endif
" -------------------------completor.vim----------------
let g:completor_clang_binary = '/data/data/com.termux/files/usr/bin/clang'


inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

"----------------------- completor.vim -----------------


call plug#end()


