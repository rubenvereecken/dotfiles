"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 5
set laststatus=2
" Refresh Airline colors
nmap <C-g><C-a> :AirlineRefresh<cr>

" Sensible syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
" HTML
let g:syntastic_html_checkers = []
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_html_tidy_blocklevel_tags = ['md-sidenav','md-toolbar','md-button','md-not-found','md-autocomplete','md-content','md-card','md-card-content','md-item-template', 'md-dialog', 'md-input-container', 'md-dialog-content']
let g:syntastic_html_tidy_ignore_errors = ['is not recognized', 'is not approved', 'proprietary']

let g:syntastic_javascript_checkers = ['gjslint', 'closurecompiler']
let g:syntastic_javascript_closurecompiler_script = 'closure-compiler'

let g:syntastic_go_checkers = ['golint']

" Have some shortcuts for Syntastic
nnoremap <leader>st :SyntasticToggleMode<CR>
nnoremap <leader>ss :SyntasticCheck<CR>
nnoremap <leader>sr :SyntasticReset<CR>

" Syntastic can be annoying for some languages, so switch it to passive
let g:syntastic_mode_map = {
      \ "mode": "active",
      \ "active_filetypes": ["go"],
      \ "passive_filetypes": ["html"]}

" DelimitMate auto-inserts brackets and puts cursor in the wanted position
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1
autocmd FileType lisp let delimitMate_offByDefault = 1

" Since DelimitMate is having trouble, have a toggle
" nnoremap <leader>dt :DelimitMateSwitch<CR>

" NERDTree is a file explorer
let NERDTreeWinPos = "right"

nnoremap <Leader>nn :NERDTreeToggle<CR>
nnoremap <Leader>nt :NERDTree
nnoremap <Leader>nf :NERDTreeFind<CR>

" Start vim with a NERD Tree
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

" CtrlP working path is current directory of file
let g:ctrlp_working_path_mode = 'c'

" Remap CamelCase motion
map 'w <Plug>CamelCaseMotion_w
map 'b <Plug>CamelCaseMotion_b
map 'e <Plug>CamelCaseMotion_e

" Slimv
let g:slimv_disable_scheme = 1
let g:slimv_disable_closure = 1
let g:slimv_keybindings = 2 
let g:slimv_leader = ","
let g:slimv_menu = 1
let g:slimv_swank_cmd = '! x-terminal-emulator -e sbcl --load /home/ruben/.vim/bundle/slimv/slime/start-swank.lisp &'

" Haskellmode
au BufEnter *.hs compiler ghc
let g:haddock_browser="/usr/bin/google-chrome"
let g:haddock_browser_callformat='%s "%s" >/dev/null 2>&1 &'

" Simpylfold for Python (yes, spelled correctly)
let g:SimpylFold_docstring_preview = 1
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" Emmet for HTML and CSS
let g:emmet_html5=1
let g:user_emmet_leader_key='<C-E>'
