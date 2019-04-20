" ==============================================================================
" Filename: gf.vim
" Maintainer: Kim Koomen <koomen@protonail.com>
" License: MIT
" ==============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! GetRelativeBufferPathInGitDirectory(...)
  return substitute(
        \ expand('%:p' . a:1),
        \ trim(system('git -C ' . expand('%:p:h') . ' rev-parse --show-toplevel')),
        \ '',
        \ 'g'
        \ )
endfunction

function! FindFileInDir(path)
  " Check for files only (TODO: support dirs).
  let l:files = expand(a:path . '*.*', 0, 1)

  if len(l:files) == 0
    " Nothing found.
    return 0
  elseif len(l:files) == 1
    " Found exactly 1 match.
    return get(l:files, 1)
  else
    " Prompt the user which match should be opened.
    echo 'Multiple matches found for ' . a:path
    echo '[0] Cancel'
    for p in l:files
      " call add(l:files_to_prompt, p)
      echo "[" . (index(l:files, p) + 1) . "] " . p
    endfor

    " Grab the user input, validate it and grab the selected filepath.
    let selected_index = input('Enter an index to open: ')
    if selected_index !~# '^\d\+$'
      echoerr 'Input must be an integer'
    elseif selected_index == "0"
      return 0
    else
      let idx = selected_index - 1
      let selected_filepath = get(l:files, idx)
      if empty(selected_filepath)
        echoerr "Index does not exist"
      else
        return selected_filepath
      endif
    endif
  endif
endfunction

function! OpenFile(file)
  execute "edit " . a:file
endfunction

function! OpenFileUnderCursor()
    let l:cfile = expand("<cfile>")

    " - check if file is relative from current buffer, if so, open it
    let l:buffer_relative_file = simplify(expand('%:p:h') . '/' . l:cfile)
    " if filereadable(l:buffer_relative_file)
    "   execute "edit " . l:buffer_relative_file
    "   return
    " endif

    " Check for a file './constants' (should open constants.{ext})
    let l:relative_file = FindFileInDir(l:buffer_relative_file)
    if l:relative_file != &number
      " echo "\n" . l:relative_file
      OpenFile(l:relative_file)
    endif

    " let bp = substitute(GetRelativeBufferPathInGitDirectory(':h'), '^/', '', 'g')
    " echo "bp: " . bp . " :: " . cfile

    " Possible options:
    " [ ] shared/components/Node
    " [ ] shared/styles/main.scss
    " [ ]./style.scss
    " [ ] shared/assets/favicon.png

    " Global checks (should work for every filetype)
    " --------------------------------------------------------------------------
    " - Check if relative file
    "   - [ ] order of paths to resolve:
    "     - [x] ./style.scss
    "     - [ ] ./constants (should open constants.{ext})
    "       - [ ] prompt user if multiple 'constants' files are found
    "     - [ ] ../../User OR ./User (expand('%:h') === cfile)
    "       - [ ] should open file starting with 'index' in User dir
    "       - [ ] if User.{ext} exists, open the file
    "       - [ ] else the directory/index
    "       - [ ] elseif directory: the directory
    "     - [ ] ../../config/constants (should open constants.js)
    "       - [ ] prompt user if multiple 'constants' files are found
    " - [ ] Check if absolute file (but still relative to git directory)
    "   - [ ] check if 'src/components/Node' === cfile
    "     - [ ] if so && if file: open Node.{ext}
    "       - [ ] prompt user if multiple Node.{ext} found
    "     - [ ] elseif directory: open Node/index.{ext}
    "       - [ ] prompt if multiple Node/index.{ext} are found
    "     - [ ] elseif directory: open directory

    " Specific filetype checking:
    " --------------------------------------------------------------------------
    " - [ ] if &ft == /(javascript|javascript.jsx|jsx|typescript|typescript.tsx|tsx)/
    "   - [ ] check for `package.json` in git dir and check for `moduleRoots`.
    "     Example moduleRoots: ['src/client', 'src/server', 'src/shared', 'src', 'node_modules']
    "     Example input: 'shared/components/Node' (moduleRoot 'src' is the match here).
    "     - foreach {moduleRoots} as {root}
    "       - [ ] check if exists: {root}/<cfile>
    "         - [ ] if so && if file: open Node.{ext}
    "           - [ ] prompt user if multiple Node.{ext} found
    "         - [ ] elseif directory: open Node/index.{ext}
    "           - [ ] prompt if multiple Node/index.{ext} are found
    "         - [ ] elseif directory: open directory
    " execute "edit " . cfile
endfunction

" TODO: map gf instead of fg
nmap fg :call OpenFileUnderCursor()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
