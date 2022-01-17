let g:netrw_altv = 1
let g:netrw_winsize = 80

function! NetrwMapping()
  " Open directory or file
  nmap <buffer> l <CR>
  " Go to upper directory
  nmap <buffer> h -
  " Select/deselect node
  nmap <buffer> <TAB> mf
  " Undo all selections
  nmap <buffer> <Leader><TAB> mu
  " Create file
  nmap <buffer> ff %:w<CR>:buffer #<CR> 
  " Rename node
  nmap <buffer> fe R

  nmap <buffer> fc mc
  nmap <buffer> fC mtmc
  nmap <buffer> fx mm
  nmap <buffer> fX mtmm
  nmap <buffer> f; mx
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END
