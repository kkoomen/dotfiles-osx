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

function! statusline#pastemode() abort
  let l:statusline = []
  if &paste | call add(l:statusline, 'PASTE') | endif
  return l:statusline
endfunction

function! statusline#spellmode() abort
  let l:statusline = []
  if &spell | call add(l:statusline, '[spellcheck: ' . &spelllang . ']') | endif
  return l:statusline
endfunction

function! statusline#filetypeinfo() abort
  let l:statusline = []
  if &fileencoding != "utf-8"
    call add(l:statusline, '%#warningmsg# fileencoding:%{&fileencoding}%*')
  elseif &encoding != "utf-8"
    call add(l:statusline, '%#warningmsg# encoding:%{&encoding}%*')
  endif

  if &fileformat != "unix"
    call add(l:statusline, '%#warningmsg#fileformat:%{&fileformat}%*')
  endif

  if &ft
    call add(l:statusline, '&ft')
  endif

  return join(l:statusline, ' ' . g:statusline_separator . ' ')
endfunction

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

function! statusline#mode() abort
  let [l:modecolor, l:mode] = get(s:modes, mode(), 'n')
  return l:modecolor . ' ' . l:mode . ' %*'
endfunction

" The 'items' param here is a list of strings of function names. We will call
" the functions and the function may return an array or string. Whenever the
" array has items, we append it. Whenever the string is not empty, we append it.
"
" We always return a string with the rendered statusline version.
function! statusline#render(items) abort
  let l:statusline = []
  for fn in a:items
    let items = call(fn, [])
    if type(items) == type([]) && len(items) > 0
      call add(l:statusline, join(items, ' '))
    elseif type(items) == type("") && items != ""
      call add(l:statusline, items)
    endif
  endfor

  return len(l:statusline) > 0
        \ ? ' ' . join(l:statusline, ' ' . g:statusline_separator . ' ') . ' '
        \ : ''
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
