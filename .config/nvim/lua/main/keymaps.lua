-- map function
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
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

-- cycle tabs
map('n', '<M-t>', 'gt')
map('v', '<M-t>', 'gt')
map('t', '<M-t>', 'gt')
map('i', '<M-t>', 'gt')
-- map('n', '<tab>', 'gt')

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
map('n', '<esc>', ':noh<return><esc>')

-- refresh file
map('n', '<F5>', ':e!<cr>')

-- reload configuration without restart nvim
map('n', '<leader>r', ':so %<cr>')

-- telescope
map('n', '<leader>ff', ':Telescope find_files theme=dropdown<cr>')
map('n', '<leader>fb', ':Telescope buffers theme=dropdown<cr>')
map('n', '<leader>fg', ':Telescope live_grep theme=dropdown<cr>')
map('n', '<leader>fh', ':Telescope help_tags theme=dropdown<cr>')
map('n', '<leader>fm', ':Telescope man_pages theme=dropdown<cr>')

-- nvimtree
map('n', '<leader>n', '<esc>:NvimTreeToggle<cr>')

-- alpha
map('n', '<leader>a', '<esc>:Alpha<cr>')

-- bufferline
map('n', '<Tab>', ':BufferLineCycleNext<cr>')
map('n', '<S-Tab>', ':BufferLineCyclePrev<cr>')

-- toggleterm
map('n', '<leader>t', ':ToggleTerm<cr>')

-- quit
map('n', '<C-W>q', ':q<cr>')
