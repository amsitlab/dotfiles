" File  : 01.vim-lsp.vim
" Author: Amsid S <amsit14@gmail.com>
" Date  : 19.02.2021
" main {{{
""""""""""""""""""""""""""""""""""""""
let g:lsp_async_complete = 1



"function! s:check_back_space() abort
"   set omnifunc=lsp#complete
"    let col = col('.') - 1
"    return !col || getline('.')[col - 1]  =~ '\s'
"endfunction
"
"inoremap <silent><expr> <TAB>
"  \ pumvisible() ? "\<C-n>" :
"  \ <SID>check_back_space() ? "\<TAB>" :
"  \ asyncomplete#force_refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"



if !g:init.plug_exists("vim-lsp")
   echohl ErrorMsg
   echo "[vimrc.init.lsp] plugin vim-lsp is required"
   echo
   echohl NONE
   finish
endif

let s:pwd = expand("<sfile>:p:h")
if has('nvim')
   let g:lsp_virtual_text_enabled = 1
endif
let g:lsp_log_verbose = 1
let g:lsp_log_file = $TMPDIR . "/vim-lsp.log"


let g:lspconf = {}
let g:lspconf.__meta__ = {
         \"data": {
            \"name": "",
            \"cmd": {},
            \"whitelist": [],
         \},
         \"auto_enable": 1,
\}
function g:lspconf.__meta__.new(ftyp, name, cmd, whitelist)
   "let self.data.name = a:name
   "let self.data.cmd = a:cmd
   "let self.data.whitelist = a:whitelist
   let g:lspconf[a:ftyp] = {
         \'data': {
            \'name': a:name,
            \'cmd': a:cmd,
            \'whitelist': a:whitelist,
         \}
   \}
   exe 'autocmd FileType ' . a:ftyp . ' call g:lspconf.__meta__.register()'

endfunction

function g:lspconf.__meta__.is_valid()
   return 1
endfunction

function g:lspconf.__meta__.register()
   if !self.is_valid() | finish | endif

   "let g:lspconf.__data__ = self.data
   let b:data = g:lspconf[&filetype]
   autocmd User lsp_setup call lsp#register_server(g:lspconf[&filetype][  'data'])
endfunction

call g:lspconf.__meta__.new(
         \'python',
         \"Python Language Server",
         \{ server_info -> [
            \&shell,
            \&shellcmdflag,
            \'pyls',
         \]},
         \['python']
\)



call g:lspconf.__meta__.new(
         \'lua',
         \"Lua Language Server",
         \{ server_info -> [
            \&shell,
            \&shellcmdflag,
            \'lua-lsp',
         \]},
         \['lua']
\)


let g:php_host_prog = get(g:, 'php_host_prog', 'php')
if executable(g:php_host_prog)

"  call g:lspconf.__meta__.new(
"           \'php',
"           \'psalm language server',
"           \{
"              \server_info -> [
"                 \&shell,
"                 \&shellcmdflag,
"                 \g:php_host_prog,
"                 \'~/.composer/vendor/vimeo/psalm/psalm-language-server',
"                 \'--verbose',
"                 \'\--enable-autocomplete=true'
"              \]
"           \},
"           \['php']
"  \)
"

"   call g:lspconf.__meta__.new(
"            \'php',
"            \'Phpactor',
"            \{
"               \server_info -> [
"                  \&shell,
"                  \&shellcmdflag,
"                  \g:php_host_prog,
"                  \g:phpactorbinpath,
"                  \'language-server'
"               \]
"            \},
"            \['php']
"   \)

end



let g:vimlsp_serverpath = get(
   \g:, 'vimlsp_serverpath',
   \expand('<sfile>:p:h') . '/vim-lsp'
\)

