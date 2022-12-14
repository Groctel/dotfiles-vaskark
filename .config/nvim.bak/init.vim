" Plug.vim
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'nelstrom/vim-markdown-folding'
    Plug 'machakann/vim-highlightedyank'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash --no-fish' }
    Plug 'dylanaraps/wal.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'kovetskiy/sxhkd-vim'
call plug#end()

" Leader
" let mapleader=";"

" Options
filetype plugin indent on
syntax on
scriptencoding utf-8
colorscheme wal

set undofile
set visualbell errorbells
set nocursorline
set scrolloff=1
set sidescrolloff=5
set number relativenumber
set matchpairs+=<:>
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set clipboard=unnamedplus
set notimeout
set smarttab
set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4
set smartindent
set autoindent
set nocompatible
set hidden
set mouse=a
set ignorecase
set smartcase
set inccommand=nosplit
set noshowmode
set wildmenu
set encoding=utf8
set fillchars=vert::

" Ctrl-S (Save)
nmap <C-S> :w<cr>
vmap <C-S> <esc>:w<cr>
imap <C-S> <esc>:w<cr>

" Control-C (Copy)
vmap <C-C> y

" Control-V (Paste)
imap <C-V> <esc>pa
cmap <C-V> <C-r>0

" Cycle windows
nmap <M-o> <C-W>w
vmap <M-o> <C-W>w
tmap <M-o> <esc><C-W>w
imap <M-o> <esc><C-W>w

" Window move
nmap <M-h> <C-w>h
nmap <M-j> <C-w>j
nmap <M-k> <C-w>k
nmap <M-l> <C-w>l

" Window resize
nmap <C-M-H> 5<C-w><
nmap <C-M-L> 5<C-w>>
nmap <C-M-K> <C-w>-
nmap <C-M-J> <C-w>+

" Insert movement
imap <M-h> <left>
imap <M-j> <down>
imap <M-k> <up>
imap <M-l> <right>
imap <M-f> <C-right>
imap <M-b> <C-left>

" Manually refresh file
nmap <F5> :e!<cr>

" Restore cursor shape to beam on exit
augroup restore_cursor_shape
  autocmd!
  au VimLeave * set guicursor=a:ver10-blinkoff0
augroup END

" Restore last cursor position and marks on open
au BufReadPost *
         \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
         \ |   exe "normal! g`\""
         \ | endif

" Clear search highlighting with Escape key
nnoremap <silent><esc> :noh<return><esc>

" Kitty background
let &t_ut=''

" Nerdtree
nnoremap <leader>n :NERDTreeToggle<cr>
let g:NERDTreeDirArrowExpandable = '―'
let g:NERDTreeDirArrowCollapsible = ''

" NerdCommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" Fzf
nnoremap <leader>f :FZF<cr>
nnoremap <leader>F :FZF ~<cr>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'window': { 'width': 0.60, 'height': 0.5, 'relative': v:true } }

" Markdown folding
let g:markdown_fold_style = 'nested'

" Highlighted yank (-1 for persistent)
let g:highlightedyank_highlight_duration = 400

" Lightline
let g:lightline = {
    \ 'colorscheme': 'wal',
    \ }

let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'gitbranch', 'readonly', 'filename', 'modified' ],
    \           [ ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'filetype', 'fileencoding' ] ]
    \ }

let g:lightline.inactive = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'filetype', 'fileencoding' ] ]
    \ }

let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ],
    \ 'right': [ ] }

let g:lightline.tab = {
    \ 'active': [ 'tabnum', 'filename', 'modified' ],
    \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }

let g:lightline.component = {
    \ 'gitbranch': '%{FugitiveHead()}',
    \ 'mode': '%{lightline#mode()}',
    \ 'absolutepath': '%F',
    \ 'relativepath': '%f',
    \ 'filename': '%t',
    \ 'modified': '%M',
    \ 'bufnum': '%n',
    \ 'paste': '%{&paste?"PASTE":""}',
    \ 'readonly': '%R',
    \ 'charvalue': '%b',
    \ 'charvaluehex': '%B',
    \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
    \ 'fileformat': '%{&ff}',
    \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
    \ 'percent': '%3p%%',
    \ 'percentwin': '%P',
    \ 'spell': '%{&spell?&spelllang:""}',
    \ 'lineinfo': '%3l:%-2v',
    \ 'line': '%l',
    \ 'column': '%c',
    \ 'close': '%999X X ',
    \ 'winnr': '%{winnr()}',
    \ 'sep1': ''
    \}

" let g:lightline.mode_map = {
"    \ 'n' : 'N',
"    \ 'i' : 'I',
"    \ 'R' : 'R',
"    \ 'v' : 'V',
"    \ 'V' : 'L',
"    \ "\<C-v>": 'B',
"    \ 'c' : 'C',
"    \ 's' : 'S',
"    \ 'S' : 'S-LINE',
"    \ "\<C-s>": 'S-BLOCK',
"    \ 't': 'T',
"    \ }

let g:lightline.separator = {
    \   'left': '', 'right': ''
    \}
let g:lightline.subseparator = {
    \   'left': '', 'right': ''
    \}

let g:lightline.tabline_separator = g:lightline.separator
let g:lightline.tabline_subseparator = g:lightline.subseparator

let g:lightline.enable = {
    \ 'statusline': 1,
    \ 'tabline': 1
    \ }
