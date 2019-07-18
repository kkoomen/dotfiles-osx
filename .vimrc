" Encoding {{{

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

" }}}
" Basic setup {{{

syntax on                           " Enable syntax highlighting.
filetype plugin indent on           " Enable file detection.
set hidden                          " Hide when switching buffers, don't unload.
set mouse=                          " Disable mouse in all modes.
set synmaxcol=9999                  " Amount of cols to enable syntax highlighting for.
set nowrap                          " No word wrap.
set number                          " Show line numbers.
set nocursorline                    " Disable cursor line (makes vim very slow).
set title                           " Use filename in window title.
set ttyfast                         " Indicates a fast terminal connection.
set lazyredraw                      " Will buffer screen updates instead of updating all the time.
set clipboard=unnamed               " Enable clipboard.
set autoread                        " Set to auto read when a file is changed from the outside.
set nospell                         " Disable spellcheck on default.
set scrolloff=7                     " Minimal number of screen lines to keep above and below the cursor when scrolling.
set textwidth=80                    " Set a max text width.
set nocompatible                    " Use vim defaults instead of vi.
set updatetime=300                  " The time in ms to redraw
set backspace=indent,eol,start      " Set priorities for the backspace key.
set foldenable foldmethod=marker    " Enable folding.
set list listchars=tab:\│\ ,trail:• " Make additional characters visible.
set completeopt-=preview            " Disable scratch preview window.
set infercase                       " Enable ignorecase for keyword completion.
set diffopt=filler,iwhite           " Ignore whitespace as well when diffing.

" Make our custom aliases available within a non-interactive vim.
" -----------------------------------------------------------------------------
let $BASH_ENV = '~/.bash_aliases'

" }}}
" Search {{{

set ignorecase " Case insensitive.
set incsearch  " Show match as search proceeds.
set hlsearch   " Search highlighting.

" }}}
" Indentation {{{

set autoindent    " Copy indent from previous line.
set smartindent   " Auto indent when starting a new line.
set shiftwidth=2  " Spaces for autoindenting.
set smarttab      " <BS> removes shiftwidth worth of spaces.
set softtabstop=2 " Spaces for editing, e.g. <Tab> or <BS>.
set tabstop=2     " Amount of spaces for <Tab>.
set shiftround    " Round indent to multiple of 'shiftwidth'.
set expandtab     " Use spaces by default.

" }}}
" Wildmenu {{{

set wildmenu
set wildignorecase
set wildmode=list:longest,full

" }}}
" Color scheme {{{

packadd! onedark

let g:onedark_color_overrides = {
      \ 'dark_red': { 'gui': '#d97084', 'cterm': '204', 'cterm16': '1' },
      \ 'red': { 'gui': '#ed8499', 'cterm': '196', 'cterm16': '9' },
      \ 'dark_green': { 'gui': '#87bb7c', 'cterm': '114', 'cterm16': '2' },
      \ 'green': { 'gui': '#97d589', 'cterm': '114', 'cterm16': '10' },
      \ 'dark_yellow': { 'gui': '#d5b874', 'cterm': '180', 'cterm16': '3' },
      \ 'yellow': { 'gui': '#e9cb87', 'cterm': '173', 'cterm16': '11' },
      \ 'dark_blue': { 'gui': '#6face4', 'cterm': '39', 'cterm16': '4' },
      \ 'blue': { 'gui': '#87bff5', 'cterm': '39', 'cterm16': '12' },
      \ 'dark_purple': { 'gui': '#a389dd', 'cterm': '170', 'cterm16': '5' },
      \ 'purple': { 'gui': '#b9a0ee', 'cterm': '170', 'cterm16': '13' },
      \ 'dark_cyan': { 'gui': '#68c5cd', 'cterm': '38', 'cterm16': '6' },
      \ 'cyan': { 'gui': '#68c5cd', 'cterm': '38', 'cterm16': '14' },
      \ 'dark_white': { 'gui': '#bbbebf', 'cterm': '145', 'cterm16': '7' },
      \ 'white': { 'gui': '#d0d2d2', 'cterm': '145', 'cterm16': '15' },
      \ 'black': { 'gui': '#303030', 'cterm': '235', 'cterm16': '0' },
      \ 'visual_black': { 'gui': '#b7bdc0', 'cterm': 'NONE', 'cterm16': '0' },
      \ 'comment_grey': { 'gui': '#666666', 'cterm': '59', 'cterm16': '15' },
      \ 'gutter_fg_grey': { 'gui': '#666666', 'cterm': '235', 'cterm16': '15' },
      \ 'cursor_grey': { 'gui': '#383838', 'cterm': '236', 'cterm16': '8' },
      \ 'visual_grey': { 'gui': '#474646', 'cterm': '237', 'cterm16': '15' },
      \ 'menu_grey': { 'gui': '#404040', 'cterm': '237', 'cterm16': '8' },
      \ 'special_grey': { 'gui': '#666666', 'cterm': '238', 'cterm16': '15' },
      \ 'vertsplit': { 'gui': '#181A1F', 'cterm': '59', 'cterm16': '15' },
      \}

set background=dark
set termguicolors
colorscheme onedark

" }}}
" Custom Highlighting {{{

" Only highlight the color column when the line is expanding the 80th column.
highlight! ColorColumn ctermbg=red ctermfg=white guibg=#BE5046 guifg=#151515
call matchadd('ColorColumn', '\%81v.', 100)

highlight! Tabline     guibg=#444444 guifg=#888888
highlight! TablineFill guibg=#303030 guifg=#888888
highlight! TablineSel  guibg=#ABB2BF guifg=#444444
highlight! MatchParen  guibg=#606060 guifg=#E5C07B

highlight! Folded ctermfg=8 ctermbg=0 guifg=#666666 guibg=#303030

" }}}
" Omni completion {{{

" Enable omni completion and enable more characters to be available within
" autocomplete by appending to the 'iskeyword' variable.
set iskeyword+=-

" Set all the autocompleters.
" autocmd FileType * setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript,javascript.jsx,jsx,typescript,typescript.jsx setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php setlocal omnifunc=phpactor#Complete

" Unset some complete options for optimised completion performance.
" i   Scan the current and included files.
set complete-=i

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

augroup drupal
  autocmd!
  autocmd BufRead,BufNewFile *.blade.php setlocal filetype=php
  autocmd BufRead,BufNewFile *.theme setlocal filetype=php
  autocmd BufRead,BufNewFile *.module setlocal filetype=php
  autocmd BufRead,BufNewFile *.install setlocal filetype=php
  autocmd BufRead,BufNewFile *.test setlocal filetype=php
  autocmd BufRead,BufNewFile *.inc setlocal filetype=php
  autocmd BufRead,BufNewFile *.profile setlocal filetype=php
  autocmd BufRead,BufNewFile *.view setlocal filetype=php
  autocmd BufRead,BufNewFile *.drush setlocal filetype=php
augroup END

augroup bash
  autocmd!
  autocmd BufNewFile,BufRead *.bash_* setlocal ft=sh
  autocmd BufNewFile,BufRead *.sh setlocal ft=sh
augroup END

augroup javascript
  autocmd!
  autocmd BufRead,BufNewFile *.mdx,*.plop setlocal filetype=javascript
  autocmd BufRead,BufNewFile *.tsx setlocal filetype=typescript.jsx
augroup END

augroup rc
  autocmd!
  autocmd BufRead,BufNewFile .babelrc,.stylelintrc,.prettierrc,.htmlhintrc setlocal filetype=json
augroup END

augroup minified
  autocmd!
  autocmd BufRead,BufNewFile *.min.* setlocal syntax=off
augroup END

augroup styles
  autocmd!
  autocmd BufRead,BufNewFile *.min.* setlocal syntax=off
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType php setlocal iskeyword-=-
  autocmd FileType css,less,scss setlocal iskeyword+=.
  autocmd FileType vim setlocal iskeyword+=:
  autocmd FileType markdown setlocal spell

  " Format options have impact when formatting code with the 'gq' binding.
  " Default: crqlo (see ':h fo-table' for more info)
  autocmd FileType * set fo=crql
augroup END


" }}}
" Functions {{{

function OnBufWritePre()
  " Delete empty lines at the end of the buffer.
  execute('v/\n*./d')

  " Execute commands only for non-test files.
  let l:test_file_regex = '\m\(test\|spec\|.\+\.vader$\)'
  if expand('%:t') !~# l:test_file_regex

    " Delete trailing whitespaces for each line.
    execute('%s/\s\+$//ge')

    " Retab the file to ensure no mixed usage of tabs and spaces.
    execute('%retab!')
  endif
endfunction

function OnBufReadPost()
  " Set the last edit position.
  if line("'\"") > 0 && line("'\"") <= line("$") |
    execute("normal! g`\"") |
  endif

  " Disable syntax highlighting for files larger than 1MB.
  let l:bytes = getfsize(expand(@%))
  if l:bytes > 1024 * 1024
    set syntax=off
    let b:statusline_show_syntax_disabled = 1
  endif
endfunction

function! GetRelativeBufferPathInGitDirectory()
  return substitute(
        \ expand('%:p'),
        \ trim(system('git -C ' . shellescape(expand('%:p:h')) . ' rev-parse --show-toplevel')),
        \ '',
        \ 'g'
        \ )
endfunction

function! OnBufRead()
  " Set the absolute path of the current buffer to the system clipboard.
  " 'BP' refers to 'Buffer Path'.
  command! BP :let @+=expand('%:p') | echo @*

  " Set the path of the current buffer relative to its git diretory to the
  " system clipboard. 'GBP' refers for 'Git Buffer Path'.
  command! GBP :let @+=GetRelativeBufferPathInGitDirectory() | echo @*
endfunction

function! IndentCode()
  " Save the cursor position.
  let l:cursor_pos = getpos('.')

  " Indent code.
  execute('normal! gg=G')

  " Set the cursor position back at where we started.
  call setpos('.', l:cursor_pos)
endfunction

" }}}
" Hooks {{{

autocmd BufWritePre *        :call OnBufWritePre()
autocmd BufReadPost *        :call OnBufReadPost()
autocmd BufRead,BufNewFile * :call OnBufRead()

" }}}
" Mappings {{{

" Leader key
" ------------------------------------------------------------------------------
let g:mapleader = "\<Space>"

" Buffers
" ------------------------------------------------------------------------------
nnoremap Z :bprev<CR>
nnoremap X :bnext<CR>
nnoremap Q :bw<CR>

" Moving lines up or down
" ------------------------------------------------------------------------------
nnoremap <silent> <C-Down> :m .+1<CR>==
nnoremap <silent> <C-Up> :m .-2<CR>==
inoremap <silent> <C-Down> <Esc>:m .+1<CR>==gi
inoremap <silent> <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <silent> <C-Down> :m '>+1<CR>gv=gv
vnoremap <silent> <C-Up> :m '<-2<CR>gv=gv

" Set pastetoggle
" ------------------------------------------------------------------------------
set pastetoggle=<F2>

" Rot13
" ------------------------------------------------------------------------------
nnoremap <silent> <F6> ggg?G<CR>

" Space bar un-highligths search
" ------------------------------------------------------------------------------
noremap <silent> <Space> :silent! noh<CR>

" Re-indent code.
noremap <Leader>i :call IndentCode()<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo
" ------------------------------------------------------------------------------
cnoremap w!! w !sudo tee > /dev/null %

" Spell check
" ------------------------------------------------------------------------------
nnoremap <Leader>sc :setlocal spell!<CR>

" Remove ^M
" ------------------------------------------------------------------------------
noremap <Leader>m :%s/\r//g<CR>

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
" Plugins: HTML Close Tag {{{

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.tpl,*.twig,*.htm,*.php,*.pug,*.jsx,*.js,*.mdx,*.plop,*.tsx,*.ts"

" }}}
" Plugins: Pear Tree {{{

" Set pairs to be closed automatically.
let g:pear_tree_pairs = {
      \ '(': {'closer': ')'},
      \ '[': {'closer': ']'},
      \ '{': {'closer': '}'},
      \ "'": {'closer': "'"},
      \ '"': {'closer': '"'},
      \ '`': {'closer': '`'},
      \ '"""': {'closer': '"""'},
      \ "'''": {'closer': "'''"},
      \ '<!--': {'closer': '-->'},
      \ }

" Enable smart pairing.
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" Disable dot-repeatable functionality.
let g:pear_tree_repeatable_expand = 0

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

let g:indentLine_char = '│'
let g:indentLine_faster = 1

" }}}
" Plugins: Ale {{{

let g:ale_set_highlights = 0
highlight! ALEWarning ctermfg=none ctermbg=none guibg=NONE guifg=NONE
highlight! ALEError   ctermfg=none ctermbg=none guibg=NONE guifg=NONE

highlight! ALEWarningSign guibg=NONE guifg=white
highlight! ALEErrorSign   guibg=NONE guifg=#e07798

let g:ale_sign_error = '➜'
let g:ale_sign_warning = '➜'

" Open list of errors when new buffer opens.
let g:ale_open_list = 0

" Unset loclist and enable quickfix list.
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" This means when entering a file, not when pressing <ENTER>.
let g:ale_lint_on_enter = 1

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
" let g:ale_php_phpcs_standard = 'Drupal'
let g:ale_linters_explicit = 1

let g:ale_linters = {
      \ 'python': ['pycodestyle'],
      \ 'go': ['gometalinter', 'gofmt', 'goimports'],
      \ 'vim': ['vint'],
      \ 'html': ['htmlhint'],
      \ 'smarty': ['htmlhint'],
      \ 'css': ['stylelint'],
      \ 'scss': ['stylelint'],
      \ 'less': ['stylelint'],
      \ 'javascript': ['eslint'],
      \ 'javascript.jsx': ['eslint'],
      \ 'typescript': ['tslint'],
      \ 'typescript.jsx': ['tslint'],
      \ }

let g:ale_linter_aliases = {
      \ 'smarty': ['html']
      \ }

" Do not lint or fix minified files.
let g:ale_pattern_options = {
      \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
      \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
      \ '\.tpl\.php$': {'ale_linters': [], 'ale_fixers': []},
      \ }

" }}}
" Plugins: Emmet {{{

" After the leader key you should always enter a comma to trigger emmet.
let g:user_emmet_leader_key='<C-f>'
let g:user_emmet_settings = {
      \   'typescript.jsx' : {
      \     'extends': 'jsx',
      \   },
      \   'javascript.jsx' : {
      \     'extends': 'jsx',
      \   },
      \ }


" }}}
" Plugins: Signify {{{

let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '^'
let g:signify_sign_change            = 'M'
let g:signify_sign_changedelete      = 'M-'

" }}}
" Plugins: YouCompleteMe {{{

let g:ycm_key_list_select_completion=['<Down>']
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_max_num_identifier_candidates = 6
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_complete_in_comments = 0

let g:ycm_server_python_interpreter = 'python3'
let g:ycm_filepath_blacklist = {}

" Disable diagnostics, those are provided by ALE.
let g:ycm_always_populate_location_list = 0
let g:ycm_show_diagnostics_ui = 0

" }}}
" Plugins: MRU {{{

let MRU_Window_Height = 10
noremap <Leader>r :MRU<CR>

" }}}
" Plugins: tComment {{{

map <C-c> g>c<CR>
vmap <C-c> g>b<CR>

map <C-x> g<c<CR>
vmap <C-x> g<b<CR>


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
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
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
      \ '%', '-', '_', '*'
      \ ]
for char in g:visual_surround_characters
  execute('vmap ' . char . ' S' . char)
endfor

" }}}
" Plugins: FZF {{{

" Set runtime path containing useful key bindings and fuzzy completions.
set rtp+=/usr/local/opt/fzf

" Set a mapping to toggle FZF
nnoremap <C-p> :FZF<CR>

" fzf.vim plugin mappings
noremap <Leader>b :BCommits<CR>
noremap <Leader>c :Commits<CR>

" let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = {'down': '35%'}
let g:fzf_tags_command = 'ctags --extra=+f -R'
let g:fzf_colors =
      \ { 'fg':    ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Type'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Normal'],
      \ 'pointer': ['fg', 'Type'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Type'],
      \ 'header':  ['fg', 'Comment'] }

" Use ripgrep with FZF
" Example usage -> :Find <query>
"
" Options
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --follow --hidden --glob "!.git/*" --color "always" ' . shellescape(<q-args>), 1, <bang>0)

" }}}
" Plugins: EditorConfig {{{

let g:EditorConfig_disable_rules = ['max_line_length']

" }}}
" Plugins: Readdir {{{

" Disable netrw because we use https://github.com/kkoomen/vim-readdir
let loaded_netrwPlugin = 1

" Show hidden files as well.
let g:readdir_hidden = 2

" }}}
" Plugins: Vim-GO {{{

let g:go_template_autocreate = 0

" }}}
" Plugins: DoGe {{{

let g:doge_mapping = '<C-d>'

" }}}
