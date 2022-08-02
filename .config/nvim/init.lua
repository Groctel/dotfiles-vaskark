-- init
require('autocmd')
require('keys')
require('plugins')
require('settings')

-- colors
vim.cmd('colorscheme wal')

-- lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'pywal',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- markdown folding
vim.api.nvim_set_var('markdown_fold_style','nested')

-- highlighted yank
vim.api.nvim_set_var('highlightedyank_highlight_duration', 400)

-- nerdcommenter
vim.api.nvim_set_var('NERDCreateDefaultMappings', 1)
vim.api.nvim_set_var('NERDSpaceDelims', 1)
vim.api.nvim_set_var('NERDDefaultAlign', 'left')
vim.api.nvim_set_var('NERDCommentEmptyLines', 1)
vim.api.nvim_set_var('NERDTrimTrailingWhitespace', 1)
vim.api.nvim_set_var('NERDToggleCheckAllLines', 1)

-- nerdtree
vim.api.nvim_set_var('NERDTreeDirArrowExpandable', '-')
vim.api.nvim_set_var('NERDTreeDirArrowCollapsible', '')
