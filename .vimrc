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
set clipboard=unnamed,autoselect

set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,enc-jp

nmap <ESC><ESC> :nohlsearch<CR><ESC>

if has('vim_starting')
	set nocompatible
	set runtimepath+=~/.vim/bundle/neobundle.vim/	
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
"NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'itchyny/lightline.vim'
" Ruby Plugins
NeoBundle 'marcus/rsense'
NeoBundle 'tpope/vim-endwise'

" Scala Plugins
NeoBundle 'derekwyatt/vim-scala'

" Git Plugins
NeoBundle 'airblade/vim-gitgutter'

" JS Plugins
NeoBundle 'othree/yajs.vim'
NeoBundle 'isRuslan/vim-es6'
NeoBundle 'digitaltoad/vim-jade'

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

set laststatus=2

let g:lightline = {
	\ 'colorscheme': 'wombat',
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

