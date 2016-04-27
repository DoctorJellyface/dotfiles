" ----------------------------------------------------------------------- "
"                               SETTINGS                                  "
" ----------------------------------------------------------------------- "

" Use case insensitive search, except when using capital letters
set smartcase
set ignorecase

" Default tab width
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set expandtab

" Shorten the wait between mode changes
set timeoutlen=250

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Ask instead of complaining
set confirm

" Use powerline symbols
let g:airline_powerline_fonts=1

" Trailing whitespace higlighting with solarized
let g:solarized_hitrail=1

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Clear search when pressing escape
nnoremap <CR> :let @/ = "" <bar> echo "hľadaný výraz vyčistený" <CR>

" Cursor line is nice
set cursorline

" But only show it when useful
if has("autocmd")
  autocmd WinEnter    * set cursorline
  autocmd WinLeave    * set nocursorline
  autocmd InsertEnter * set nocursorline
  autocmd InsertLeave * set cursorline
endif

" ----------------------------------------------------------------------- "
"                               MAPPINGS                                  "
" ----------------------------------------------------------------------- "

" Use the colon as a mapleader
let mapleader=","

" Align shortcuts
if exists(":Align")
  nmap <Leader>= :Align =<CR>
  vmap <Leader>= :Align =<CR>
  nmap <F3> :Align =<CR>
  vmap <F3> :Align =<CR>
endif

" Tabularize shortcuts
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
  nmap <F3> :Tabularize /=<CR>
  vmap <F3> :Tabularize /=<CR>
  nmap <F4> :Tabularize /style<CR>
  vmap <F4> :Tabularize /style<CR>
endif

" Edit the vimrc
nmap <leader>v :split $MYVIMRC<CR>

" Shortcut to rapidly toggle `set list`
nmap <Leader>l :set list!<CR>
" Shortcut to rapidly toggle `set number`
nmap <Leader>n :set nu!<CR>

" Quickly edit macros
nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" Window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
