" ----------------------------------------------------------------------- "
"                               SETTINGS                                  "
" ----------------------------------------------------------------------- "
" Use case insensitive search, except when using capital letters
set smartcase
set ignorecase

" Default tab width
set ts=2
set sw=2
set sts=2
set ai
set et

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
nnoremap <CR> :let @/ = "" <bar> echo "cleared last search pattern" <CR>

" ----------------------------------------------------------------------- "
"                               MAPPINGS                                  "
" ----------------------------------------------------------------------- "

" Use the colon as a mapleader
let mapleader=","

" Tabularize shortcuts
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

map <F3> :Tabularize /=<CR>
map <F4> :Tabularize /style<CR>

" Edit the vimrc
nmap <leader>v :split $MYVIMRC<CR>

" Shortcut to rapidly toggle `set list`
nmap <Leader>l :set list!<CR>
" Shortcut to rapidly toggle `set number`
nmap <Leader>n :set nu!<CR>

" Window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
