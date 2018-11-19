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
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = [] " Combines

" Have some shortcuts for Syntastic
nnoremap <leader>st :SyntasticToggleMode<CR>
nnoremap <leader>ss :SyntasticCheck<CR>
nnoremap <leader>sr :SyntasticReset<CR>

" Syntastic can be annoying for some languages, so switch it to passive
let g:syntastic_mode_map = {
      \ "mode": "passive",
      \ "active_filetypes": ["go"],
      \ "passive_filetypes": ["html"]}

" Pymode
" let g:pymode_debug = 1
let g:pymode_virtualenv = 0
let g:pymode_run = 0
let g:pymode_doc = 0
let g:pymode_doc_bind = 'K' " default K

" The lint checkers and ignore option both seem not to work :(((
let g:pymode_python = 'python3'
let g:pymode_lint_on_write = 0
" let g:pymode_lint_ignore = ["E501"] " default E501,W
let g:pymode_lint_ignore = ["E221, E251"]
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
let g:pymode_lint_options_mccabe = { 'complexity': 15 }

" Decided I don't like rope so much for now
let g:pymode_rope = 0
" Auto-complete on <C-Space>
let g:pymode_rope_completion = 0
let g:pymode_rope_completion_on_dot = 0
let g:pymode_rope_goto_definition_cmd = 'e' " or new, vnew
" let g:pymode_rope_regenerate_on_write = 0


" DelimitMate auto-inserts brackets and puts cursor in the wanted position
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1

" Since DelimitMate is having trouble, have a toggle
" nnoremap <leader>dt :DelimitMateSwitch<CR>

" NERDTree is a file explorer
let NERDTreeWinPos = "right"

" Don't show some files
let NERDTreeIgnore = ['\.pyc$']

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
" https://github.com/tmhedberg/SimpylFold/issues/27
" autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
" autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

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
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

" vimtex
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : 'build',
    \}
" let g:vimtex_view_general_viewer = 'okular'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
" let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_view_general_viewer = 'zathura'

let g:vimtex_latexmk_continuous=1
let g:vimtex_fold_enabled=1
let g:vimtex_quickfix_ignore_all_warnings=1
let g:vimtex_quickfix_mode=2
" Ignore certain warnings
let g:vimtex_quickfix_latexlog = {
      \ 'default' : 1,
      \ 'general' : 1,
      \ 'references' : 1,
      \ 'overfull' : 1,
      \ 'underfull' : 1,
      \ 'font' : 1,
      \ 'packages' : {
      \   'default' : 1,
      \   'natbib' : 1,
      \   'biblatex' : 1,
      \   'babel' : 1,
      \   'hyperref' : 0,
      \   'scrreprt' : 1,
      \   'fixltx2e' : 1,
      \   'titlesec' : 1,
      \ },
      \}
" Just plain vim but I would expect to see it here
" No-fancy tex files will still get latex filetype
let g:tex_flavor = "latex"

" gruvbox
let g:gruvbox_contrast_light="hard"
let g:gruvbox_contrast_dark="medium"
" let g:gruvbox_improved_strings=1
" let g:gruvbox_improved_warnings=1

" Tagbar
" Requires `ctags` to be installed
nmap <F8> :TagbarToggle<CR>
nmap <Leader>o :TagbarShowTag<CR>

" CtrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
