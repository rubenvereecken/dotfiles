" This file contains filetype fallbacks. Load once
if exists("did_load_filetypes_userafter")
  finish
endif
let did_load_filetypes_userafter = 1

augroup filetypedetect
  au BufRead,BufNewFile *.md setfiletype markdown
  au BufRead,BufNewFile *.conf setfiletype config
  au BufRead,BufNewFile *.cson setfiletype config
augroup end

