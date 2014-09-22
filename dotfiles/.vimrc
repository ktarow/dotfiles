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

nmap <ESC><ESC> :nohlsearch<CR><ESC>

"括弧の自動保管
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"inoremap < <><LEFT>

if has('vim_starting')
	set nocompatible
	set runtimepath+=~/.vim/bundle/neobundle.vim/	
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'itchyny/lightline.vim'

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

colorscheme molokai 
syntax on

autocmd FileType html inoremap <silent> <buffer> </ </<C-x><C-o>

set laststatus=2

let g:lightline = {
	\ 'colorscheme': 'wombat',
\}

" markdown
"autocmd BufNewFile, BufRead *.{md, mdwn, mkd, mkdn, mark*} set filetype=markdown
" Previm
"let g:previm_open_cmd = ''
"nmap <Space>p [previm]
"nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
"nnoremap <silent> [previm]r :call previm#refresh()<CR>

