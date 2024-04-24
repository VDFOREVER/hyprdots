set mouse=a  " enable mouse
set encoding=utf-8
set number
set cursorline
set noswapfile
set scrolloff=7
set clipboard+=unnamedplus
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
filetype indent on      " load filetype-specific indent files

" for tabulation
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2

" horizontal split open below and right
set splitbelow
set splitright


call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'folke/tokyonight.nvim'
Plug 'andweeb/presence.nvim'
Plug 'preservim/nerdtree'
Plug 'saecki/crates.nvim'
Plug 'ModProg/cargo.nvim'

call plug#end()

lua require('crates').setup()

let g:ale_linters = {
\  'rust': ['analyzer'],
\}

let g:ale_fixers = { 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'] }
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1

nnoremap <leader>n :NERDTreeFocus<CR>

nnoremap <C-n> :NERDTree<CR>

nnoremap <C-t> :NERDTreeToggle<CR>

nnoremap <C-f> :NERDTreeFind<CR>

syntax on
colorscheme tokyonight-night
