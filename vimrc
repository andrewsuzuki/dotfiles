" Be iMproved
set nocompatible

" Turn on syntax highlighting
syntax on

" Turn on line numbers
set number

" Substitute 4 spaces for tabs
set tabstop=4 shiftwidth=4 expandtab

" Allow backspaces always
"set backspace=indent,eol,start

" Disable terminal bells (audio + visual)
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Use 256 colours
set t_Co=256

""""""""""""""
" VUNDLE START
""""""""""""""

" turn off filetype for vundle
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sjl/gundo.vim'
Plugin 'Yggdroot/indentLine'

" Color schemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'cabin/cabin-colorscheme'
Plugin 'toupeira/vim-desertink'
Plugin 'zeis/vim-kolor'

" All Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put non-Plugin stuff after this line

""""""""""""
" VUNDLE END
""""""""""""

" Enable syntax (important?: put before color scheme)
syntax enable

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1
set timeoutlen=50 ttimeoutlen=0
" Hide default status indicator
set noshowmode

" Color Scheme
"let g:solarized_termcolors=16
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
"let g:solarized_termtrans = 1
set background=dark
colorscheme desertink

" NERDTree 
map <leader>n :NERDTreeToggle<CR>
" Show hidden files by default
"let NERDTreeShowHidden=1
" Open HERDTree automatically if no files were specified on startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Gundo map
map <leader>g :GundoToggle<CR>

" Config indentLine
let g:indentLine_color_term = 236
