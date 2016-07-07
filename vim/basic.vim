""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

syntax on

" Enable filetype plugins and indentation
filetype plugin indent on

" Filetype stuff that I can't put in folders
au BufRead,BufNewFile *.md set filetype=markdown

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" Refreshes the main .vimrc and Airline
nmap <C-g><C-g> :source ~/.vimrc<cr>:AirlineRefresh<cr>

" Have a paste toggle that can easily switch to Paste mode for unmodified pastes
set pastetoggle=<leader>pp
noremap <Leader>p "+p
noremap <Leader>P "+P
nmap <Leader>yy "+yy
vmap <Leader>y "+y

" Some daring shortcuts
" Switch to Normal mode by double tapping 'j'
inoremap jj <Esc>
" Switch to Normal and Save
inoremap jw <Esc>:w<CR>
" Switch to Normal, Save aaaand Quit
inoremap jq <Esc>:wq<CR>
" Switch to Normal and Undo
" inoremap ju <Esc>u<CR>
" Complement J, split line
nnoremap K i<CR><Esc>

inoremap <leader>; <C-o>m`<C-o>A;<C-o>``

" Fast saving
nmap <leader>w :w!<CR>
nmap <leader>q :q<CR>
nmap <leader>wq :wq<CR>

"""""""""""""""""""""""""""""""
" => Language specific
"""""""""""""""""""""""""""""""
" TODO remove this once you'll never touch Tiny ever again
au BufRead,BufNewFile *.tiny setfiletype c
" For autocompletion (compdef) files, which do not have an extension
" au BufRead,BufNewFile _* zsh

"""""""""""""""""""""""""""""""
" => Shortcuts for programming
" """""""""""""""""""""""""""""
" inoremap {<CR> {<CR>}<C-o>O
" Shortcut for search-replace of the whole current word
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=.git\*,.hg\*,.svn\*

"Always show current position
set ruler

" Wrap around at 80 by default
set textwidth=80

" Have a highlighted column for max line length
" I'll use 80 because it's ideal for a vsplit on my lappie
set colorcolumn=80

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1
" set foldmethod=syntax

" Use zc to restore all folds
set nofoldenable

" Enable folding with spacebar
nnoremap <Space> za

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define a toggle for line numbers
nnoremap <leader>gn :set number!<CR>
set number

" Enable syntax highlighting
syntax enable

if has("gui_running")
  set t_Co=16
  set background=dark
  colorscheme solarized
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
else
  set background=dark
  colorscheme solarized
  " Fixes stuff on big laptop
  set t_Co=8
endif

" Just a nice font I found, used in the gui only
" TODO automatically install this using dotfiles organizer
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 10
  endif
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2
set shiftround " Indent to nearest shiftwidth multiple

set listchars=tab:→\ ,trail:·
nmap <Leader>tt :set list!<CR>

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
" set cindent " Used to have smart indent, this is C-style indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
vnoremap # y/<C-R>"<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>td :Bclose<cr>

" Close all the buffers
map <leader>ta :bufdo bd<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>
nmap <M-k> :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>
nmap <M-j> :bprevious<CR>
" Close the current buffer and move to the previous one

" This replicates the idea of closing a tab
nmap <leader>tq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>tl :ls<CR>

" Vertical split
nmap <leader>v :vs<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Remap VIM 0 to first non-blank character
map 0 ^

" Improve location list use tremendously
function! <SID>LocationPrevious()
  try
    lprev
  catch /^Vim\%((\a\+)\)\=:E553/
    llast
  endtry
endfunction

function! <SID>LocationNext()
  try
    lnext
  catch /^Vim\%((\a\+)\)\=:E553/
    lfirst
  endtry
endfunction

nnoremap <silent> <Plug>LocationPrevious    :<C-u>exe 'call <SID>LocationPrevious()'<CR>
nnoremap <silent> <Plug>LocationNext        :<C-u>exe 'call <SID>LocationNext()'<CR>

" Vim diff shortcuts and whatnot

set diffopt=filler,vertical
nnoremap <silent> <leader>dp V:diffput<cr>
nnoremap <silent> <leader>do V:diffget<cr>
nnoremap <silent> <leader>dr :diffupdate<cr>
nnoremap <silent> <Leader>dt :call DiffToggle()<CR>
" nnoremap <silent> <leader>df :diffoff!<CR>
" nnoremap <silent> <leader>dt :diffthis<CR>
nmap <silent> <leader>du :wincmd w<cr>:normal u<cr>:wincmd w<cr>

function! DiffToggle()
    if &diff
        diffoff
    else
        diffthis
    endif
:endfunction
