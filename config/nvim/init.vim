" Automatic installation of vim-plug (if not installed already)
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

""""""""""""
call plug#begin('~/.config/nvim/plugged')
""""""""""""

" General
Plug 'tpope/vim-fugitive' " git
Plug 'tpope/vim-surround' " c/u/d surroundings
Plug 'tpope/vim-repeat' " enable . for plugins that support it
Plug 'tpope/vim-unimpaired' " various mappings, esp. [<Space> and ]<Space>
Plug 'benekastah/neomake' " async syntax checking
Plug 'benjie/neomake-local-eslint.vim' " use local eslint, not global
Plug 'Yggdroot/indentLine' " show indent indicators
Plug 'tpope/vim-commentary' " easy comments
Plug 'editorconfig/editorconfig-vim' " editorconfig
Plug 'airblade/vim-gitgutter' " show git diff in gutter
Plug 'easymotion/vim-easymotion' " easy motion
Plug 'mhinz/vim-startify' " nice startup screen
Plug 'ctrlpvim/ctrlp.vim' " ctrl-p fzf
Plug 'rking/ag.vim' " ag.vim (the_silver_searcher)
Plug 'skammer/vim-css-color' " highlight colors in css files
Plug 'vim-airline/vim-airline' " airline statusline
Plug 'https://github.com/scrooloose/nerdtree' " file explorer
Plug 'Xuyuanp/nerdtree-git-plugin' " show git status on nerdtree
Plug 'vim-scripts/ScrollColors' " scroll through color schemes
Plug 'jeffkreeftmeijer/vim-numbertoggle' " toggle between abs/rel on norm/insert (or toggle with C-n)
Plug 'christoomey/vim-tmux-navigator' " use c-h,j,k,l for navigation between windows/panes in vim/tmux
Plug 'Shougo/deoplete.nvim' " async autocompletion
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Language support
Plug 'rhysd/vim-crystal' " crystal
Plug 'rust-lang/rust.vim' " rust
Plug 'cespare/vim-toml' " toml
Plug 'pangloss/vim-javascript' | Plug 'mxw/vim-jsx' " js (improved indentation/syntax)
Plug 'lambdatoast/elm.vim'

" Color schemes
Plug 'whatyouhide/vim-gotham' " gotham / gotham256
Plug 'marcopaganini/termschool-vim-theme' " termschool
Plug 'zeis/vim-kolor' " kolor
Plug 'altercation/vim-colors-solarized' " solarized [set background=light/dark]
Plug 'chriskempson/base16-vim' " base16-[many]
Plug 'zenorocha/dracula-theme', { 'rtp': 'vim' } " dracula
Plug 'joshdick/onedark.vim' " onedark
Plug 'chriskempson/vim-tomorrow-theme' " Tomorrow-[many]
Plug 'jonathanfilip/vim-lucius' " lucius

""""""""""""
call plug#end()
""""""""""""

" timeouts
set ttimeout
set ttimeoutlen=100 " time to wait for key sequence next 
set timeoutlen=100 " time to wait for mapped sequence next

" Set leader key to comma
let mapleader=','

" Use 4 spaces instead of tabs
set tabstop=4 shiftwidth=4 expandtab

" Backspace setting
set backspace=indent,eol,start

" Set color scheme
colorscheme onedark

" Enable deoplete
let g:deoplete#enable_at_startup = 1

" Disable terminal bells (audio + visual)
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" File-specific syntaxes
autocmd BufNewFile,BufRead Vagrantfile set syntax=ruby " use ruby syntax for Vagrantfile

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Set debounce time for swap file writing
" (affects vim-gitgutter diff delay)
set updatetime=250 " default 4000

" Enable bold fonts
let g:enable_bold_font = 1

" Show line numbers
set number

" Configure NERDTree
let NERDTreeHijackNetrw=1
map <Leader>n :NERDTreeToggle<CR>
" since we're hijacking netrw...
map <Leader><S-n> :Explore<CR>
" change directory collapse/expand arrows
let g:NERDTreeDirArrowExpandable = '⇨'
let g:NERDTreeDirArrowCollapsible = '⇩'
" close vim if the only window left is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Configure airline
let g:airline_left_sep='' " no poorly-fitting arrows
let g:airline_right_sep='' " no poorly-fitting arrows
set laststatus=2 " always show airline
" set noshowmode " don't show the mode in the vanilla location

" Configure indentLine
let g:indentLine_char = '☡' " some good options: ☡,▏

" Configure vim-jsx
let g:jsx_ext_required = 0 " enable for .js files (not just .jsx)

" Configure neomake
let g:neomake_list_height=2
let g:neomake_javascript_enabled_makers = ['eslint']
" Run neomake on every read or write
autocmd! BufWritePost * Neomake

" Configure Ctrl-p
let g:ctrlp_custom_ignore = '\v[\/](vendor|node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" Configure startify
execute 'source ' . $HOME . '/.config/nvim/ascii-header.vim'
let g:startify_custom_header = my_ascii_header

""""""""
" Remaps

:tnoremap <C-h> <C-\><C-n><C-h>
:tnoremap <C-j> <C-\><C-n><C-j>
:tnoremap <C-k> <C-\><C-n><C-k>
:tnoremap <C-l> <C-\><C-n><C-l>

" Resize windows using <Alt-h,j,k,l>
nnoremap ˙ :vertical resize +2<cr>
nnoremap ∆ :resize +2<cr>
nnoremap ˚ :resize -2<cr>
nnoremap ¬ :vertical resize -2<cr>

" Save with sudo
command! -nargs=0 Sw w !sudo tee % > /dev/null

""""""""""""""""
" Misc Functions

" Source $MYVIMRC, then install plugins
if !exists("*ReloadVimrcAndInstallPlugins")
  function ReloadVimrcAndInstallPlugins()
    source $MYVIMRC
    :PlugInstall
  endfunction
  command! Recfg call ReloadVimrcAndInstallPlugins()
  nnoremap <Leader>v :Recfg<cr>
endif

" Determine color scheme and set appropriate
" indentLine indicator color
if !exists("*SetIndentLineColor")
  function SetIndentLineColor()
    " Default to a good grey (taken from onedark)
    let newguicolor = '#383C45'

    " handle specific color schemes
    if (g:colors_name == 'lucius')
      let newguicolor = '#dadada'
    elseif (g:colors_name == 'base16-ashes')
      let newguicolor = '#dfe2e5'
    endif

    execute "highlight Conceal guifg=" . newguicolor .  " guibg=NONE"
    let g:indentLine_color_gui=newguicolor

    " Default for non-truecolor terminals
    let g:indentLine_color_term=236
    execute "highlight Conceal ctermfg=" . g:indentLine_color_term . " ctermbg=NONE"
  endfunction

  " when color scheme changes, call fn again
  autocmd ColorScheme * call SetIndentLineColor()
endif

call SetIndentLineColor() " see function below

""""""""""
" Modeline
" vim: set sw=2 ts=2 et:
