" ==============================================================================
" Filename: %FILE%.vim
" Maintainer: %USER% <%MAIL%>
" License: %LICENSE%
" ==============================================================================

let s:save_cpo = &cpo
set cpo&vim

%HERE%

let &cpo = s:save_cpo
unlet s:save_cpo
