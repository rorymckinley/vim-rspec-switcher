function! RspecSwitcherFindBinary()
  if matchstr(system('bundle list | grep rspec'), 'rspec\s\+(1\..\{-})') == ""
    return "rspec"
  else
    return "spec"
  endif
endfunction

if !exists("g:rspecswitcherRspecExecutable")
  let g:rspecswitcherRspecExecutable = RspecSwitcherFindBinary()
endif

nnoremap ,s :exec "!clear; " . g:rspecswitcherRspecExecutable . " -cfs %:".line(".")<CR>
nnoremap ,S :exec "!clear; " . g:rspecswitcherRspecExecutable . " -cfs %"<CR>
