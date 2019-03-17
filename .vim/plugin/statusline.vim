" =============================================================================
" Filename: statusline.vim
" Maintainer: Kim Koomen <koomen@protonail.com>
" License: MIT
" =============================================================================

if exists("g:loaded_statusline") || &cp || v:version < 700
  finish
endif
let g:loaded_statusline = 1

let g:statusline_separator = '|'

" We define the functions here that will be shown conditionally and will be
" joined together using the g:statusline_separator. These also do not have a
" background color highlighting defined, that's why it work with the separator.
"
" Every key is another list structured like [ fn, args ]
let s:statusline = {
      \   'left': [
      \     [ 'statusline#currentfileinfo', [] ],
      \     [ 'statusline#pastemode', [] ],
      \   ],
      \   'right': [
      \     [ 'gutentags#statusline', ['', ':running'] ],
      \     [ 'statusline#spellmode', [] ],
      \     [ 'statusline#filetypeinfo', [] ],
      \   ]
      \ }

function! SL()
  let l:statusline = statusline#mode()
  let l:statusline .= statusline#gitbranch()
  let l:statusline .= statusline#render(s:statusline.left)

  let l:statusline .= '%='
  let l:statusline .= statusline#render(s:statusline.right)
  let l:statusline .= statusline#bufferinfo()
  let l:statusline .= statusline#bufferfilesize()

  return l:statusline
endfunction

" Setup all the statusline highlighting.
highlight! StatusLine        ctermbg=white  ctermfg=black  guibg=#404040 guifg=#999999
highlight! SLModeNormal      ctermbg=white  ctermfg=black  guibg=#999999 guifg=#262626
highlight! SLModeInsert      ctermbg=green  ctermfg=black  guibg=#719672 guifg=#262626
highlight! SLModeVisual      ctermbg=yellow ctermfg=black  guibg=#e0bb71 guifg=#262626
highlight! SLModeReplace     ctermbg=red    ctermfg=black  guibg=#ffbebc guifg=#262626
highlight! SLModeSelect      ctermbg=blue   ctermfg=black  guibg=#96bbdc guifg=#262626
highlight! SLModeTerminal    ctermfg=black  ctermfg=green  guibg=#262626 guifg=#719672
highlight! SLBufferInfo      ctermbg=white  ctermfg=black  guibg=#999999 guifg=#262626

highlight! SLErrorMsg        ctermbg=none  ctermfg=red    guifg=#e07798 guibg=#404040
highlight! SLWarningMsg      ctermbg=none  ctermfg=yellow guifg=#e0bb71 guibg=#404040
highlight! SLNormalMsg       ctermbg=none  ctermfg=none   guifg=#96bbdc guibg=NONE

highlight! SLGitBranch       ctermbg=black  ctermfg=yellow guibg=#303030 guifg=#96bbdc
highlight! SLGitBranchMaster ctermbg=red    ctermfg=white  guibg=#007172 guifg=#ffffff

set noshowmode   " Do not show vim's default mode.
set laststatus=2 " Always show the statusline.

autocmd WinEnter,BufEnter * setlocal statusline=%!SL()
