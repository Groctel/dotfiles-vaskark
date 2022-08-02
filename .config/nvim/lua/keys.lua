-- map function
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- save
map('n', '<C-S>', ':w<CR>')
map('v', '<C-S>', '<ESC>:w<CR>')
map('i', '<C-S>', '<ESC>:w<CR>')

-- copy
map('v', '<C-C>', 'y')

-- paste
map('i', '<C-V>', '<ESC>pa')
map('c' , '<C-V>', '<C-r>0')

-- cycle window
map('n', '<M-o>', '<C-W>w')
map('v', '<M-o>', '<C-W>w')
map('t', '<M-o>', '<ESC><C-W>w')
map('i', '<M-o>', '<ESC><C-W>w')

-- move window
map('n', '<M-h>', '<C-W>h')
map('n', '<M-j>', '<C-W>j')
map('n', '<M-k>', '<C-W>k')
map('n', '<M-l>', '<C-W>l')

-- resize window
map('n', '<C-M-H>', '5<C-w><')
map('n', '<C-M-L>', '5<C-w>>')
map('n', '<C-M-K>', '<C-w>-')
map('n', '<C-M-J>', '<C-w>+')

-- move
map('i', '<M-h>', '<left>')
map('i', '<M-j>', '<down>')
map('i', '<M-k>', '<up>')
map('i', '<M-l>', '<right>')

-- mimic shell movements
map('i', '<C-A>', '<ESC>I')
map('i', '<C-E>', '<ESC>A')

-- clear search highlighting
map('n', '<silent><ESC>', ':noh<return><ESC>')

-- refresh file
map('n', '<F5>', ':e!<CR>')

-- fzf
map('n', '<leader>f', '<ESC>:FZF<CR>')
map('n', '<leader>F', '<ESC>:FZF ~<CR>')

-- nerdtree
map('n', '<leader>n', '<ESC>:NERDTreeToggle<CR>')

-- quit
map('n', '<C-W>q', ':q<CR>')
