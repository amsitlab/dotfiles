set number
set shell=bash
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

"let g:completor_clang_binary = system('which clang')

"let g:completor_python_binary = system('which python')
"if (g:completor_python_binary ==# '') == 1
"	let g:completor_python_binary = system("which python3")
"endif
"if (g:completor_python_binary ==# '') == 1
"	let g:completor_python_binary = system('which python2')
"endif



inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

"----------------------- completor.vim -----------------


call plug#end()

"Vimmux in noral mode
nnoremap <silent> cmd :VimuxPromptCommand<CR>
nnoremap <silent> lcmd :VimuxRunLastCommand<CR>
