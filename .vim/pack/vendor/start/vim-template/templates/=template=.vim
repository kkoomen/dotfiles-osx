let s:save_cpo = &cpoptions
set cpoptions&vim

%HERE%

let &cpoptions = s:save_cpo
unlet s:save_cpo
