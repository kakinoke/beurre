"autocmd GUIEnter * set transparency=220
set encoding=UTF-8
set fileencoding=UTF-8
"set termencoding=UTF-8
set ambiwidth=double
set imdisable
set notitle
set guioptions-=T
set antialias
set tabstop=2
set expandtab
set shiftwidth=2
set cindent
set showcmd
set ignorecase
set noexpandtab
set number
set nobackup
set undodir=/Users/yu/.undo
set autoindent
set smartindent
set backspace=indent,eol,start
let g:vimfiler_enable_auto_cd = 1

"Change ESC
imap <C-j> <esc>
noremap! <C-j> <esc>

" dein.vim
" initialize
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
	set nocompatible
endif

if !isdirectory(s:dein_repo)
	execute '!git clone https://github.com/Shougo/dein.vim.git' s:dein_repo
endif

execute 'set runtimepath^=' . s:dein_repo

if dein#load_state(s:dein_dir)

	let s:toml = '~/.vim/dein.toml'
	let g:deoplete#enable_at_startup = 1

	call dein#begin(s:dein_dir)
	call dein#load_toml(s:toml)
	call dein#end()

	call dein#save_state()

endif

if dein#check_install()
	call dein#install()
endif

filetype indent plugin on
syntax on


" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#min_syntax_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#dictionary_filetype_lists = {
			\ 'default' : ''
			\ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplete#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

""" unite.vim
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" VimFiler
nnoremap <silent> ,vf :<C-u>VimFiler<CR>
" VimShell
nnoremap <silent> ,vs :<C-u>VimShell<CR>
