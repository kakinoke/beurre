" Required:
" " Add the dein installation directory into runtimepath
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state($HOME . '/.config/nvim/dein')
"
" " Required:
call dein#begin($HOME . '/.cache/dein')

let s:toml_dir = $HOME . '/.config/nvim/dein/'
let s:toml = s:toml_dir . 'dein.toml'
let s:lazy_toml = s:toml_dir . 'dein_lazy.toml'

call dein#load_toml(s:toml, {'lazy' : 0})
call dein#load_toml(s:lazy_toml, {'lazy': 1})

call dein#end()
call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif


" SETTINGS
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split
set tabstop=4
set shiftwidth=4
set softtabstop=0
set autochdir
set encoding=utf-8
set expandtab
set smarttab
set shiftround
set number
set completeopt=menuone,noinsert
set noswapfile
set nowritebackup

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap <silent> jj <ESC>:<C-u>w<CR>
inoremap <silent> <C-j> <ESC>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> jj <ESC>:<C-\><C-n>

if &compatible
	set nocompatible " Be iMproved
endif

nmap <silent> <space>rn <Plug>(coc-rename)
nmap <silent> <space>fmt <Plug>(coc-format)

autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
   \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> t
  \ defx#do_action('drop','tabnew')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('drop', 'pedit')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('drop_or_close_tree')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction


nnoremap <silent> <C-e> :Defx<CR>
nnoremap <silent> ;f :<C-u>Denite file/rec -start-filter<CR>

call defx#custom#option('_', {
            \ 'winwidth': 40,
            \ 'split': 'vertical',
            \ 'direction': 'topleft',
            \ 'show_ignored_files': 1,
            \ 'buffer_name': 'explorer',
            \ 'toggle': 1,
            \ 'resume': 1,
            \ 'columns': 'indent:icons:filename:mark',
            \ })

	" Define mappings
	autocmd FileType denite call s:denite_my_settings()
	function! s:denite_my_settings() abort
	  nnoremap <silent><buffer><expr> <CR>
	  \ denite#do_map('do_action')
	  nnoremap <silent><buffer><expr> d
	  \ denite#do_map('do_action', 'delete')
	  nnoremap <silent><buffer><expr> p
	  \ denite#do_map('do_action', 'preview')
	  nnoremap <silent><buffer><expr> q
	  \ denite#do_map('quit')
	  nnoremap <silent><buffer><expr> i
	  \ denite#do_map('open_filter_buffer')
	  nnoremap <silent><buffer><expr> <Space>
	  \ denite#do_map('toggle_select').'j'
	endfunction
	autocmd FileType denite-filter call s:denite_filter_my_settings()
	function! s:denite_filter_my_settings() abort
	  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
	endfunction
	" Change file/rec command.
	call denite#custom#var('file/rec', 'command',
	\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
	" For ripgrep
	" Note: rg is faster than ag
	call denite#custom#var('file/rec', 'command',
	\ ['rg', '--files', '--glob', '!.git', '--color', 'never'])
	" For Pt(the platinum searcher)
	" NOTE: It also supports windows.
	call denite#custom#var('file/rec', 'command',
	\ ['pt', '--follow', '--nocolor', '--nogroup',
	\  (has('win32') ? '-g:' : '-g='), ''])
	" For python script scantree.py
	" Read bellow on this file to learn more about scantree.py
	call denite#custom#var('file/rec', 'command',
	\ ['scantree.py', '--path', ':directory'])
	" Change matchers.
	call denite#custom#source(
	\ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
	call denite#custom#source(
	\ 'file/rec', 'matchers', ['matcher/cpsm'])
	" Change sorters.
	call denite#custom#source(
	\ 'file/rec', 'sorters', ['sorter/sublime'])
	" Change default action.
	call denite#custom#kind('file', 'default_action', 'split')
	" Add custom menus
	let s:menus = {}
	let s:menus.zsh = {
		\ 'description': 'Edit your import zsh configuration'
		\ }
	let s:menus.zsh.file_candidates = [
		\ ['zshrc', '~/.config/zsh/.zshrc'],
		\ ['zshenv', '~/.zshenv'],
		\ ]
	let s:menus.my_commands = {
		\ 'description': 'Example commands'
		\ }
	let s:menus.my_commands.command_candidates = [
		\ ['Split the window', 'vnew'],
		\ ['Open zsh menu', 'Denite menu:zsh'],
		\ ['Format code', 'FormatCode', 'go,python'],
		\ ]
	call denite#custom#var('menu', 'menus', s:menus)
	" Ag command on grep source
	call denite#custom#var('grep', {
		\ 'command': ['ag'],
		\ 'default_opts': ['-i', '--vimgrep'],
		\ 'recursive_opts': [],
		\ 'pattern_opt': [],
		\ 'separator': ['--'],
		\ 'final_opts': [],
		\ })
	" Ack command on grep source
	call denite#custom#var('grep', {
		\ 'command': ['ack'],
		\ 'default_opts': [
		\   '--ackrc', $HOME.'/.ackrc', '-H', '-i',
		\   '--nopager', '--nocolor', '--nogroup', '--column'
		\ ],
		\ 'recursive_opts': [],
		\ 'pattern_opt': ['--match'],
		\ 'separator': ['--'],
		\ 'final_opts': [],
		\ })
	" Ripgrep command on grep source
	call denite#custom#var('grep', {
		\ 'command': ['rg'],
		\ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
		\ 'recursive_opts': [],
		\ 'pattern_opt': ['--regexp'],
		\ 'separator': ['--'],
		\ 'final_opts': [],
		\ })
	" Pt command on grep source
	call denite#custom#var('grep', {
		\ 'command': ['pt'],
		\ 'default_opts': [
		\   '-i', '--nogroup', '--nocolor', '--smart-case'],
		\ 'recursive_opts': [],
		\ 'pattern_opt': [],
		\ 'separator': ['--'],
		\ 'final_opts': [],
		\ })
	" jvgrep command on grep source
	call denite#custom#var('grep', {
		\ 'command': ['jvgrep'],
		\ 'default_opts': ['-i'],
		\ 'recursive_opts': ['-R'],
		\ 'pattern_opt': [],
		\ 'separator': [],
		\ 'final_opts': [],
		\ })
	" Specify multiple paths in grep source
	"call denite#start([{'name': 'grep',
	"      \ 'args': [['a.vim', 'b.vim'], '', 'pattern']}])
	" Define alias
	call denite#custom#alias('source', 'file/rec/git', 'file/rec')
	call denite#custom#var('file/rec/git', 'command',
	      \ ['git', 'ls-files', '-co', '--exclude-standard'])
	call denite#custom#alias('source', 'file/rec/py', 'file/rec')
	call denite#custom#var('file/rec/py', 'command',
	\ ['scantree.py', '--path', ':directory'])
	" Change ignore_globs
	call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
	      \ [ '.git/', '.ropeproject/', '__pycache__/',
	      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
	" Custom action
	" Note: denite#custom#action() with lambda parameter is only available
	"       in NeoVim; not supported in Vim8.
	call denite#custom#action('file', 'test',
	      \ {context -> execute('let g:foo = 1')})
	call denite#custom#action('file', 'test2',
	      \ {context -> denite#do_action(
	      \  context, 'open', context['targets'])})
	" Source specific action
	call denite#custom#action('source/file', 'test',
	      \ {context -> execute('let g:bar = 1')})

function! DefxDeniteGrep(context) abort
  let dirpath = fnamemodify(a:context.targets[0], ':p:h')
  exec 'Denite grep -path=' . dirpath ' -start-filter'
endfunction

autocmd FileType defx call s:defx_custom_settings()
function! s:defx_custom_settings() abort
  nnoremap <silent><buffer><expr> <SPACE>fg
    \ defx#do_action('call', 'DefxDeniteGrep')
endfunction


