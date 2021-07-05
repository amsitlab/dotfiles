
if !g:init.plug_exists('vim-lsp')
  finish
end


" main {{{
""""""""""""""""""""""""""""""""""""""
let g:lsp_async_complete = 1


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
