augroup filetypedetect
  au BufRead,BufNewFile *.rb   setfiletype ruby
  au BufRead,BufNewFile *.py   setfiletype python
  au BufRead,BufNewFile *.php  setfiletype php
  au BufRead,BufNewFile *.html setfiletype html
  au BufRead,BufNewFile *.xml  setfiletype xml
  au BufRead,BufNewFile *.js   setfiletype javascript
augroup END
