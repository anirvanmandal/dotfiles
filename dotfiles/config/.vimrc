"  nightfox's Vim config

set nocompatible " We don't use vi
colo desert " Setting the color scheme
syntax on " Enable Syntax highlighting
filetype on " Enable detection of filetypes
filetype plugin on " Enable plugin specific to filetype
filetype indent on " Enable indentation file specific to filetype
set nowrap " Don't wrap sentences longer than window
set encoding=UTF-8 " Enable utf-8 encoding
set ttimeoutlen=50
set nobackup
set noswapfile
vmap <leader>y "+y
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install plugins: Use Plugged to manage vim plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" General productivity tools
Plug 'scrooloose/nerdtree' " Tree explorer for vim
Plug 'Nopik/vim-nerdtree-direnter' " Enter to expand directories in vim
Plug 'wesQ3/vim-windowswap' " Better way to swap splits
Plug 'vim-airline/vim-airline' " Status & Tabline for vim
Plug 'vim-airline/vim-airline-themes' " Themes for vim airline
Plug 'airblade/vim-gitgutter' " Enable VCS changes in the gutter
Plug 'Valloric/YouCompleteMe' " Enable Autocomplete for different languages
Plug 'tpope/vim-surround' " Enable surrounding of braces and quotes
Plug 'tpope/vim-endwise' " Enable automatic ends on ruby
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file, buzzer etc search
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/fzf'
Plug 'vim-scripts/BufOnly.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'junegunn/fzf.vim'

" Go plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go development plugin

" Ruby Plugins
Plug 'vim-ruby/vim-ruby' " Ruby development plugin
Plug 'tpope/vim-bundler' " Lightweight bundler support
Plug 'tpope/vim-rails' " Ruby on Rails development plugin

" Custom order plugin
Plug 'ryanoasis/vim-devicons' " Add dev icons for nerd tree and airline; load at the end

call plug#end()

"""""""""""""""""""""""""""""""""
" Configuration
"""""""""""""""""""""""""""""""""

let mapleader = ',' " Set the mapleader to ,

" Line Numbers

set number " Show line numbers
set ruler
highlight LineNr ctermfg=Grey

" Tabs!!!

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Highlight current line

set cursorline
:hi CursorLine cterm=None ctermfg=None ctermbg=8
let g:SuperTabDefaultCompletionType = "<C-x><C-o>"
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeDirArrowExpandable="\ue602"
let g:NERDTreeDirArrowCollapsible="\uf0d7"
" let g:airline_symbols.linenr="\ueoa1"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = "\ue0a1"


"""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:airline#extensions#tabline#enabled = 1

map <C-a> :bprevious<CR>
map <C-A> :bnext<CR>
nnoremap <leader><space> :Files<CR>

