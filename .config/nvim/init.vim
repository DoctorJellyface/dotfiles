"                               ----------                                 "
" ------------------------------ Vim-Plug -------------------------------- "
"                               ----------                                 "

" Install Vim-Plug if unavailable
if has('nvim')
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

" Load plugins
call plug#begin('~/.local/share/nvim/plugged')

" Start of something sensible if we aren’t in NeoVim
if !has('nvim')
  Plug 'tpope/vim-sensible'
endif

" Solarized!
Plug 'altercation/vim-colors-solarized'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" You need to align stuff evey now and then
Plug 'godlygeek/tabular'

" Comes in handy
Plug 'scrooloose/syntastic'

" Syntax
Plug 'plasticboy/vim-markdown'
Plug 'chikamichi/mediawiki.vim'
Plug 'matt-deacalion/vim-systemd-syntax'
Plug 'rust-lang/rust.vim'

" GnuPG
Plug 'jamessan/vim-gnupg'

" C#
"Plug 'omnisharp/omnisharp-vim'
"Plug 'shougo/vimproc.vim'

" Writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

call plug#end()

"                              ----------                                 "
" ----------------------------- SETTINGS -------------------------------- "
"                              ----------                                 "

" Solarized!
colorscheme solarized

" Non-emo mode
set background=light

" Numbers are useful
set number
set relativenumber

" Use case insensitive search, except when using capital letters
set smartcase
set ignorecase

" Default tab width
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Make line scrolling less of a pain
set scrolloff=3

" Lengthen the wait to be able to use leader commands when using vim-sensible
if !has('nvim')
  set timeoutlen=250
endif

" Ask instead of complaining
set confirm

" Avoid trouble with Markdown lists
set flp+=\\\|^\\*\\s*

" Work-around the fact that when this is going to be used
" in a Windows environment it's going to suck
if has('gui_win32')
  " Use a usable font availbe on most machines
  set guifont=Courier\ New:h11

else
  " Use powerline symbols
  let g:airline_powerline_fonts=1

  " Symbolize symbols
  set listchars=tab:▸\ ,eol:↵

endif

" Trailing whitespace higlighting with solarized
let g:solarized_hitrail=1

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Cursor line is nice
set cursorline

" But only show it when useful
if has("autocmd")
  autocmd WinEnter    * set cursorline
  autocmd WinLeave    * set nocursorline
  autocmd InsertEnter * set nocursorline
  autocmd InsertLeave * set cursorline
endif

"                              ----------                                 "
" ----------------------------- MAPPINGS ------------------------------   "
"                              ----------                                 "

" Clear search when pressing escape
nnoremap <CR> :let @/ = "" <bar> echo "hľadaný výraz vyčistený" <CR>

" Window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" ---------------------- "
" -- Leader shortcuts -- "
" ---------------------- "

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

" Toggle invisibles
nmap <Leader>l :set list!<CR>

" Toggle numbers
nmap <Leader>n :set number! relativenumber!<CR>

" Writing mode
nmap <Leader>g :Goyo<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Quickly edit macros
nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
