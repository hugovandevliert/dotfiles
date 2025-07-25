set autoindent                     " Auto indent if no filetype-specific indenting is enabled
set autoread                       " Read file changes that happen outside of vim
set backspace=indent,eol,start     " Allow backspacing over everything in insert mode
set completeopt=menu,menuone       " Disable preview window for completion
set cursorline                     " Highlight current line
set display=truncate               " Truncate very long lines
set encoding=utf-8                 " Default encoding
set fdm=indent fdls=99 nofen       " Enable folding based on indentation
set formatoptions+=j               " Delete comment character when joining commented lines
set gdefault                       " Assume the /g flag on :s substitutions
set hidden                         " Allow 'hidden' buffers
set history=1000                   " Keep 1000 lines of command history
set hlsearch incsearch             " Incrementally highlight searches
set ignorecase smartcase           " Use case insensitive search, except when using capital letters
set laststatus=2                   " Always display the statusline
set lazyredraw                     " Don't redraw when executing macros
set listchars=leadmultispace:\|\   " Display lines at each indentation level
set nojoinspaces                   " Don't insert two spaces after a period when joining lines
set noswapfile                     " Disable swap files
set nowrap                         " Disable wrapping for long lines
set number                         " Show line numbers
set scrolloff=4                    " Keep a few lines above and below current line
set selection=old                  " Don't include newline characters in visual mode
set shortmess+=c                   " Disable completion messages
set showcmd                        " Show commands as you type them
set sidescroll=1                   " Scroll left/right one character at a time
set sidescrolloff=4                " Keep a few characters visible to the left and right of the cursor
set signcolumn=yes                 " Always display the sign column
set smarttab expandtab sw=2 ts=2   " Use two spaces for a tab
set spell spelllang=en,nl          " Enable spell checking for English and Dutch
set splitbelow splitright          " Move cursor to the expected split window
set stl=\%f\ %m%=\ %l:%c\ \ %P     " Custom statusline, looks like this: .vimrc [+] <> 10:15 TOP
set termguicolors                  " Enable true colors
set title                          " Show file in title bar
set ttimeoutlen=0                  " Reduce timeout when hitting the esc key
set ttyfast                        " Faster rendering
set undofile undodir=~/.vim/undo   " Enable persistent undo
set updatetime=100                 " Fire CursorHold event more often, used by vim-signify
set virtualedit=block              " Allow virtual editing in block mode
set visualbell                     " Blink cursor on error instead of beeping
set wildmenu wim=longest:full,full " Enhanced command line completion

" Use a line cursor shape in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Automatically equalise splits when Vim is resized
autocmd VimResized * wincmd =

" Only highlight current line in the active window
autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" Disable spell checking, line numbers and the sign column in terminal windows
autocmd TerminalWinOpen * setlocal nospell nonumber signcolumn=no

" Hide statusline when in fzf windows
autocmd FileType fzf set laststatus=0 | autocmd BufLeave <buffer> set laststatus=2

" Disable spell checking for certain buffer types
autocmd FileType ale-preview-selection,diff,gitrebase,nofile,railslog setlocal nospell

" Treat properties with hyphens as a single words in css files
autocmd FileType css,less,scss setlocal iskeyword+=-

" Allow for some common typos
command! W :w
command! Wa :wa
command! Wq :wq
command! Wqa :wqa
command! WQ :wq
command! Q :q
command! Qa :qa

" Sane movement when wrap is enabled
nnoremap j gj
nnoremap k gk

" Make Y behave like C and D
nnoremap Y y$

" Disable Ex mode and repurpose Q to repeat 'q' macro
nnoremap Q @q

" Indent without losing selection
xnoremap < <gv
xnoremap > >gv

" Easy quickfix list navigation
nnoremap ]q :cn<CR>
nnoremap [q :cp<CR>

" Paste without adding to the register in visual mode
xnoremap <expr>p 'pgv"'.v:register.'y`>'
xnoremap <expr>P 'Pgv"'.v:register.'y`>'

" Open current directory, inspired by tpope's vim-vinegar
nnoremap <silent>- :call OpenDir()<CR>
function! OpenDir()
  const current_file = expand('%')
  if current_file =~# '^$\|^term:[\/][\/]' " handle empty files
    silent keepalt edit .
  else
    silent keepalt edit %:h
    const pattern = printf('^%s\/\?\%(\s\{2,}\|\s-->\s\|$\)', fnamemodify(current_file, ':t'))
    call search(pattern, 'c')
  endif
endfunction

" Set <space> as the leader for mappings
let mapleader=' '
nnoremap <space> <nop>

" Copy relative path of current buffer to system clipboard
nnoremap <silent><leader>cf :let @+=expand('%:.') \| :ec 'Copied path to clipboard.'<CR>

" Sort in visual mode
xnoremap <silent><leader>s :sort<CR>

" Toggle spell
nnoremap <silent><leader>ts :set spell!<CR>

" Toggle list to display indentation lines
nnoremap <silent><leader>tl :set list!<CR>

" Toggle colorcolumn between 80 and off
nnoremap <expr><silent><leader>tc &cc ? ':set cc&<CR>' : ':set cc=80<CR>'

" Toggle wrap
nnoremap <silent><leader>tw :set wrap!<CR>

" Toggle ALE
nnoremap <leader>ta :ALEToggle<CR>

" Mappings for ALE
nnoremap <silent>]e :ALENextWrap<CR>
nnoremap <silent>[e :ALEPreviousWrap<CR>
nnoremap <silent><leader>jr :ALEFindReferences -relative<CR>
nnoremap <silent><leader>js :ALEGoToDefinition<CR>
nnoremap <silent><leader>jst :ALEGoToTypeDefinition<CR>

" Mappings for fzf.vim
nnoremap <silent><leader>jf :GFiles --cached --others --exclude-standard<CR>
nnoremap <silent><leader>jgf :GFiles?<CR>
nnoremap <silent><leader>jaf :Files<CR>
nnoremap <silent><Leader>jd :Rg!<C-R><C-W><CR>
nnoremap <silent><Leader>jad :Rg!<CR>
nnoremap <silent><Leader>jh :History<CR>
nnoremap <silent><Leader>jb :Buffers<CR>

" Mappings for vim-signify
nnoremap <silent><leader>gd :SignifyDiff<CR>
nnoremap <silent><leader>gp :SignifyHunkDiff<CR>
nnoremap <silent><leader>gu :SignifyHunkUndo<CR>

" Mappings for copilot.vim
inoremap <C-]> <Plug>(copilot-next)
inoremap <C-L> <Plug>(copilot-accept-word)
inoremap <C-\> <Plug>(copilot-suggest)

" fzf.vim settings
let g:fzf_layout = { 'down': '12' }
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']

" vim-signify settings
let g:signify_sign_add = '┃'
let g:signify_sign_delete = '┃'
let g:signify_sign_change = '┃'
let g:signify_sign_show_count = 0
let g:signify_skip = { 'vcs': { 'allow': ['git'] } }

" ALE settings
let g:ale_virtualtext_cursor = 'disabled'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\  '*': ['trim_whitespace'],
\  'typescript': ['eslint', 'prettier'],
\  'typescriptreact': ['eslint', 'prettier'],
\  'javascript': ['eslint', 'prettier'],
\  'javascriptreact': ['eslint', 'prettier'],
\  'scss': ['prettier'],
\  'json': ['jq']
\}
let g:ale_linters_ignore = ['brakeman'] " Brakeman can be very slow.

" vim-ruby settings
let g:ruby_indent_assignment_style = 'variable'

" vim-rails settings
let g:rails_path_additions = ['app/*/*']

" auto-pairs settings
let g:AutoPairsShortcutBackInsert = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsMapBS = 1
let g:AutoPairsBSAfter = 0

call plug#begin()

Plug 'hugovandevliert/vim-life'
Plug 'hugovandevliert/vim-solarized-flat'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'bourgeoisbear/clrzr'
Plug 'github/copilot.vim'
Plug 'hotwatermorning/auto-git-diff'
Plug 'rhysd/conflict-marker.vim'
Plug 'lunarwatcher/auto-pairs'
Plug 'andrewradev/tagalong.vim'
Plug 'romainl/vim-cool'
Plug 'vimpostor/vim-lumen'
Plug 'slim-template/vim-slim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

call plug#end()

colorscheme solarized_flat
