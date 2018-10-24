" Basic setup {{{

syntax on                         " Enable syntax highlighting.
filetype plugin indent on         " Enable file detection.
set hidden                        " Hide when switching buffers, don't unload.
set mouse=a                       " Enable mouse in all modes.
set nowrap                        " No word wrap.
set number                        " Show line numbers.
set nocursorline                  " Disable cursor line (makes vim very slow).
set title                         " Use filename in window title.
set ttyfast                       " Indicates a fast terminal connection.
set lazyredraw                    " Will buffer screen updates instead of updating all the time.
set clipboard=unnamed             " Enable clipboard.
set autoread                      " Set to auto read when a file is changed from the outside.
set nospell                       " Disable spellcheck on default.
set so=7                          " Minimal number of screen lines to keep above and below the cursor when scrolling.
set tw=79                         " Set a max text width.
set nocompatible                  " Use vim defaults instead of vi.
set backspace=indent,eol,start    " Set priorities for the backspace key.
set foldenable foldmethod=marker  " Enable folding.
set list listchars=tab:>>,trail:• " Make additional characters visible.
set completeopt-=preview          " Disable scratch preview window.
set infercase                     " Enable ignorecase for keyword completion.
set diffopt=filler,iwhite         " Ignore whitespace as well when diffing.

" Make our custom aliases available within a non-interactive vim.
" -----------------------------------------------------------------------------
let $BASH_ENV = "~/.bash_aliases"

" Enable Pathogen
" -----------------------------------------------------------------------------
call pathogen#infect()

" }}}
" Search {{{

set ignorecase " Case insensitive.
set incsearch  " Show match as search proceeds.
set hlsearch   " Search highlighting.

" }}}
" Indentation {{{

set autoindent    " Copy indent from previous line.
set smartindent   " Auto indent when starting a new line.
set expandtab     " Replace tabs with spaces.
set shiftwidth=2  " Spaces for autoindenting.
set smarttab      " <BS> removes shiftwidth worth of spaces.
set softtabstop=2 " Spaces for editing, e.g. <Tab> or <BS>.
set tabstop=2     " Spaces for <Tab>.
set shiftround    " Round indent to multiple of 'shiftwidth'.

" }}}
" Encoding {{{

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" }}}
" Wildmenu {{{

set wildmenu
set wildignorecase
set wildmode=list:longest,full
set wildignore+=.gitkeep
set wildignore+=.hg,.git,.svn
set wildignore+=*.exe,*.dll
set wildignore+=*.swp,*.tmp
set wildignore+=*.mp3,*.mp4,*.mkv
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=*.rar,*.zip,*.tar,*.tar.gz,*.tar.xz,*.tar.bz2
set wildignore+=*.pdf,*.doc,*.docx,*.ppt,*.pptx

" }}}
" Color scheme {{{

set background=dark
let g:gruvbox_bold = 0
let g:gruvbox_termcolors=16
let g:gruvbox_invert_selection=0
colorscheme gruvbox

" }}}
" ColorColumn {{{

" Only highlight the color column when the line is expanding the 80th column.
highlight ColorColumn ctermbg=red ctermfg=white
call matchadd('ColorColumn', '\%80v.', 100)

" }}}
" Omni completion {{{

"  Enable omni completion and enable more characters to be available within
"  autocomplete by appending to the 'iskeyword' variable.

set iskeyword+=-
autocmd FileType * setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript,javascript.jsx,jsx setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" }}}
" Undo history {{{

set undofile                 " Save undo's after file closes.
set undodir=~/.vim/undo,/tmp " Where to save undo histories.
set undolevels=1000          " How many undos.
set undoreload=10000         " Number of lines to save for undo.
set history=1000             " Sets how many lines of history vim has to remember.

" }}}
" Swap files {{{

set directory=~/.vim/swap,~/tmp,.
set backupdir=~/.vim/backup,~/tmp,.
set noswapfile
set nobackup

" }}}
" Filetypes {{{

" Drupal *.module and *.install files.
augroup drupal
  autocmd!
  autocmd BufRead,BufNewFile *.blade.php set filetype=php
  autocmd BufRead,BufNewFile *.theme set filetype=php
  autocmd BufRead,BufNewFile *.module set filetype=php
  autocmd BufRead,BufNewFile *.install set filetype=php
  autocmd BufRead,BufNewFile *.test set filetype=php
  autocmd BufRead,BufNewFile *.inc set filetype=php
  autocmd BufRead,BufNewFile *.profile set filetype=php
  autocmd BufRead,BufNewFile *.view set filetype=php
augroup END

augroup bash
  autocmd!
  autocmd BufNewFile,BufRead *.bash_* set ft=sh
  autocmd BufNewFile,BufRead *.sh set ft=sh
augroup END

augroup javascript
  autocmd!
  "autocmd BufRead,BufNewFile *.js set filetype=javascript
  autocmd BufRead,BufNewFile *.mdx,*.js,*.jsx set filetype=javascript.jsx
  autocmd BufRead,BufNewFile *.json set filetype=javascript
augroup END

" }}}
" Functions {{{

function OnBufWritePre()
  " Delete trailing whitespaces at the end of each line.
  %s/\s\+$//ge

  " Delete empty lines at the end of a file.
  v/\n*./d

  " Convert remaining tabs to spaces.
  %retab
endfunction

" Set the last edit position.
function OnBufReadPost()
  if line("'\"") > 0 && line("'\"") <= line("$") |
    exe "normal! g`\"" |
  endif
endfunction

" }}}
" Hooks {{{

autocmd BufWritePre * :call OnBufWritePre()
autocmd BufReadPost * :call OnBufReadPost()

" }}}
" Mappings {{{

" Leader key
" ------------------------------------------------------------------------------
let mapleader = "\<Space>"

" buffers
" ------------------------------------------------------------------------------
nnoremap Z :bprev<cr>
nnoremap X :bnext<cr>
nnoremap Q :bw<cr>

" Moving lines up or down
" ------------------------------------------------------------------------------
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

" Set pastetoggle
" ------------------------------------------------------------------------------
set pastetoggle=<F2>

" Rot13
" ------------------------------------------------------------------------------
nnoremap <silent> <F6> ggg?G<cr>

" Space bar un-highligts search
" ------------------------------------------------------------------------------
noremap <silent> <Space> :silent noh<Bar>echo<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo
" ------------------------------------------------------------------------------
cnoremap w!! w !sudo tee > /dev/null %

" Spell check
" ------------------------------------------------------------------------------
nnoremap <leader>sc :setlocal spell!<cr>

" Remove ^M
" ------------------------------------------------------------------------------
noremap <Leader>m :%s/\r//g<cr>

" Map ; to : for simplicity & efficiency
" ------------------------------------------------------------------------------
noremap ; :

" Map ; to :B in combination with the vis.vim plugin
" ------------------------------------------------------------------------------
" The vis.vim plugin allows us to apply a command in visual-block mode only to
" the selected block instead of the whole line. To do so, every command has to
" be prefixed with 'B' which ends up in: '<, '>B [command].
" ------------------------------------------------------------------------------
vnoremap ; :B<space>

" Selection
" ------------------------------------------------------------------------------
" Make selection stay after keypress.
" ------------------------------------------------------------------------------
noremap > >gv
noremap < <gv

" Auto complete
" ------------------------------------------------------------------------------
"inoremap <expr> <tab> InsertTabWrapper()

" Typo's while saving
" ------------------------------------------------------------------------------
" Avoid saving files like ; and w; and other typos
" ------------------------------------------------------------------------------
cnoremap w; w
cnoremap w: w
cnoremap W; w
cnoremap W: w
cnoremap ww w
cnoremap Ww w
cnoremap wW w
cnoremap WW w

" }}}
" Format options {{{

au FileType * set fo-=o

" }}}
" Plugins: HTML Close Tag {{{

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.tpl,*.twig,*.htm,*.php,*.pug,*.jsx,*.js,*.mdx"

" }}}
" Plugins: auto-pairs {{{

let g:AutoPairsMultilineClose = 0

" }}}
" Plugins: Templates {{{

let g:username = 'Kim Koomen'
let g:email = 'koomen@protonail.com'
let g:license = 'MIT'

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

" }}}
" Plugins: Indent Line {{{

let g:indentLine_char = '|'

" }}}
" Plugins: Emmet {{{

" After the leader key you should always enter a comma to trigger emmet.
let g:user_emmet_leader_key='<C-f>'
let g:user_emmet_settings = {
      \   'javascript.jsx' : {
      \     'extends': 'jsx',
      \   },
      \ }


" }}}
" Plugins: CtrlP {{{

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
let g:ctrlp_user_command = [
      \ '.git/',
      \ 'git --git-dir=%s/.git ls-files -oc --exclude-standard'
      \ ]

" }}}
" Plugins: GitGutter {{{

let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = 'M'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = 'M-'

" If you experience a lag, you can trade speed for accuracy.
"let g:gitgutter_realtime = 0
"let g:gitgutter_eager = 0

" }}}
" Plugins: UltiSnips {{{

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsListSnippets="<c-e>"

" }}}
" Plugins: YouCompleteMe {{{

let g:ycm_key_list_select_completion=['<Down>']
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_key_list_stop_completion = ['<Enter>']
let g:ycm_max_num_candidates = 6
let g:ycm_max_num_identifier_candidates = 6
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_seed_identifiers_with_syntax = 0
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_server_python_interpreter = 'python3'
let g:ycm_filepath_blacklist = { }

" }}}
" Plugins: Ale {{{

let g:ale_sign_error = '••'
let g:ale_sign_warning = '•'

" Open list of errors when new buffer opens.
let g:ale_open_list = 0

" Unset loclist and enable quickfix list.
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" This means when entering a file, not when pressing <ENTER>.
let g:ale_lint_on_enter = 0

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_php_phpcs_standard = 'Drupal'
let g:ale_linters_explicit = 1
let g:ale_linters = {
      \ 'python': ['pycodestyle'],
      \ 'php': ['phpcs'],
      \ 'javascript': ['stylelint', 'eslint'],
      \ 'javascript.jsx': ['stylelint', 'eslint'],
      \ }

let g:ale_linter_aliases = {'javascript.jsx': 'css'}

" Do not lint or fix minified files.
let g:ale_pattern_options = {
      \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
      \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
      \ '\.tpl\.php$': {'ale_linters': [], 'ale_fixers': []},
      \ }

" }}}
" Plugins: Prettier {{{

let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
noremap <Leader>p :PrettierAsync<cr>

" }}}
" Plugins: MRU {{{

let MRU_Window_Height = 10
noremap <Leader>r :MRU<cr>

" }}}
" Plugins: NERDCommenter {{{

let g:NERDSpaceDelims = 1

" map <C-c> in all modes as a default mapping for comments.
" This will add a '//' for a single line comment.
"
" When in visual mode and doing the same keypress the whole block will be
" commented using a '/* */' syntax.
map <C-c> <Leader>cc<cr>
vmap <C-c> <Leader>cm<cr>

map <C-x> <Leader>cu<cr>
map <C-a> <Leader>cs<cr>


" }}}
" Plugins: Gutentags {{{

" Setup the directory to store all the tags.lock / tags.temp files.
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')

" Add a custom command for clearing all the cached tags.
command! GutentagsClearCache :call system('rm ' . g:gutentags_cache_dir . '/*')

" Disable the default project root markers and add our own.
let g:gutentags_project_root = ['package.json', '.git']
let g:gutentags_add_default_project_roots = 0

" If set to 1, Gutentags will start generating the tag file when a new project
" is open. A new project is considered open when a buffer is created for a file
" whose corresponding tag file has not been 'seen' yet in the current Vim
" session -- which pretty much means when you open the first file in a given
" source control repository.
let g:gutentags_generate_on_new = 1

" If set to 1, Gutentags will start generating an initial tag file if a file is
" open in a project where no tags file is found.
let g:gutentags_generate_on_missing = 1

" If set to 1, Gutentags will update the current project's tag file when a file
" inside that project is saved
let g:gutentags_generate_on_write = 1

" If set to 1, Gutentags will start generating the tag file even if there's no
" buffer currently open, as long as the current working directory (as returned
" by |:cd|) is inside a known project.  This is useful if you want Gutentags to
" generate the tag file right after opening Vim.
let g:gutentags_generate_on_empty_buffer = 0

let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]

let g:gutentags_ctags_exclude = [
      \ '*.min.js',
      \ '*.min.css',
      \ '.git',
      \ 'build',
      \ 'dist',
      \ 'node_modules',
      \ 'bower_components',
      \ 'package.json',
      \ 'package-lock.json',
      \ '*eslintrc*',
      \ 'cache',
      \ 'compiled',
      \ ]

" }}}
" Plugins: Polyglot {{{

let g:polyglot_disabled = ['markdown']

" JSX
" ------------------------------------------------------------------------------
" Allow JSX syntax highlighting in .js files
" ------------------------------------------------------------------------------
let g:jsx_ext_required = 0

" }}}
" Plugins: Surround {{{

" To emulate a modern editor at its best, we want to remap x to Sx for
" efficiency and simplicity. The vim-surround plugin is mapping almost every
" single character because it prefixes it with 'S', but we only specify will
" specify the ones we might need, because we do not want to remap default
" built-in vim mappings.

let g:visual_surround_characters = [
      \ '{', '}',
      \ '[', ']',
      \ '(', ')',
      \ '"', "`", "'",
      \ '%',
      \ ]
for char in g:visual_surround_characters
  exe 'vmap ' . char . ' S' . char
endfor

" }}}
