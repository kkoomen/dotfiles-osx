" --------------------------------------------
"
"   general
"
" --------------------------------------------

" ==============================================================================
" Syntax
" ==============================================================================
syntax on                      " enable syntax highlighting
syntax enable

" ==============================================================================
" General
" ==============================================================================
set hidden                     " Hide when switching buffers, don't unload
set mouse=a                    " Enable mouse in all modes
set nowrap                     " No word wrap
set number                     " Show line numbers
set nocursorline               " Disable cursor line (makes vim very slow)
set title                      " Use filename in window title
set ttyfast                    " Indicates a fast terminal connection
set lazyredraw                 " Will buffer screen updates instead of updating all the time
set clipboard=unnamed          " Enable clipboard
set autoread                   " Set to auto read when a file is changed from the outside
set nospell                    " Disable spellcheck on default
set colorcolumn=81             " Highlight the 80th column
set so=7                       " Minimal number of screen lines to keep above and below the cursor when scrolling
set tw=80                      " Set a max text width
set nocompatible               " Use vim defaults instead of vi
set backspace=indent,eol,start " Set priorities for the backspace key

" Make certain chars visible
exec "set listchars=tab:>>,trail:\uB7"
set list

" Search
set ignorecase                 " Case insensitive
set incsearch                  " Show match as search proceeds
set hlsearch                   " Search highlighting

" Tabs
set autoindent                 " Copy indent from previous line
set smartindent                " Auto indent when starting a new line
set expandtab                  " Replace tabs with spaces
set shiftwidth=2               " Spaces for autoindenting
set smarttab                   " <BS> removes shiftwidth worth of spaces
set softtabstop=2              " Spaces for editing, e.g. <Tab> or <BS>
set tabstop=2                  " Spaces for <Tab>

" ==============================================================================
" Textwidth
" ==============================================================================
"
" Keeps the visual textwidth but doesn't add new line in insert mode when
" passing the 'tw' value.
" -----------------------------------------------------------------------
autocmd FileType * set formatoptions-=t
autocmd FileType .* set formatoptions-=t

" ==============================================================================
" Expand bash aliases
" ==============================================================================
"
" Make our custom aliases available within a non-interactive vim.
" ------------------------------------------------------------------------------
let $BASH_ENV = "~/.bash_aliases"

" ==============================================================================
" Wildmenu
" ==============================================================================
set wildmenu
set wildmode=list:longest,full
set wildignore+=.gitkeep
set wildignore+=.hg,.git,.svn
set wildignore+=*.exe,*.dll
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" ==============================================================================
" Enable pathogen
" ==============================================================================
call pathogen#infect()

" ==============================================================================
" File detection
" ==============================================================================
filetype plugin indent on

" ==============================================================================
" Syntax
" ==============================================================================
let python_highlight_all = 1
let python_highlight_space_errors = 0

" ==============================================================================
" Color scheme
" ==============================================================================
set background=dark
let g:gruvbox_bold = 0
let g:gruvbox_termcolors=16
let g:gruvbox_invert_selection=0
colorscheme gruvbox

" ==============================================================================
" Autocompletion
" ==============================================================================
"
"  - Append extra characters to the 'iskeyword' for autocompletion.
"  - Enable omni completion.
" ------------------------------------------------------------------------------
set iskeyword+=-
autocmd FileType * setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" ==============================================================================
" UTF8 encoding
" ==============================================================================
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" ==============================================================================
" Hooks
" ==============================================================================
autocmd BufWritePre * :call OnBufWritePre()
autocmd BufReadPost * :call OnBufReadPost()

" ==============================================================================
" Undo history
" ==============================================================================
set undofile                  " Save undo's after file closes
set undodir=~/.vim/undo,/tmp " where to save undo histories
set undolevels=1000          " How many undos
set undoreload=10000         " number of lines to save for undo
set history=500              " sets how many lines of history VIM has to remember

" ==============================================================================
" Swap files
" ==============================================================================
set directory=~/.vim/swap,~/tmp,.
set backupdir=~/.vim/backup,~/tmp,.
set noswapfile
set nobackup

" ==============================================================================
" Filetypes
" ==============================================================================
if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.blade.php set filetype=php
    autocmd BufRead,BufNewFile *.theme set filetype=php
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
  augroup END

  " General
  augroup general
    autocmd BufNewFile,BufRead *.bash_* set ft=sh
    autocmd BufNewFile,BufRead *.sh set ft=sh
    autocmd BufRead,BufNewFile *.js set filetype=javascript
    autocmd BufRead,BufNewFile *.json set filetype=javascript
  augroup END
endif

" ------------------------------------------------------------------------------
"
"   Functions
"
" ------------------------------------------------------------------------------

" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction

function! OnBufWritePre()
  " Delete trailing whitespaces at the end of each line.
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"

  " Convert remaining tabs to spaces
  %retab
endfunc

" Set the last edit position
function! OnBufReadPost()
  if line("'\"") > 0 && line("'\"") <= line("$") |
    exe "normal! g`\"" |
  endif
endfunction

" ------------------------------------------------------------------------------
"
"   mapping
"
" ------------------------------------------------------------------------------


" ==============================================================================
" Leader key
" ==============================================================================
let mapleader = "\<Space>"

" ==============================================================================
" buffers
" ==============================================================================
nnoremap Z :bprev<cr>
nnoremap X :bnext<cr>
nnoremap Q :bw<cr>

" ==============================================================================
" Moving lines up or down
" ==============================================================================
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

" ==============================================================================
" Set pastetoggle
" ==============================================================================
set pastetoggle=<F2>

" ==============================================================================
" System clipboard pasting
" ==============================================================================
nnoremap <Leader>y :call system('xclip', @0)<cr>
nnoremap <Leader>p "+p

" ==============================================================================
" Commenting
" ==============================================================================
map <C-c> <Leader>cm<cr>
map <C-x> <Leader>cu<cr>
map <C-a> <Leader>cs<cr>

" ==============================================================================
" Rot13
" ==============================================================================
nnoremap <silent> <F6> ggg?G<cr>

" ==============================================================================
" Space bar un-highligts search
" ==============================================================================
noremap <silent> <Space> :silent noh<Bar>echo<CR>

" ==============================================================================
" Saving file as sudo in non-sudo opened file
" ==============================================================================
"
" Allow saving of files as sudo when I forgot to start vim using sudo.
" ------------------------------------------------------------------------------
cnoremap w!! w !sudo tee > /dev/null %

" ==============================================================================
" Spell check
" ==============================================================================
nnoremap <leader>sc :setlocal spell!<cr>

" ==============================================================================
" Remove ^M
" ==============================================================================
noremap <Leader>m :%s/\r//g<cr>

" ==============================================================================
" Map ; to : for simplicity
" ==============================================================================
noremap ; :


" ==============================================================================
" Selection
" ==============================================================================
"
" Make selection stay
" ------------------------------------------------------------------------------
noremap > >gv
noremap < <gv

" ==============================================================================
" Auto complete
" ==============================================================================
"inoremap <expr> <tab> InsertTabWrapper()

" ==============================================================================
" Typo's while saving
" ==============================================================================
"
" Avoid saving files like ; and w; and other typos
" ------------------------------------------------------------------------------
cnoremap w; w
cnoremap w: w

cnoremap x; x
cnoremap x: x


" ------------------------------------------------------------------------------
"
"   plugins
"
" ------------------------------------------------------------------------------

" ==============================================================================
" HTML Close Tag
" ==============================================================================
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.tpl,*.twig,*.htm,*.php,*.pug,*.jsx"

" ==============================================================================
" auto-pairs
" ==============================================================================
let g:AutoPairsMultilineClose = 0

" ==============================================================================
" Templating
" ==============================================================================
let g:username = "Kim Koomen"
let g:email = 'koomen@protonail.com'

let g:templates_user_variables = [
  \   ['FILE_OR_DIRECTORY', 'GetFileOrDirectory'],
  \ ]

function! GetFileOrDirectory()
  " A structure we have with React apps is: dir/index.jsx
  " and if we have this, we want the index.jsx have the directory name.
  let filename = expand('%:t:r')
  let directory = expand('%:p:h:t')
  if filename == 'index'
    return directory
  else
    return filename
  endif
endfunction

" ==============================================================================
" vim-jsx
" ==============================================================================
let g:jsx_ext_required = 0

" ==============================================================================
" Indentline
" ==============================================================================
let g:indentLine_char = '|'

" ==============================================================================
" Ultisnips
" ==============================================================================
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"let g:UltiSnipsSnippetDirectories = ['~/.vim/snippets/UltiSnips', 'UltiSnips']
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

" ==============================================================================
" Emmet
" ==============================================================================
"
"  After the leader key you should always enter a comma to trigger emmet.
" ------------------------------------------------------------------------------
let g:user_emmet_leader_key='<C-f>'

" ==============================================================================
" CtrlP
" ==============================================================================
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|data\|log\|tmp$\|node_modules\|bower_components',
  \ 'file': '\.exe$\|\.swp$\|\.swo$\|\.jpg$\|\.bmp$\|\.gif$\|\.png$\|\.jpeg$\|\.dll$\|\.exe$\|\.zip$\|\.tar\.gz$\|\.tar\.bz2$\|\.rar$\|\.tar\.xz$'
  \ }

" https://github.com/FelikZ/ctrlp-py-matcher
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Use git and use the .gitignore to also exclude those files.
" NOTE: If you use the g:ctrlp_user_command you can't use g:ctrlp_custom_ignore,
" since you determine the ignored files with your user command.
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" ==============================================================================
" GitGutter
" ==============================================================================
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = 'M-'

" If you experience a lag, you can trade speed for accuracy
"let g:gitgutter_realtime = 0
"let g:gitgutter_eager = 0

" ==============================================================================
" Supertab
" ==============================================================================
let g:SuperTabCrMapping = 0
let g:SuperTabDefaultCompletionType = 'context'
"let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabContextDefaultCompletionType = '<c-x><c-u>'
autocmd FileType *
    \ if &omnifunc != '' |
    \     call SuperTabChain(&omnifunc, '<c-p>') |
    \ endif

" ==============================================================================
" Airline
" ==============================================================================
let g:airline_theme='base16_grayscale'

" ==============================================================================
" Ale
" ==============================================================================
let g:ale_sign_error = '••'
let g:ale_sign_warning = '•'

" Open list of errors when new buffer opens
let g:ale_open_list = 0

" Unset loclist and enable quickfix list
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_enter = 0
let g:ale_php_phpcs_standard = 'Drupal'
let g:ale_linters = {
      \   'php': [],
      \   'javascript': [],
      \   'jsx': ['stylelint', 'eslint'],
      \}
let g:ale_linter_aliases = {'jsx': 'css'}

" Do not lint or fix minified files.
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}

" ==============================================================================
" Prettier
" ==============================================================================
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
noremap <Leader>p :PrettierAsync<cr>
