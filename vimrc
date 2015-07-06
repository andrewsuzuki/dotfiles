" Be iMproved
set nocompatible

" Turn on syntax highlighting
syntax on

" Turn on line numbers
set number

" Allow backspaces always
"set backspace=indent,eol,start

" Disable terminal bells (audio + visual)
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

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
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sjl/gundo.vim'

" Color schemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'cabin/cabin-colorscheme'

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

" Setup Powerline

" python config
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
" Use fancy symbols
let g:Powerline_symbols = "fancy"
" set timeouts
set timeoutlen=1000 ttimeoutlen=0

" Solarized Color Scheme

syntax enable
" uncomment for terminal.app, maybe?
"if !has("gui_running")
"    let g:solarized_termtrans=1
"    let g:solarized_termcolors=256
"endif
set background=dark
colorscheme solarized

" NERDTree 
map <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Gundo map
map <leader>g :GundoToggle<CR>
