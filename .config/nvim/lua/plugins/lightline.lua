vim.cmd[[
let g:lightline = {
    \ 'colorscheme': 'wal'
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
    \ 'left': [ [ ] ],
    \ 'right': [ ['tabs'] ] 
    \ }

let g:lightline.tab = {
    \ 'active': [ 'tabnum', 'filename', 'modified' ],
    \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
    \ }

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
    \ 'sep': ''
    \ }

" let g:lightline.mode_map = {
   " " \ 'n' : 'N',
   " " \ 'i' : 'I',
   " " \ 'R' : 'R',
   " " \ 'v' : 'V',
   " " \ 'V' : 'L',
   " " \ "\<C-v>": 'B',
   " " \ 'c' : 'C',
   " " \ 's' : 'S',
   " " \ 'S' : 'S-LINE',
   " " \ "\<C-s>": 'S-BLOCK',
   " " \ 't': 'T',
   " " \ }

let g:lightline.separator = {
    \   'left': '', 'right': ''
    \ }
let g:lightline.subseparator = {
    \   'left': '', 'right': ''
    \ }

" let g:lightline.separator = {
    " \   'left': '', 'right': ''
    " \ }
" let g:lightline.subseparator = {
    " \   'left': '', 'right': ''
    " \ }

" let g:lightline.separator = {
    " \   'left': '', 'right': ''
    " \ }
" let g:lightline.subseparator = {
    " \   'left': '', 'right': ''
    " \ }

let g:lightline.tabline_separator = g:lightline.separator
let g:lightline.tabline_subseparator = g:lightline.subseparator

let g:lightline.enable = {
    \ 'statusline': 1,
    \ 'tabline': 1
    \ }
]]
