augroup filetypedetect
  autocmd FileType go setfiletype go
  autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType xml setfiletype xml
  autocmd FileType php setfiletype php
  autocmd FileType ruby setfiletype ruby
  autocmd FileType html setfiletype html
  autocmd FileType python setfiletype python
  autocmd FileType perl setfiletype perl
  autocmd BufNewFile,BufRead *.psgi setfiletype perl
  autocmd BufNewFile,BufRead *.t    setfiletype perl
  autocmd FileType javascript setfiletype javascript
augroup END
