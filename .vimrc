set nocompatible
filetype off
set rtp+=~/.dotfiles/vim/bundle/Vundle.vim
call vundle#begin()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"PLUGINS START HERE
" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" 'user/repository' format
Plugin 'gmarik/vundle'
" We could also add repositories with a ".git" extension
Plugin 'preservim/nerdtree.git'
" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
Plugin 'Buffergator'
Plugin 'python_fold_compact'
Plugin 'EditPlus'
Plugin 'vim-htmldjango_omnicomplete'
Plugin 'cudajinja.vim'
Plugin 'django.vim'
Plugin 'python.vim'
Plugin 'Justify'
Plugin 'vim-django-support'
Plugin 'vim-python-virtualenv'
Plugin 'ctrlp.vim'
Plugin 'git.zip'
Plugin 'dracula/vim', { 'name': 'dracula' }

" Now we can turn our filetype functionality back on
" PLUGINS END HERE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#end() 
colorscheme dracula
filetype plugin indent on
filetype indent on    "load filetype indentation
filetype plugin on
"ADDITIONAL VIM SETTINGS"""""""""""""""""""""""""""""""""""""""
"Colors"
"syntax on
syntax enable         "enable syntax highlighting
let g:solarized_termtrans = 1
set background=dark   "Use colors suitable for dark background
let g:solarized_termcolors=256

set tabstop=4	      "number for whitespace per TAB
set softtabstop=4     "number of spaces when editing
set expandtab         "tabs are spaces
set number
set relativenumber	  "show line numbers
set showcmd	          "show command in bottom bar
set wildmenu          "visual autocomplete for command menu
set lazyredraw        "redraw only when we need to
set showmatch         "highlight matching
set incsearch         "search as characters are pressed
set hlsearch          "highlight matches
set foldenable        "enable folding
set confirm 	      "ask for saving the file
set mouse=a	          "enable mouse	
set scrolloff=1       "The number of screen lines to keep 
                      "above and below the cursor.
set nowrap              "enable line wrapping
set linebreak         "avoid line break at the middle of a word
set sidescrolloff=3   "number of columns away from left and right
set laststatus=2      "always display the status bar
set noshowmode        "hide status down 
set noerrorbells
set ruler             "Always show cursor position
"Set no backup or swap files everything is in git repo  
set nobackup
set nowb
set noswapfile
"Powerline settings
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
set showtabline=2
set t_Co=256

"allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
inoremap jj <esc>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
ln -sf ~/.dotfiles/vim/vimrc ~/.vimrc
