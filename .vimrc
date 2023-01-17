filetype plugin indent on

set autoindent       " Auto indent if no filetype-specific indenting is enabled
set autoread         " Read file changes that happen outside of vim
set cursorline       " Highlight current line
set encoding=utf-8   " Default encoding
set formatoptions+=j " Delete comment character when joining commented lines
set gdefault         " Assume the /g flag on :s substitutions
set hidden           " Allow 'hidden' buffers
set history=1000     " Keep 1000 lines of command history
set laststatus=2     " Always display the statusline
set lazyredraw       " Don't redraw when executing macros
set nojoinspaces     " Don't insert two spaces after a period when joining lines
set noswapfile       " Disable swap files
set nowrap           " Disable wrapping for long lines
set number           " Show line numbers
set scrolloff=4      " Keep a few lines above and below current line
set selection=old    " Don't include newline characters in visual mode
set showcmd          " Show commands as you type them
set sidescroll=1     " Scroll left/right one character at a time
set sidescrolloff=4  " Keep a few characters visible to the left and right of the cursor
set signcolumn=yes   " Always display the sign column
set termguicolors    " Enable true colors
set title            " Show file in title bar
set ttimeoutlen=0    " Reduce timeout when hitting the esc key
set ttyfast          " Faster rendering
set updatetime=100   " Fire CursorHold event more often, used by vim-signify
set visualbell       " Blink cursor on error instead of beeping

set backspace=indent,eol,start        " Allow backspacing over everything in insert mode
set fdm=indent fdls=99 nofen          " Enable folding based on indentation
set hlsearch incsearch                " Incrementally highlight searches
set ignorecase smartcase              " Use case insensitive search, except when using capital letters
set listchars=leadmultispace:\|\      " Display lines at each indentation level
set smarttab expandtab sw=2 ts=2      " Use two spaces for a tab
set spell spelllang=en,nl             " Enable spell checking for English and Dutch
set splitbelow splitright             " Move cursor to split window
set statusline=\%f\ %m%=\ %l:%c\ \ %P " Custom statusline, looks like this: .vimrc [+] <> 10:15 TOP
set undofile undodir=~/.vim/undo      " Enable persistent undo
set virtualedit=block                 " Allow virtual editing in block mode
set wildmenu wim=longest:full,full    " Enhanced command line completion

" Automatically equalise splits when Vim is resized
autocmd VimResized * wincmd =

" Hide statusline when using fzf.vim
autocmd! FileType fzf set laststatus=0 | autocmd BufLeave <buffer> set laststatus=2

" Allow for some common typos
command! W :w
command! Wa :wa
command! Wq :wq
command! Q :q
command! Qa :qa

" Make Y behave like C and D
nnoremap Y y$

" Disable Ex mode and repurpose Q to repeat 'q' macro
nnoremap Q @q

" Set <space> as the leader for mappings
let mapleader=' '
nnoremap <space> <nop>

" Open current directory, inspired by tpope's vim-vinegar
nnoremap <silent>- :call OpenDir()<CR>
function! OpenDir()
  const current_file = expand('%')
  if current_file =~# '^$\|^term:[\/][\/]' " handle empty files
    silent keepalt edit .
  else
    silent keepalt edit %:h
    const pattern = printf('\V\^%s\$', fnamemodify(current_file, ':t'))
    call search(pattern, 'c')
  endif
endfunction

" Turn off search highlighting until the next search
nnoremap <leader>l :nohlsearch<CR>

" Indent without losing selection
xnoremap < <gv
xnoremap > >gv

" Mappings for ALE
nnoremap <silent><leader>js :ALEGoToDefinition<CR>
nnoremap <silent><leader>jst :ALEGoToTypeDefinition<CR>

" Mappings for fzf.vim
nnoremap <silent><leader>jf :GFiles --cached --others --exclude-standard<CR>
nnoremap <silent><leader>jaf :Files<CR>
nnoremap <silent><Leader>jd :Rg!<C-R><C-W><CR>
nnoremap <silent><Leader>jad :Rg!<CR>
nnoremap <silent><Leader>jh :History<CR>
nnoremap <silent><Leader>be :Buffers<CR>

" Exclude filenames from Rg searches
command! -bang -nargs=* Rg call fzf#vim#grep(
  \ 'rg -p --column --no-heading --smart-case --hidden -- '.shellescape(<q-args>),
  \ 1, fzf#vim#with_preview({ 'options': '--delimiter : --nth 4..' }), <bang>0)

" Mappings for Signify
nnoremap <silent><leader>gd :SignifyDiff<CR>
nnoremap <silent><leader>gp :SignifyHunkDiff<CR>
nnoremap <silent><leader>gu :SignifyHunkUndo<CR>

" Copy relative path of current buffer to system clipboard
nnoremap <silent><leader>cf :let @+=expand('%:.') \| :ec 'Copied path to clipboard.'<CR>

" Paste without adding to the register in visual mode
xnoremap <expr>p 'pgv"'.v:register.'y`>'
xnoremap <expr>P 'Pgv"'.v:register.'y`>'

" Toggle spell
nnoremap <silent><leader>ts :set spell!<CR>

" Toggle list to display indentation lines
nnoremap <silent><leader>tl :set list!<CR>

" Toggle colorcolumn between 80 and off
nnoremap <expr><silent><leader>tc &cc ? ':set cc&<CR>' : ':set cc=80<CR>'

" fzf.vim settings
let g:fzf_layout = { 'down': '12' }
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']

" Signify settings
let g:signify_sign_change = '~'
let g:signify_sign_show_count = 0

" ALE settings
let g:ale_virtualtext_cursor = 'current'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\  '*': ['trim_whitespace'],
\  'typescript': ['eslint'],
\  'typescriptreact': ['eslint'],
\  'javascript': ['eslint'],
\  'javascriptreact': ['eslint'],
\  'scss': ['prettier'],
\  'json': ['jq']
\}

" SuperTab settings
let g:SuperTabDefaultCompletionType = '<c-n>'
let g:SuperTabCrMapping = 1

" vim-rails settings
let g:rails_path_additions = ['app/*/*']

" auto-pairs settings
let g:AutoPairsCompatibleMaps = 0
let g:AutoPairsShortcutBackInsert = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsMapBS = 1
let g:AutoPairsBSAfter = 0

call plug#begin()

Plug 'hugovandevliert/vim-life'
Plug 'hugovandevliert/vim-solarized-flat'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'mhinz/vim-signify'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-apathy'
Plug 'slim-template/vim-slim'
Plug 'lunarwatcher/auto-pairs'

call plug#end()

syntax on
colorscheme solarized_flat
