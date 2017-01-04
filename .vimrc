
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,enc-jp
set fileformats=unix,dos,mac

set number
set t_Co=256
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set noswapfile
set backspace=indent,eol,start
set vb t_vb=
set whichwrap=b,s,h,l,<,>,[,]
set showmode
set wrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch
set clipboard=unnamed
set laststatus=2

nmap <ESC><ESC> :nohlsearch<CR><ESC>

if &compatible
	set nocompatible
endif

" Required:
set runtimepath+=/root/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/root/.vim/dein')
	call dein#begin('/root/.vim/dein')
    let s:toml_dir = '~/dotfiles/dein'
    let s:toml = s:toml_dir . '/dein.toml'
    let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

	" Required:
	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

" Required:
filetype plugin indent on
colorscheme jellybeans
syntax enable

autocmd FileType html inoremap <silent> <buffer> </ </<C-x><C-o>

let g:lightline = {
	\ 'colorscheme': 'jellybeans',
\}

" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" --------------------------------
" vim-gitgutter
" --------------------------------
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>

" ----
" vim-markdown
" ----
set nofoldenable

" ----
" ctags
" ----
nnoremap t <Nop>
nnoremap tt <C-]>
nnoremap tgt <C-]>
nnoremap tj :<C-u>tag<CR>
nnoremap tk :<C-u>pop<CR>
nnoremap tl :<C-u>tags<CR>

" IndentLine
let g:indentLine_color_term = 8
