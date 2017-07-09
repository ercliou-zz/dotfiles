set nocompatible

let mapleader = "\<space>"
let maplocalleader = "\<space>"

" Pluggin settings {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-fugitive'

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


"Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <Leader>a :Ag<Space>
nnoremap <Leader>r :History:<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>p :FZF<CR>

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
Plug 'roosta/srcery'
Plug 'ayu-theme/ayu-vim'

" Clojure
Plug 'clojure-vim/acid.nvim'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

call plug#end()
" }}}

" Play
augroup play
  autocmd!
  autocmd FileType vim nnoremap <buffer> <Leader>c I" <Esc>
  autocmd FileType clojure iabbrev <buffer> try (try<CR><CR>(catch Exception e (prn e)))<up>
augroup end
onoremap p i(
onoremap in( :<C-U>normal! f(vi(

" Navigation settings {{{
" Navigate buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
" Previous buffer
nnoremap <BS> <C-^>

" Move lines
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" }}}

" Basic settings {{{
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

" save my left fingers
inoremap jk <esc>
inoremap kj <esc>


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
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>
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
