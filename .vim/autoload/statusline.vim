" ==============================================================================
" Filename: statusline.vim
" Maintainer: Kim Koomen <koomen@protonail.com>
" License: MIT
" ==============================================================================

let s:save_cpo = &cpo
set cpo&vim

let s:modes = {
      \ 'n'      : ['%#SLModeNormal#'   , 'NORMAL'   ],
      \ 'i'      : ['%#SLModeInsert#'   , 'INSERT'   ],
      \ 'v'      : ['%#SLModeVisual#'   , 'VISUAL'   ],
      \ 'V'      : ['%#SLModeVisual#'   , 'V-LINE'   ],
      \ "\<C-V>" : ['%#SLModeVisual#'   , 'V-BLOCK'  ],
      \ 'R'      : ['%#SLModeReplace#'  , 'REPLACE'  ],
      \ 's'      : ['%#SLModeSelect#'   , 'SELECT'   ],
      \ 'S'      : ['%#SLModeSelect#'   , 'S-LINE'   ],
      \ "\<C-s>" : ['%#SLModeSelect#'   , 'S-BLOCK'  ],
      \ 'c'      : ['%#SLModeTerminal#' , 'COMMAND'  ],
      \ 't'      : ['%#SLModeTerminal#' , 'TERMINAL' ],
      \ }

" statusline#bufferinfo
"
" @description
"   Retrieves info about the current buffer.
" @return string
function! statusline#bufferinfo() abort
  let l:statusline = '%#SLBufferInfo#'
  " Percentage of current line vs total lines.
  let l:statusline .= ' %p%%'

  " Current line / total lines.
  let l:statusline .= ' %l/%L'

  " Current column
  let l:statusline .= ':%c '

  let l:statusline .= '%*'
  return l:statusline
endfunction

" statusline#filetypeinfo
"
" @description
"   Retrieves info about the current file such as encoding, the format and type.
"   A message will be added to the statusline here when it is not the default.
" @return list
function! statusline#filetypeinfo() abort
  let l:statusline = []
  if &fileencoding != "utf-8"
    call add(l:statusline, '%#warningmsg#fileencoding:%{&fileencoding}%*')
  elseif &encoding != "utf-8"
    call add(l:statusline, '%#warningmsg#encoding:%{&encoding}%*')
  endif

  if &fileformat != "unix"
    call add(l:statusline, '%#warningmsg#fileformat:%{&fileformat}%*')
  endif

  if &ft
    call add(l:statusline, '&ft')
  endif

  return join(l:statusline, ' ' . g:statusline_separator . ' ')
endfunction

" statusline#spellmode
"
" @description
"   Retrieves wether the user has spellchecking enabled.
" @return string
"   The language that the spellchecker is set to.
function! statusline#spellmode() abort
  let l:statusline = []
  if &spell | call add(l:statusline, '[spellcheck: ' . &spelllang . ']') | endif
  return l:statusline
endfunction

" statusline#pastemode
"
" @description
"   Retrieves wether the user is in 'paste' mode or not.
" @return list
function! statusline#pastemode() abort
  let l:statusline = []
  if &paste | call add(l:statusline, 'PASTE') | endif
  return l:statusline
endfunction

" statusline#currentfileinfo
"
" @description
"   Retrieves the current file its info, such as the location and some flags
"   wether the file is readonly or modified.
" @return list
function! statusline#currentfileinfo() abort
  " [%F] absolute path
  " [%f] relative path
  " [%t] filename only
  let l:statusline = ['%F']

  if &readonly
    call add(l:statusline, '%r')
  endif

  if &modified || !&modifiable
    call add(l:statusline, '%m')
  endif

  return l:statusline
endfunction

" statusline#gitbranch
"
" @description
"   Retrieves the current git branch.
" @return string
"   A human-readable name of the branch or, when the user is detached from HEAD,
"   a part of the commit hash.
function! statusline#gitbranch() abort
  let l:statusline = ''
  let l:branch = fugitive#head(7)

  if l:branch == "master"
    let l:statusline .= '%#SLGitBranchMaster#'
    let l:statusline .= ' ' . l:branch . ' '
    let l:statusline .= '%*'
  elseif l:branch != ""
    let l:statusline .= '%#SLGitBranch#'
    let l:statusline .= ' ' . l:branch . ' '
    let l:statusline .= '%*'
    let l:statusline .= g:statusline_separator
  endif
  return l:statusline
endfunction

" statusline#mode
"
" @description
"   Retrieves the current mode.
" @return string
function! statusline#mode() abort
  let [l:modecolor, l:mode] = get(s:modes, mode(), 'n')
  return l:modecolor . ' ' . l:mode . ' %*'
endfunction

" statusline#render
"
" @param list[] items
"   A list containing functions to be called.
" @return string
function! statusline#render(items) abort
  let l:statusline = []

  for [fn, args] in a:items
    let result = call(fn, args)
    if type(result) == type([]) && len(result) > 0
      " If the return value is a list, join them together with spaces.
      call add(l:statusline, join(result, ' '))
    elseif type(result) == type("") && result != ""
      " If the return value is a string, just append it.
      call add(l:statusline, result)
    endif
  endfor

  return len(l:statusline) > 0
        \ ? ' ' . join(l:statusline, ' ' . g:statusline_separator . ' ') . ' '
        \ : ''
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
