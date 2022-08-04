-- map function
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- save
map('n', '<C-S>', ':w<cr>')
map('v', '<C-S>', '<esc>:w<cr>')
map('i', '<C-S>', '<esc>:w<cr>')

-- copy
map('v', '<C-C>', 'y')

-- paste
map('i', '<C-V>', '<esc>pa')
map('c', '<C-V>', '<C-r>0')

-- cycle window
map('n', '<M-o>', '<C-W>w')
map('v', '<M-o>', '<C-W>w')
map('t', '<M-o>', '<esc><C-W>w')
map('i', '<M-o>', '<esc><C-W>w')

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
map('i', '<C-A>', '<esc>I')
map('i', '<C-E>', '<esc>A')

-- clear search highlighting
map('n', '<silent><esc>', ':noh<return><esc>')

-- refresh file
map('n', '<F5>', ':e!<cr>')

-- fzf
-- map('n', '<leader>f', '<esc>:FZF <cr>', { noremap = true })
-- map('n', '<leader>F', '<esc>:FZF ~<cr>', {noremap = true })

-- telescope
-- map('n', '<leader>ff', '<cmd>lua require('telescope.builtin').find_files()<cr>')
map('n', '<leader>ff', ':Telescope find_files<cr>')
map('n', '<leader>fb', ':Telescope buffers<cr>')
map('n', '<leader>fg', ':Telescope live_grep<cr>')
map('n', '<leader>fh', ':Telescope help_tags<cr>')
map('n', '<leader>fm', ':Telescope man_pages<cr>')

-- nerdtree
map('n', '<leader>n', '<esc>:NERDTreeToggle<cr>')

-- quit
map('n', '<C-W>q', ':q<cr>')
