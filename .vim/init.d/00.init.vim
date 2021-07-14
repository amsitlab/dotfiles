" File  : 00.init.vim
" Author: Amsid S <amsit14@gmail.com>
" Date  : 03.06.2020
" File  : 00.init.vim
" Date  : 17.12.2019
" Last Modified Date  : 17.12.2019
" Main {{{
""""""""""""""""""""""""""""""""""""""
filetype on
filetype plugin indent on

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has('termguicolors'))
  set termguicolors
endif

set backspace=indent,eol,start
set background=dark
set nocompatible
"set shell=bash
"set shellcmdflag=-ic
set mouse=a
set number
set nobackup
set nowritebackup
set hidden
set t_Co=256
set linebreak
set list
set listchars=tab:»·,trail:·,nbsp:·
set ruler
set scrolloff=5
set showtabline=2
set statusline=2
set title
set bomb
set binary

" Folding
set foldlevel=0
set foldmethod=manual

colorscheme pablo

" Default Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Global Indentation
"set smartindent
"set expandtab
set fileformat=unix
"set pyxversion=3
"set shiftwidth=2
"set softtabstop=2
"set tabstop=2

" [Term] set no line number
autocmd TermOpen * setlocal nonumber

" [Python]
let g:python3_host_prog = expand($PREFIX . "/bin/python3")
if !executable(g:python3_host_prog)
  let g:python3_host_prog = "/usr/bin/python3"
endif
" }}}

""""""""""""""""""""""""""""""""""""""

" Vim-plug {{{
""""""""""""""""""""""""""""""""""""""
let g:vim_plug_file = get(g:, 'vim_plug_file', expand("~/.vim/autoload/plug.vim"))

if (!filereadable(g:vim_plug_file))
  if !executable("curl")
    echoerr "curl is not installed"
    echoerr "Install it before and re-open"
  else
    call system("curl -fLo " . g:vim_plug_file . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
  endif
endif
call plug#begin("~/.vim/plugged")

Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'shougo/neco-vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-necovim.vim'
Plug 'alpertuna/vim-header'
Plug 'jakwings/vim-terra'
Plug 'bioSyntax/bioSyntax-vim'
if (has('nvim'))
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
endif

Plug 'vim-airline/vim-airline-themes'
Plug 'amsitlab/psalm-phar'
Plug 'phpactor/phpactor', {
      \'do': 'composer install --no-dev'
      \}
Plug 'mattn/vim-lsp-settings'
Plug 'preservim/nerdtree'
call plug#end()

" }}}
"""""""""""""""""""""""""""""""""""""""
