" main {{{
""""""""""""""""""""""""""""""""""""""
let s:proot_rootfs_path = '/data/data/com.termux/files/alpinelinux/3.10.2'

let s:proot_commands = [
         \expand($PREFIX . '/bin/proot'),
         \'--link2symlink',
         \'-0',
         \'-r',
         \s:proot_rootfs_path,
         \'-b', '/dev/',
         \'-b', '/sys/',
         \'-b', '/proc/',
         \'-b', '/storage/',
         \'-b', expand($HOME),
         \'-w', expand($HPME),
         \'/usr/bin/env',
         \'HOME=/root/',
         \'TERMUX_HOME=' . expand($HOME),
         \'TERM=xterm',
         \'LANG=en_US.UTF-8',
         \'PATH=/bin:/usr/bin:/sbin:/usr/sbin',
\]

if g:init.plug_exists('proot.vim')
   let s:proot_commands = proot#commands()
endif

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
   let self.data.name = a:name
   let self.data.cmd = a:cmd
   let self.data.whitelist = a:whitelist
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

""""""""""""""""""""""""""""""""""""""
let g:lspconf.jdtls = get(g:lspconf,"jdtls", {
         \"path": "/storage/sdcard0/archives/jdt-ls",
         \"config_path": "",
         \"launcher": "",
         \"java_executable": "java",
   \})
let g:lspconf.jdtls.config_path = empty(g:lspconf.jdtls.config_path) ? expand(g:lspconf.jdtls.path . "/config_linux") : g:lspconf.jdtls.config_path

let g:lspconf.jdtls.launcher = empty(g:lspconf.jdtls.launcher) ? expand(g:lspconf.jdtls.path . "/plugins/org.eclipse.equinox.launcher_1.5.500.v20190715-1310.jar") : g:lspconf.jdtls.launcher

let g:lspconf.jdtls.commands = s:proot_commands + [
            \g:lspconf.jdtls.java_executable,
            \"-Declipse.application=org.eclipse.jdt.ls.core.id1",
            \"-Dosgi.bundles.defaultStartLevel=4",
            \"-Declipse.product=org.eclipse.jdt.ls.core.product",
            \"-noverify",
            \'-Dfile.encoding=UTF-8',
            \"-Xmx1G",
            \"-jar",
            \g:lspconf.jdtls.launcher,
            \"-configuration",
            \g:lspconf.jdtls.config_path,
            \"-data",
            \getcwd(),
\]
call g:lspconf.__meta__.new(
         \'java',
         \"Eclipse JDTLS",
         \{ server_info -> g:lspconf.jdtls.commands },
         \["java",]
\)

call g:lspconf.__meta__.new(
         \'php',
         \'Php language server',
         \{ server_info -> [
            \'php',
            \expand('~/.vim/plugged/php-language-server/bin/php-language-server.php'),
            \'--memory-limit=256M',
         \]},
         \['php']
\)

