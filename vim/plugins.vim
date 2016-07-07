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

" Have some shortcuts for Syntastic
nnoremap <leader>st :SyntasticToggleMode<CR>
nnoremap <leader>ss :SyntasticCheck<CR>
nnoremap <leader>sr :SyntasticReset<CR>

" Syntastic can be annoying for some languages, so switch it to passive
" let g:syntastic_mode_map = {
"       \ "mode": "active",
"       \ "active_filetypes": ["go"],
"       \ "passive_filetypes": ["html"]}

" DelimitMate auto-inserts brackets and puts cursor in the wanted position
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1

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

" Remap CamelCase motion
" map 'w <Plug>CamelCaseMotion_w
" map 'b <Plug>CamelCaseMotion_b
" map 'e <Plug>CamelCaseMotion_e

" Haskellmode
" au BufEnter *.hs compiler ghc
" let g:haddock_browser="/usr/bin/google-chrome"
" let g:haddock_browser_callformat='%s "%s" >/dev/null 2>&1 &'

" Simpylfold for Python (yes, spelled correctly)
let g:SimpylFold_docstring_preview = 1
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" Emmet for HTML and CSS
let g:emmet_html5=1
let g:user_emmet_leader_key='<C-E>'

" CoffeeScript
" autocmd QuickFixCmdPost * nested botright cwindow
" autocmd BufWritePost *.coffee silent make
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:C_Ctrl_j = 'off'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
