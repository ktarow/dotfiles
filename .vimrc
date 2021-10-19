
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,enc-jp
set fileformats=unix,dos,mac

set nf=""
set number
set t_Co=256
set expandtab
set smarttab
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
set cursorline

" Plugin
call plug#begin('~/.vim/plugged')
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'nanotech/jellybeans.vim'

Plug 'itchyny/lightline.vim'
let g:lightline = { 'colorscheme': 'wombat' }

Plug 'airblade/vim-gitgutter'
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>

Plug 'google/vim-jsonnet'

Plug 'cespare/vim-toml', { 'branch': 'main' }
call plug#end()

" Indent/Syntax
filetype plugin indent on
colorscheme jellybeans
syntax enable

" ctags
nnoremap t <Nop>
nnoremap tt <C-]>
nnoremap tgt <C-]>
nnoremap tj :<C-u>tag<CR>
nnoremap tk :<C-u>pop<CR>
nnoremap tl :<C-u>tags<CR>

" nmap
nmap <ESC><ESC> :nohlsearch<CR><ESC>
