" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

call plug#begin('~/.vim/plugged')

""Gruvbox theme
Plug 'morhetz/gruvbox'

""Status line
Plug 'itchyny/lightline.vim'

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

""Close parenthesis and those kind of stuff
Plug 'jiangmiao/auto-pairs'

""Preview color codes
Plug 'ap/vim-css-color'

""Ranger implementation
 Plug 'francoiscabrol/ranger.vim'

call plug#end()

"" General
set linebreak				" Break lines at word (requires Wrap lines)
set showbreak=+++ 			" Wrap-broken line prefix
set textwidth=100			" Line wrap (number of cols)
set showmatch				" Highlight matching brace
set hlsearch				" Highlight all search results
set smartcase				" Enable smart-case search
set ignorecase				" Always case-insensitive
set incsearch				" Searches for strings incrementally
set laststatus=2
set noshowmode

set autoindent				" Auto-indent new lines
set shiftwidth=4			" Number of auto-indent spaces
set smartindent				" Enable smart-indent
set smarttab				" Enable smart-tabs
set softtabstop=4			" Number of spaces per Tab
set clipboard=unnamedplus		" Yank to the main clipboard 

"" Advanced
set ruler				" Show row and column ruler information
set undolevels=1000			" Number of undo levels
set backspace=indent,eol,start		" Backspace behaviour
set ttimeoutlen=0
set timeoutlen=1000
au InsertEnter = set timeout
au InsertLeave = set notimeout

""Aesthetic
set t_Co=256				" Specify the use of 265-colors
set termguicolors			" Fix for innacurate background colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"  " ||	
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"  " ||	
let g:gruvbox_contrast_dark = 'hard'	" Gruvbox colorscheme configuration 
colorscheme gruvbox			" ||
set background=dark			" 
set number				" Show line numbers
:syntax on				" Nice colors 

"" Detect groff filetype
autocmd BufRead,BufNewFile *.ms,*.me,*.mom set filetype=groff

"" Auto reset sxhkd on changes
autocmd BufWritePost sxhkdrc :silent exec "!pkill -USR1 -x sxhkd"

"" Auto-compile sukcless config files
autocmd BufWritePost config.h,config.def.h !sudo make install 

""Auto-compile groff documents
autocmd	BufWritePost *.ms :silent exec "!groff -ms % -T pdf > groff.pdf"

"" Bindings to groff documents
:inoremap ;p .P<Enter>

"" Bindings
let mapleader = ","
let g:ranger_map_keys = 0
nnoremap <C-h> <C-w>h			
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>v <C-w>v <C-w>l :Np <CR>
nnoremap <leader>s <C-w>s <C-w>j :Np <CR> 
nnoremap <leader>t :RangerCurrentDirectoryNewTab <CR>
nnoremap <C-J> gT
nnoremap <C-K> gt
