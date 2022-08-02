" Init
lua require('init')

" Colorscheme
colorscheme wal

" NerdCommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" Fzf
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-h': 'split',
    \ 'ctrl-v': 'vsplit' }

" Markdown folding
let g:markdown_fold_style = 'nested'

" Highlighted yank (-1 for persistent)
let g:highlightedyank_highlight_duration = 400

" NerdTree"
let g:NERDTreeDirArrowExpandable = '―'
let g:NERDTreeDirArrowCollapsible = ''

" Kitty background
let &t_ut=''

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
