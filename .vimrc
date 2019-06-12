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


" [ supertab ]
" autocmd FileType python let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
autocmd FileType python let g:SuperTabDefaultCompletionType = '<Tab>'
" -------------------------------------


" [ completor.vim ]
"let g:completor_clang_binary = system('which clang')

"let g:completor_python_binary = system('which python')
"if (g:completor_python_binary ==# '') == 1
"	let g:completor_python_binary = system("which python3")
"endif
"if (g:completor_python_binary ==# '') == 1
"	let g:completor_python_binary = system('which python2')
"endif


" autocmd FileType python let g:completor_blacklist += ['python']

" inoremap <expr> <Tab> pumvisible() ? "\<C-Space>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"


" [ jedi-vim ]
autocmd FileType python let g:jedi#completions_enabled = 0

" [ tabline.vim ]
let g:tablineclosebutton = 1

" [ vim-airline ]
let g:airline#extensions#tabline#enabled = 1

call plug#end()

"Vimmux in normal mode
nnoremap <silent> cmd :VimuxPromptCommand<CR>
nnoremap <silent> lcmd :VimuxRunLastCommand<CR>
autocmd FileType * :EditorConfigReload
" Matching with vim-airline 'dark' theme insert mode
if get(g:, 'airline_theme') ==# 'dark'
	hi Pmenu ctermbg=LightBlue
endif
