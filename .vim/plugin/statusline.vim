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
      \     [ 'gutentags#statusline', ['[', ':running]'] ],
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

  return l:statusline
endfunction

" Setup all the statusline highlighting.
highlight! StatusLine        ctermbg=white  ctermfg=black  guibg=#383838 guifg=#888888
highlight! SLModeNormal      ctermbg=white  ctermfg=black  guibg=#888888 guifg=#262626
highlight! SLModeInsert      ctermbg=green  ctermfg=black  guibg=#98C379 guifg=#262626
highlight! SLModeVisual      ctermbg=yellow ctermfg=black  guibg=#E5C07B guifg=#262626
highlight! SLModeReplace     ctermbg=red    ctermfg=black  guibg=#C678DD guifg=#262626
highlight! SLModeSelect      ctermbg=blue   ctermfg=black  guibg=#61AFEF guifg=#262626
highlight! SLModeTerminal    ctermfg=black  ctermfg=green  guibg=#262626 guifg=#98C379
highlight! SLBufferInfo      ctermbg=white  ctermfg=black  guibg=#888888 guifg=#262626

highlight! errormsg          ctermbg=black  ctermfg=red    guifg=#BE5046
highlight! warningmsg        ctermbg=black  ctermfg=yellow guifg=#E5C07B

highlight! SLGitBranch       ctermbg=black  ctermfg=yellow guibg=#303030 guifg=#61AFEF
highlight! SLGitBranchMaster ctermbg=red    ctermfg=white  guibg=#BE5046 guifg=#ffffff

set noshowmode   " Do not show vim's default mode.
set laststatus=2 " Always show the statusline.

autocmd WinEnter,BufEnter * setlocal statusline=%!SL()
