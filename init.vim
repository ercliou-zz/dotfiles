set nocompatible

let mapleader = "\<space>"
let maplocalleader = "\<space>"

" Pluggin settings {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'ercliou/potion.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'equalsraf/neovim-gui-shim'

Plug 'simeji/winresizer'
let g:winresizer_start_key = '<F4>'
let g:winresizer_vert_resize = 3

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='badwolf'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
"let g:airline#extensions#whitespace#enabled = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'

Plug 'blueyed/vim-diminactive'

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
nnoremap <Leader>a :Ag<CR>
nnoremap <Leader>r :History:<CR>
nnoremap <Leader>y :History<CR>
nnoremap <Leader>p :FZF<CR>
" Enable history with <C-p>
let g:fzf_history_dir=1
" Magic to ignore filename matches https://github.com/junegunn/fzf.vim/issues/346#issuecomment-288483704
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

Plug 'terryma/vim-smooth-scroll'
set scroll=15
noremap <silent> <C-U> :call smooth_scroll#up(&scroll, 12, 1)<CR>
noremap <silent> <C-D> :call smooth_scroll#down(&scroll, 12, 1)<CR>
noremap <silent> <C-B> :call smooth_scroll#up(&scroll*2, 12, 4)<CR>
noremap <silent> <C-F> :call smooth_scroll#down(&scroll*2, 12, 4)<CR>


Plug 'junegunn/rainbow_parentheses.vim'
augroup rainbow
  au!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup end

let g:rainbow#colors = {
\   'dark': [
\     ['yellow',  'orange1'     ],
\     ['green',   'yellow1'     ],
\     ['cyan',    'greenyellow' ],
\     ['magenta', 'green1'      ],
\     ['red',     'springgreen1'],
\     ['yellow',  'cyan1'       ],
\     ['green',   'slateblue1'  ],
\     ['cyan',    'magenta1'    ],
\     ['magenta', 'purple1'     ]
\   ],
\   'light': [
\     ['yellow',  'orange1'     ],
\     ['green',   'yellow1'     ],
\     ['cyan',    'greenyellow' ],
\     ['magenta', 'green1'      ],
\     ['red',     'springgreen1'],
\     ['yellow',  'cyan1'       ],
\     ['green',   'slateblue1'  ],
\     ['cyan',    'magenta1'    ],
\     ['magenta', 'purple1'     ]
\   ]
\ }

" Themes
"Plug 'roosta/srcery'
"Plug 'ayu-theme/ayu-vim'

" Clojure
Plug 'clojure-vim/acid.nvim'
"Plug 'clojure-vim/clj-refactor.nvim'
"Plug 'tpope/vim-fireplace'
Plug 'guns/vim-sexp'
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-repeat'
"
"Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

call plug#end()
" }}}

" Play
augroup play
  autocmd!
  autocmd FileType vim nnoremap <buffer> <Leader>c I" <Esc>
  autocmd FileType clojure iabbrev <buffer> try (try<CR><CR>(catch Exception e (prn e)))<up>
  autocmd FileType clojure set lispwords+=facts,fact
augroup end
onoremap p i(
onoremap in( :<C-U>normal! f(vi(

" highlight trailingThings ctermfg=red
" match trailingThings /\v\s+$/
nnoremap <leader>ec :rightbelow vsplit ~/dev/vim-monokai/colors/monokai.vim<CR>

nnoremap <F12> <C-w>hggdG<C-w>l

" TODO
" Different color for cursorline and status line
" Permanent window for Ag
" open VIMRC in existent split

" Golang {{{

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
" }}}

" Navigation settings {{{
" Navigate buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
" Previous buffer
nnoremap <BS> <C-^>

" Windows
tnoremap <C-A-h> <C-\><C-N><C-w>h
tnoremap <C-A-j> <C-\><C-N><C-w>j
tnoremap <C-A-k> <C-\><C-N><C-w>k
tnoremap <C-A-l> <C-\><C-N><C-w>l
inoremap <C-A-h> <C-\><C-N><C-w>h
inoremap <C-A-j> <C-\><C-N><C-w>j
inoremap <C-A-k> <C-\><C-N><C-w>k
inoremap <C-A-l> <C-\><C-N><C-w>l
nnoremap <C-A-h> <C-w>h
nnoremap <C-A-j> <C-w>j
nnoremap <C-A-k> <C-w>k
nnoremap <C-A-l> <C-w>l

" Move lines
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Enable HOME/END in Command mode
cnoremap <C-a> <home>
cnoremap <C-e> <end>

" Close buffer without destroying split
command Bd bp\|bd \#

" }}}

" Basic settings {{{
set inccommand=split
set noswapfile
set wildmenu
set hidden
set number
set list
set listchars=space:·,tab:→\ ,trail:·
set autoread
set scrolloff=3
set sidescrolloff=5
set mouse=a
colorscheme monokai
set pastetoggle=<F3>
" Remove - as keyword, so I can move in kebab-case
set iskeyword-=-
set splitbelow
set splitright

" cursor line
" lazyredraw so it lags only a bit :(
"set lazyredraw
" set cursorline
"augroup CursorLine
"  au!
"  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"  au WinLeave * setlocal nocursorline
"augroup END

" save my left fingers
inoremap jk <esc>
inoremap jj <esc>

" substitute
nnoremap <leader>ss :%s//gc<left><left><left>

" save
noremap <C-s> <esc>:w<CR>
inoremap <C-s> <esc>:w<CR>

" Lazy
" nnoremap ; :

" exit from :terminal
tnoremap jk <C-\><C-n>

" merge OS clipboard
set clipboard=unnamed

" avoid skipping lines when it's a wrapped line
nnoremap j gj
nnoremap k gk

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set nobackup		" do not keep a backup file, use versions instead
set undofile		" keep an undo file (undo changes after closing)
set history=1000
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
syntax on
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
" }}}

" VIMRC settings {{{
" Reload changes to .vimrc automatically
augroup reloadvimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
  autocmd FileType vim setlocal foldmethod=marker
augroup end
set foldlevelstart=0
" easy VIMRC access
"nnoremap <leader>ev :rightbelow vsplit $MYVIMRC<CR>
nnoremap <leader>ev <C-W>s<C-W>j<C-W>L:e $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<CR>
nnoremap <leader>eb <C-W>s<C-W>j<C-W>L:e ~/.bash_profile<cr>
" }}}

" Search settings {{{
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
set hlsearch
set incsearch		" do incremental searching
set ignorecase
set smartcase
nnoremap / /\v

" Keep cursor in the middle of screen when searching for next
" Also open fold if neccessary
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <Leader>F :execute "Ag " . expand("<cword>")<CR>
" }}}

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

augroup vimrcEx
au!

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

