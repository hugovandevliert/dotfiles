set nocompatible

filetype plugin indent on

if (has("termguicolors"))
  set termguicolors
endif

" Show line numbers
set number

" Show file stats
set ruler

" Show file in title bar
set title

" Show commands as you type them
set showcmd

" Blink cursor on error instead of beeping
set visualbell

" Default encoding
set encoding=utf-8

" Read filechanges that happen outside of vim
set autoread

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Use smart tabs
set smarttab

" Favor spaces over tabs
set expandtab

" Use two spaces for a tab
set shiftwidth=2
set tabstop=2

" Use system clipboard
set clipboard=unnamed

" Disable wrapping for long lines
set nowrap

" Keep a few lines above and below current line
set scrolloff=4

" Keep a few characters visible to the left/right of the cursor
set sidescrolloff=4

" Scroll left/right one character at a time
set sidescroll=1

" Always create equally sized splits
set equalalways

" Faster rendering
set ttyfast

" Always show a status bar
set laststatus=2

" Enhanced command line completion
set wildmenu
set wildmode=list:longest,full

" Allow the usage of multiple buffers
set hidden

" Use case insensitive search, except when using capital letters
set ignorecase smartcase

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Highlight searches (use <C-L> to temporarily turn off highlighting)
set hlsearch

" Highlight search results during typing
set incsearch

" Reduce timeout when hitting the esc key
set timeoutlen=1000 ttimeoutlen=0

" Write to swap file more often
set updatetime=100

" Always display the sign column
set signcolumn=yes

" Move cursor to split window
set splitbelow splitright

" Enable spellchecking
set spell spelllang=en,nl

" Enable folding based on syntax
set foldmethod=indent
set foldlevel=999
set nofoldenable

" Don't redraw when executing macros
set lazyredraw

" Delete comment character when joining commented lines
set formatoptions+=j

" Keep 1000 lines of command history
set history=1000

" Save swap files to ~/.vim/swap
set directory=$HOME/.vim/swap//

" Assume the /g flag on :s substitutions to replace all matches in a line
set gdefault

" Allow for some common typo's
command! W :w
command! Q :q

" Disable vim recording
map q <Nop>

" set <space> as the leader for mappings
let mapleader=' '
nnoremap <space> <nop>

" Map <C-L> to also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L>

" Mappings for fzf file jumping
nnoremap <leader>jf :GFiles --cached --others --exclude-standard<CR>
nnoremap <leader>jaf :Files<CR>

" Mappings for Rg
nnoremap <Leader>jd :Rg <C-R><C-W><CR>
nnoremap <Leader>jad :Rg <CR>

" Exclude filenames from Rg searches
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" Mappings and settings for signify
nnoremap <leader>gd :SignifyDiff<CR>
nnoremap <leader>gp :SignifyHunkDiff<CR>
nnoremap <leader>gu :SignifyHunkUndo<CR>
let g:signify_sign_change = '~'
let g:signify_sign_show_count = 0

" Copy relative path of current buffer
nnoremap <leader>cf :let @*=expand('%')<CR>

" Open the current directory
nnoremap <leader>- :Expl<CR>

" Paste without adding to the register in visual mode
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'

" ALE settings
let g:ale_set_highlights = 0
let g:ale_linters = {
  \  'ruby': ['rubocop'],
  \  'typescript': ['eslint'],
  \  'javascript': ['eslint'],
  \}
let g:ale_fix_on_save = 1
let g:ale_fixers = { '*': ['trim_whitespace'] }

" SuperTab settings
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 1

" Airline settings
let g:airline_extensions = []
let g:airline_section_b = ''
let g:airline_section_y = ''
let g:airline_section_z = "line %l/%L - %p%%"
let g:airline_detect_spell=0
let g:airline_detect_spelllang=0

call plug#begin()

Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'slim-template/vim-slim'
Plug 'dense-analysis/ale'
Plug 'jlanzarotta/bufexplorer'

call plug#end()

syntax on
colorscheme onedark

