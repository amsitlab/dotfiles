" compatible with viM
set runtimepath^=~/.vim runtimepath+=~/.vim/after

" --- update viM8 plugins path
let &packpath=&runtimepath

" -- campatible with viM configuration file.
source ~/.vim/vimrc
