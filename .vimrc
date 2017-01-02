
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,enc-jp

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

if has('vim_starting')
	set nocompatible
	set runtimepath+=~/.vim/bundle/neobundle.vim/	
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'itchyny/lightline.vim'

" Git Plugins
NeoBundle 'airblade/vim-gitgutter'

" Python
NeoBundle 'hynek/vim-python-pep8-indent'

" YAML Plugin
NeoBundle 'mrk21/yaml-vim'

" ctags
NeoBundle "szw/vim-tags"

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

colorscheme jellybeans
syntax on

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
