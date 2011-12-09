function! RspecSwitcherFindBinary()
  if matchstr(system('bundle list | grep rspec'), 'rspec\s\+(1\..\{-})') == ""
    let l:binary = "rspec"
  else
    let l:binary =  "spec"
  endif
  return l:binary
endfunction

if !exists("g:rspecswitcherRspecExecutable")
  let g:rspecswitcherRspecExecutable = RspecSwitcherFindBinary()
endif

nnoremap <leader>s :exec "!clear; bundle exec " . g:rspecswitcherRspecExecutable . " -cfs " . bufname("%") . ":" . line(".")<CR>
nnoremap <leader>S :exec "!clear; bundle exec " . g:rspecswitcherRspecExecutable . " -cfs " . bufname("%")<CR>
