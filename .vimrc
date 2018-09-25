set number

call plug#begin()
   if filereadable(expand('~/.dotfiles/plugins.vim'))
	   source ~/.dotfiles/plugins.vim
   endif
call plug#end()
colorscheme pablo
set background=dark
set mouse=a
