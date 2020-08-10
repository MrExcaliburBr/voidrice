" All system-wide defaults are "set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those "settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly "set to work with the Vim-related packages.
runtime! archlinux.vim

"" Plungins (with vim-plug) {{{
call plug#begin('~/.vim/plugged')

" Stuff for aesthetics
Plug 'morhetz/gruvbox'			    " Gruvbox theme
Plug 'itchyny/lightline.vim'		    " Status line
Plug 'ap/vim-css-color'			    " Preview color codes
Plug 'nathanaelkane/vim-indent-guides'	    " Plugin for highlight indentation
Plug 'hardcoreplayers/dashboard-nvim'	    " Another Startscreen

" Stuff for usability
Plug 'jiangmiao/auto-pairs'		    " Close parenthesis and those kind of stuff
Plug 'tpope/vim-surround'		    " Change things surrouding words
"Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary'  }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-obsession'		    " Plugin for tmux ressurect
Plug 'scrooloose/syntastic'		    " Highlight compile and syntax error
Plug 'psliwka/vim-smoothie'		    " Smooth up and down 
Plug 'godlygeek/tabular'		    " Align text
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vim-which-key'		    " Which binds are assing to this key
"Plug 'mcchrish/nnn.vim'			    " File manager
Plug 'francoiscabrol/ranger.vim'

" Extra funcionality stuff
Plug 'vimwiki/vimwiki'			    " Vimwiki (for notetaking)
Plug 'plasticboy/vim-markdown'		    " Markdown syntax highliting (mostly for VimWiki)
Plug 'dhruvasagar/vim-table-mode'	    " Draw table easely	(mostly for markdown tables)
Plug 'iamcco/markdown-preview.nvim'

call plug#end() 

"}}}

"" General configurations {{{
" General
set number relativenumber				    " Show line numbers
set ruler				    " Show row and column ruler information
set linebreak				    " Break lines at word (requires Wrap lines)
set showbreak=+++ 			    " Wrap-broken line prefix
"set textwidth=100			    " Line wrap (number of cols)
set showmatch				    " Highlight matching brace
set hlsearch				    " Highlight all search results
set smartcase				    " Enable smart-case search
set ignorecase				    " Always case-insensitive
set incsearch				    " Searches for strings incrementally
set so=7				    " set 7 lines to the cursor
"set lazyredraw
set autoindent				    " Auto-indent new lines
set shiftwidth=4			    " Number of auto-indent spaces
set smartindent			    	    " Enable smart-indent
set smarttab				    " Enable smart-tabs
set softtabstop=4			    " Number of spaces per Tab
set clipboard=unnamedplus		    " Yank to the main clipboard 
set cursorline				    " highlight current line
set magic
set splitbelow				    " Split below (mostly for vim :term)

"" Advanced
set undolevels=1000			    " Number of undo levels
set backspace=indent,eol,start		    " Backspace behaviour
set ttimeoutlen=0			    " Remove delay when esc
set timeoutlen=1000			    " Same
au InsertEnter = set timeout		    " Same
au InsertLeave = set notimeout		    " Same
set wildmenu				    " set wildmenu
set lbr					    " set lbr

"}}}

"" Plugin configuration	{{{

"Gruvbox {{{
let g:gruvbox_contrast_dark = "hard"    
set background=dark			
colorscheme gruvbox			    " Same
syntax on				    " Nice colors 
set termguicolors			    " Fix for innacurate background colors
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"      " Specific scapes sequences for st 
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"      " Same	

"}}}

"LightLine {{{
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }
set laststatus=2
set noshowmode
set showtabline=1

"}}}

"Vim Indents {{{
let g:indent_guides_enable_on_vim_startup = 0

"}}}

"Sytastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"}}}

"Vimwiki {{{
let g:vimwiki_root = $HOME . '/dox/vimwiki'
let g:vimwiki_list = [{'path':$HOME . '/dox/vimwiki',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"set nocompatible
filetype plugin on 


"Plugins

"Ranger
let g:ranger_map_keys = 0

"vim fzf
let mapleader = "\<Space>"				
nnoremap <silent> <Leader>fh :History<CR>
nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>tc :Colors<CR>
nnoremap <silent> <Leader>fa :Rg<CR>
nnoremap <silent> <Leader>fb :Marks<CR>

"Dashboard
let g:dashboard_default_executive ='fzf'
nmap <leader>ss :SessionSave<CR>
nmap <leader>sl :SessionLoad<CR>

let g:dashboard_custom_shortcut={
  \ 'last_session'       : 'SPC s l',
  \ 'find_history'       : 'SPC f h',
  \ 'find_file'          : 'SPC f f',
  \ 'change_colorscheme' : 'SPC t c',
  \ 'find_word'          : 'SPC f a',
  \ 'book_marks'         : 'SPC f b',
  \ }

function VIM_WIKI()
    :VimwikiIndex
endfunction

  let g:dashboard_custom_header = [
        \ '',
	\ '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗', 
	\ '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║', 
	\ '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║', 
	\ '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║', 
	\ '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║', 
	\ '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝', 
	\ '',
        \ ]

"}}}

" Ranger
let g:ranger_replace_netrw = 1 

"Coc {{{
" TextEdit might fail if hidden is not "set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"if has("patch-8.1.1564")
"  " Recently vim can merge signcolumn and number column into one
"  set signcolumn=number
"else
"  set signcolumn=yes
"endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " setup formatexpr specified filetype(s).
  autocmd FileType typescript,json "setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"}}}

"}}}

"" Automatizations {{{
" Detect groff filetype
autocmd BufRead,BufNewFile *.ms,*.me,*.mom set filetype=groff

"Auto-compile groff documents
autocmd	BufWritePost *.ms :silent exec "!groff -ms % -T pdf > %.pdf"

" Auto-compile suckless config files
"autocmd BufWritePost config.h,config.def.h :term sudo make install 

"}}}

"" Bindings {{{
nnoremap <leader>h <C-w>h			
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>v :sp <CR>
nnoremap <leader>b :vsp <CR>
nnoremap <leader>c :tabnew <CR>
nnoremap <silent> <leader>q :Dashboard <CR>
nnoremap <silent> <leader>x :quit! <CR>
nnoremap <silent> <leader>wa :write <CR>
nnoremap <silent> <leader>wq :write <CR> :Dashboard <CR>
nnoremap <leader>p gT
nnoremap <leader>n gt

"}}}
